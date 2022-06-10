package com.meal.common.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.meal.admin.service.AdminService;
import com.meal.admin.vo.AdminVO;
import com.meal.cart.service.CartService;
import com.meal.cart.vo.CartVO;
import com.meal.goods.service.GoodsService;
import com.meal.goods.vo.GoodsVO;
import com.meal.member.service.MemberService;
import com.meal.member.vo.MemberVO;
import com.meal.seller.service.SellerService;
import com.meal.seller.vo.SellerVO;

@Controller
public class BaseController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\Meal\\Image\\temp";
//	private static final Logger logger = LoggerFactory.getLogger(BaseController.class);

	@Autowired
	private MemberService memberService;
	@Autowired
	private SellerService sellerService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private SellerVO sellerVO;
	@Autowired
	private AdminVO adminVO;
	@Autowired
	private CartVO cartVO;
	@Autowired
	BCryptPasswordEncoder passwordEncode;

	@RequestMapping(value = "/main/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(@RequestParam(value = "message", required = false) String message,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		// 메인창에 띄워줄 상품 정보를 저장 추후 인기상품에 대한 쿼리는 스케줄러로 추가예정
		Map<String, List<GoodsVO>> goodsMap = (Map<String, List<GoodsVO>>) goodsService.selectAllGoods();
		System.out.println("베이스컨트롤러 메인 메소드");
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsMap", goodsMap);
		mav.addObject("message", message);
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/*/*.do", method = { RequestMethod.POST, RequestMethod.GET })
	protected ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");// 인터셉터있을때 없으면주석
		/* String viewName = (String)request.getAttribute("viewName"); 인터셉터없을때 */
		ModelAndView mav = new ModelAndView(viewName);
		//logger.info("=================================");
		//logger.info("BaseController의 " + "/*/*.do : [" + viewName+"]");
		//logger.info("=================================");
		
		return mav;
	}

	@RequestMapping(value = "/err/error404.do", method = { RequestMethod.POST, RequestMethod.GET })
	protected ModelAndView errForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");// 인터셉터있을때 없으면주석
		/* String viewName = (String)request.getAttribute("viewName"); 인터셉터없을때 */
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	@RequestMapping(value = "/err/error500.do", method = { RequestMethod.POST, RequestMethod.GET })
	protected ModelAndView errForm500(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");// 인터셉터있을때 없으면주석
		/* String viewName = (String)request.getAttribute("viewName"); 인터셉터없을때 */
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	protected List<HashMap<String, Object>> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<HashMap<String, Object>> filelist1 = new ArrayList<HashMap<String, Object>>();

		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {

			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			// 파일 업로드중 내부에 파일을 업로드 하지 않는것들을 걸러내는 과정
			if ((originalFileName.equals("") || originalFileName == null)) {
				continue;
			}
			// 이미지 이동+이미지를 DB에 저장하기 위한 List <Map>
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("cate", fileName);
			map.put("fileName", originalFileName);
			filelist1.add(map);

			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
			if (mFile.getSize() != 0) { // File Null Check
				if (!file.exists()) { // 파일명 존재하는지
					if (file.getParentFile().mkdirs()) { // 부모 폴더확인
						file.createNewFile(); // 부모폴더 생성
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName));
				// 파일 이름 변환
			}
		}
		return filelist1;
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String u_id = loginMap.get("u_id");
		String u_pw = loginMap.get("u_pw");
		/*logger.info("=========================================");
		logger.info("u_id: " + u_id);
		logger.info("u_pw: " + u_pw);
		logger.info("=========================================");
*/
		if (u_id == null || u_id=="") {
			String viewName = "/main/loginForm";
			String message = "아이디를 입력해주세요.";
			mav.setViewName(viewName);
			mav.addObject("message", message);
			return mav;
		}
		if (u_pw == null || u_pw == "") {
			String viewName = "/main/loginForm";
			String message = "비밀번호를 입력해주세요.";
			mav.setViewName(viewName);
			mav.addObject("message", message);
			return mav;
		}

		MemberVO memberInfo = memberService.decode(u_id);
		SellerVO sellerInfo = sellerService.decode(u_id);
		AdminVO adminInfo = adminService.decode(u_id);
		try {
			if (memberInfo != null) {
				if (passwordEncode.matches(u_pw, memberInfo.getU_pw())) {
					memberInfo.setU_pw(u_pw);
					session = request.getSession();
					// 회원 마지막 접속일 기입
					memberService.lastLog(u_id);
					session.setAttribute("isLogOn", true);
					session.setAttribute("memberInfo", memberInfo);
					String viewName = "redirect:/main/main.do";
					addGoodsInQuick(session);
					mav.setViewName(viewName);
					return mav;
				} else {
					String message = "회원정보가 일치하지 않습니다.";
					mav.addObject("message", message);
					mav.setViewName("/main/loginForm");
					return mav;
				}
			}else if (sellerInfo != null) {
				if (passwordEncode.matches(u_pw, sellerInfo.getS_pw())) {
					sellerInfo.setS_pw(u_pw);
					// 판매자 마지막 접속일 기입
					sellerService.lastLog(u_id);
					session.setAttribute("isLogOn", true);
					session.setAttribute("sellerInfo", sellerInfo);
					System.out.println(sellerVO);
					String viewName = "redirect:/main/main.do";
					mav.setViewName(viewName);
					return mav;
				} else {
					String message = "비밀번호를 확인해주세요.";
					mav.addObject("message", message);
					mav.setViewName("/main/loginForm");
					return mav;
				}
			} else if (adminInfo != null) {
				if (passwordEncode.matches(u_pw, adminInfo.getA_pw())) {
					// 어드민의 경우 최종 접속일을 기입하지 않는다.
					session.setAttribute("isLogOn", true);
					session.setAttribute("adminInfo", adminInfo);
					System.out.println(u_pw);
					System.out.println(adminVO);
					String viewName = "redirect:/main/main.do";
					mav.setViewName(viewName);
					return mav;

				} else {
					String message = "비밀번호를 확인해주세요.";
					mav.addObject("message", message);
					mav.setViewName("/main/loginForm");
					return mav;
				}
			}else {
				String message = "등록된 회원이 없습니다.";
				mav.addObject("message", message);
				mav.setViewName("/main/loginForm");
				return mav;
			
			}
		} catch (Exception e) {
			String message = "등록된 회원이 없습니다..";
			mav.addObject("message", message);
			mav.setViewName("/main/loginForm");
			return mav;
		}

	}

	// 모달을 통해 업데이트 폼으로 이동하는법
	@RequestMapping(value = "/UpdateForm.do", method = RequestMethod.POST)
	public ModelAndView updateForm(@RequestParam("pw1") String pw1, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
		
		// 어드민 폼 새로 만들예정
		// AdminVO adminInfo = (AdminVO) session.getAttribute("adminInfo");

		if (memberInfo != null) {
			String id = (String) memberInfo.getU_id();
			MemberVO mem = (MemberVO) memberService.decode(id);
			if (passwordEncode.matches(pw1, mem.getU_pw())) {
				String viewName = "/member/memberUpdateForm";
				mav.setViewName(viewName);
				return mav;
			} else {
				String message = "회원정보가 일치하지 않습니다.";
				mav.addObject("message", message);
				String viewName = "redirect:/main/main.do";
				mav.setViewName(viewName);
				return mav;
			}

		} else if (sellerInfo != null) {
			String id = (String) sellerInfo.getS_id();
			SellerVO sel = (SellerVO) sellerService.decode(id);
			if (passwordEncode.matches(pw1, sel.getS_pw())) {
				String viewName = "/seller/sellerUpdateForm";
				mav.setViewName(viewName);
				return mav;
			} else {
				String message = "회원정보가 일치하지 않습니다.";
				mav.addObject("message", message);
				String viewName = "redirect:/main/main.do";
				mav.setViewName(viewName);
				return mav;
			}

		} else {
			String message = "로그인을 해주세요.";
			mav.addObject("message", message);
			String viewName = "/main/loginForm";
			mav.setViewName(viewName);
			return mav;
		}
	}

	// 해당하는것은 모달창에서 삭제 창으로 이동하는것.
	@RequestMapping(value = "/deleteForm.do", method = RequestMethod.POST)
	public ModelAndView deleteForm(@RequestParam("pw2") String pw2, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");

		if (memberInfo != null) {
			String id = (String) memberInfo.getU_id();
			MemberVO mem = (MemberVO) memberService.decode(id);
			// 유효성 검사후 경로설정
			if (passwordEncode.matches(pw2, mem.getU_pw())) {
				mav.setViewName(viewName);
				return mav;
			} else {
				String message = "회원정보가 일치하지 않습니다.";
				mav.addObject("message", message);
				viewName = "redirect:/main/main.do";
				mav.setViewName(viewName);
				return mav;
			}

		} else if (sellerInfo != null) {
			String id = (String) sellerInfo.getS_id();
			SellerVO sel = (SellerVO) sellerService.decode(id);
			if (passwordEncode.matches(pw2, sel.getS_pw())) {
				mav.setViewName(viewName);
				return mav;
			} else {
				String message = "회원정보가 일치하지 않습니다.";
				mav.addObject("message", message);
				viewName = "redirect:/main/main.do";
				mav.setViewName(viewName);
				return mav;
			}

		} else {
			String message = "로그인을 해주세요.";
			mav.addObject("message", message);
			viewName = "/main/loginForm";
			mav.setViewName(viewName);
			return mav;
		}
	}

	// 폴더 삭제에 관한 메소드
	protected static void deleteFolder(String path) {

		File folder = new File(path);
		try {
			if (folder.exists()) {
				File[] folder_list = folder.listFiles(); // 파일리스트 얻어오기

				for (int i = 0; i < folder_list.length; i++) {
					if (folder_list[i].isFile()) {// 파일리스트에 파일존재
						folder_list[i].delete();
						System.out.println("파일이 삭제되었습니다.");
					} else {// 파일리스트에파일 없으면 진입
							// 폴더일경우 폴더의 내부 경로 검색후 재귀함수 호출
						deleteFolder(folder_list[i].getPath());
						System.out.println("폴더가 삭제되었습니다.");
					}
					folder_list[i].delete();
				}
				folder.delete(); // 폴더 삭제
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	// 페이징에 관한 컨트롤러
	protected Map<String, Object> paging(Map<String, Object> map) {

		String pageNum = (String) map.get("pageNum");
		String section = (String) map.get("section");

		HashMap<String, Object> pagingMap = new HashMap<String, Object>();
		Integer page = 1;
		Integer index = 0;
		if (pageNum != null) {

			if (section != null) {
				Integer page1 = Integer.parseInt((String) pageNum);
				Integer index1 = Integer.parseInt((String) section);

				System.out.println("인덱스" + index);
				Integer start = (page1 - 1) * 10 + index1 * 100;
				Integer end = 10;
				// Integer end = (page1) * 10 + index1 * 100; 출력개수를 정함.
				pagingMap.put("start", start);
				pagingMap.put("end", end);
				System.out.println(start);
				System.out.println(end);
				System.out.println(pagingMap);
			} else {
				Integer page1 = Integer.parseInt((String) pageNum);

				Integer start = (page1 - 1) * 10 + index * 100;
				Integer end = (page1) * 10 + index * 100;
				pagingMap.put("start", start);
				pagingMap.put("end", end);
			}
		} else {
			Integer start = (page - 1) * 10 + index * 100;
			Integer end = (page) * 10 + index * 100;
			pagingMap.put("start", start);
			pagingMap.put("end", end);
		}
		return pagingMap;
	}
	
	public void addGoodsInQuick(HttpSession session) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		String u_id = memberInfo.getU_id();
		List<CartVO> quickZzimList = cartService.myZzimList(u_id);
		session.setAttribute("quickZzimList",quickZzimList);
		session.setAttribute("quickZzimListNum", quickZzimList.size());
	}


}
