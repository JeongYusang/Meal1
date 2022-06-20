package com.meal.seller.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.meal.admin.service.AdminService;
import com.meal.admin.vo.AdminVO;
import com.meal.board.gq.service.BoardGqService;
import com.meal.board.gq.vo.BoardGqVO;
import com.meal.board.gr.service.BoardGrService;
import com.meal.board.gr.vo.BoardGrVO;
import com.meal.board.one.service.Board1Service;
import com.meal.board.one.vo.Board1VO;
import com.meal.common.controller.BaseController;
import com.meal.goods.service.GoodsService;
import com.meal.goods.vo.GoodsVO;
import com.meal.order.service.OrderService;
import com.meal.order.vo.OrderVO;
import com.meal.seller.service.SellerService;
import com.meal.seller.vo.Img_sVO;
import com.meal.seller.vo.SellerVO;

@Controller("sellerController")
@RequestMapping("/seller")
public class SellerControllerImpl extends BaseController implements SellerController {

	private String CURR_IMAGE_UPLOAD_PATH = "C:\\Meal\\Image";
	@Autowired
	private SellerService sellerService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private SellerVO sellerVO;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private BoardGqService boardGqService;
	@Autowired
	private Board1Service board1Service;
	@Autowired
	private BoardGrService boardGrService;

	@Autowired
	private Img_sVO img_sVO;
	@Autowired
	BCryptPasswordEncoder passwordEncode;

	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("sellerInfo");
		session.removeAttribute("quickZzimList");
		session.removeAttribute("quickZzimListNum");
		String message = "로그아웃이 완료되었습니다.";
		mav.addObject("message", message);
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/addSeller.do", method = RequestMethod.POST)
	public ModelAndView addSeller(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String imageFileName = null;

		HashMap<String, Object> newSellerMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name + value = " + name + " : " + value);
			newSellerMap.put(name, value);
			// 파일이 아닌것들에 대하여 맵에 집어넣음 추후 판매자INFO로 들어감
		}
		// 비밀번호 암호화 후 판매자 맵에 다시 저장시켜줌
		String s_pw = (String) newSellerMap.get("s_pw");
		String encodeu_pw = passwordEncode.encode(s_pw);
		// 비밀번호 암호화 저장
		newSellerMap.put("s_pw", encodeu_pw);
		// 셀러 info>DB
		sellerService.addSeller(newSellerMap);
		// 결과창에서 복호화되지 않은 입력값을 출력해주기 위하여 비밀번호 다시 저장

		String s_id = (String) newSellerMap.get("s_id");

		// 베이스 컨트롤러로 이동하여 파일에 대하여 C\Meal\Image\temp로 저장시켜줌
		List<HashMap<String, Object>> imageFileList = (List<HashMap<String, Object>>) upload(multipartRequest);

		// 이미지 이동을 위한 메소드
		try {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (HashMap<String, Object> item : imageFileList) {
					// 이미지 리스트에 관하여 파일정보 MAP에 판매자 아이디를 추가시킴
					item.put("s_id", s_id);
					// 이미지 파일네임을통해 파일경로 설정
					imageFileName = (String) item.get("fileName");
					String cate = (String) item.get("cate");
					if (!(imageFileName.equals("") || imageFileName == null)) {
						// 이미지에 해당하는 정보를 DB에 저장 s_id | cate = fileName |fileName = originalfileName
						sellerService.addSellerImg(item);
						// temp에 있는 이미지파일경로 설정
						File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + imageFileName);
						// 이동하고자 하는 이미지 파일경로 설정
						File destDir = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "seller" + "\\" + s_id + "\\" + cate);
						// 이동
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
					}
				}
			}
			// 결과창에 출력해주기 위해 판매자 정보를 저장해줌
			SellerVO sellerInfo = (SellerVO) sellerService.decode(s_id);
			sellerInfo.setS_pw(s_pw);
			mav.addObject("SellerInfo", sellerInfo);
			String viewName = "/member/memberResult";
			mav.setViewName(viewName);
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			// 에러가 날경우 temp에 있는 저장했던 이미지 파일들을 삭제 시킴
			if (imageFileList != null && imageFileList.size() != 0) {
				for (HashMap<String, Object> item : imageFileList) {
					imageFileName = (String) item.get("fileName");
					File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}

			String viewName1 = "/seller/sellerForm";
			mav.setViewName(viewName1);
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/updateseller.do", method = RequestMethod.POST)
	public ResponseEntity updateSeller(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		HttpSession session = multipartRequest.getSession();
		HashMap<String, Object> newSellerMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			// 정보기입을 하지 않을시 map에 넣어주지 않기위함
			// 마이바티스도 변경해야함
			if (value == null) {
				continue;
			}
			System.out.println("name + value = " + name + " : " + value);
			newSellerMap.put(name, value);
			// 파일이 아닌것들에 대하여 맵에 집어넣음 추후 판매자INFO로 들어감
		}

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			// 회원정보에 대하여 불러오기 id = 이미지위해 추출 pw = 암호화를 위해 추출
			String s_id = (String) newSellerMap.get("s_id");
			String s_pw = (String) newSellerMap.get("s_pw");
			String encodeS_pw = passwordEncode.encode(s_pw);
			newSellerMap.put("s_pw", encodeS_pw);
			// 현재 저장되어있는 이미지리스트를 불러옴
			List<Img_sVO> OldImgList = (List<Img_sVO>) sellerService.selectSellerImg(s_id);
			// 업로드한 이미지에 대하여 불러옴
			List<HashMap<String, Object>> imageFileList = (List<HashMap<String, Object>>) upload(multipartRequest);
			// 기존 이미지와 신규이미지 비교
			for (Img_sVO oldI : OldImgList) {
				for (HashMap<String, Object> newI : imageFileList) {
					String oldCate = oldI.getCate();
					String newCate = (String) newI.get("cate");
					String newImgFileName = (String) newI.get("fileName");
					String oldImgFileName = oldI.getFileName();
					newI.put("s_id", s_id);
					// 기존 이미지목록과 새로운 이미지 목록에 관한 비교문
					if (oldCate.equals(newCate)) {

						// 기존에 이미지가 있고 신규 이미지등록을 하였을경우
						if (oldImgFileName != null && newImgFileName != null) {
							String oldpath = CURR_IMAGE_UPLOAD_PATH + "\\" + "seller" + "\\" + s_id + "\\" + oldCate;
							deleteFolder(oldpath);
							// 등록할 이미지 경로설정(upload)메소드로 path내부에 이미 존재함
							File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + newImgFileName);
							// 이동하고자 하는 이미지 파일경로 설정
							File destDir = new File(
									CURR_IMAGE_UPLOAD_PATH + "\\" + "seller" + "\\" + s_id + "\\" + newCate);
							// 이동
							FileUtils.moveFileToDirectory(srcFile, destDir, true);
							// db에 있는 이미지 정보 변경해주기
							sellerService.updateSellerImg(newI);

							// 신규 이미지 등록일 경우에
						} else if (oldImgFileName == null && newImgFileName != null) {
							// 등록할 이미지 경로설정(upload)메소드로 path내부에 이미 존재함
							File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + newImgFileName);
							// 이동하고자 하는 이미지 파일경로 설정
							File destDir = new File(
									CURR_IMAGE_UPLOAD_PATH + "\\" + "seller" + "\\" + s_id + "\\" + newCate);
							// 이동
							FileUtils.moveFileToDirectory(srcFile, destDir, true);
							// DB에 저장
							sellerService.addSellerImg(newI);

						}

					}
				}
			}

			// db에서 셀러 정보 수정
			sellerService.updateSeller(newSellerMap);

			message = "<script>";
			message += " alert('회원수정이 완료되었습니다..');";
			message += " location.href='" + multipartRequest.getContextPath() + "/member/memberResult.do';";
			message += " </script>";
			SellerVO sellerInfo = (SellerVO) sellerService.decode(s_id);
			sellerInfo.setS_id(s_id);
			sellerInfo.setS_pw(s_pw);
			session.setAttribute("sellerInfo", sellerInfo);
		} catch (Exception e) {

			message = "<script>";
			message += " alert('다시 내용을 입력해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/seller/sellerForm.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/deleteSeller.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView deleteSeller(@RequestParam HashMap<String, Object> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
		SellerVO sellerInfo1 = (SellerVO) sellerService.decode(sellerInfo.getS_id());
		String pw = (String) map.get("pw");
		// 셀러 비밀번호 확인
		if (passwordEncode.matches(pw, sellerInfo1.getS_pw())) {
			// 해당 부분에 실제 이미지 파일 및 폴더에 관한 가장 상위폴더 (판매자의 경우 판매자 아이디에 관한 폴더를 적음)
			String path = CURR_IMAGE_UPLOAD_PATH + "\\" + "seller" + "\\" + sellerInfo.getS_id();
			// base controller 삭제에 관한 재귀 메소드 사용
			deleteFolder(path);
			// seller에 대한 정보 삭제
			sellerService.deleteSeller(sellerInfo);
			// 탈퇴사유 db저장

			adminService.insertReason(map);
			session.setAttribute("isLogOn", false);
			session.removeAttribute("memberInfo");
			session.removeAttribute("sellerInfo");
			session.removeAttribute("adminInfo");
			String message = "회원이 탈퇴 되었습니다.";
			mav.addObject("message", message);
			String viewName = "redirect:/main/main.do";
			mav.setViewName(viewName);
			return mav;
		}
		mav.setViewName("/main/loginForm");
		return mav;
	}

	// 관리자 창에서 판매자 확인 및 판매자창에서 판매자확인
	@Override
	@RequestMapping(value = "/sellerDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView sellerDetail(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		SellerVO sellerInfo = (SellerVO) sellerService.decode(id);

		if (sellerVO != null) {
			mav.addObject("sellerVO", sellerInfo);

			// orderList (s_id) 주문수량 + 총 결제액 + 정산 받을수 있는 금액을 제공해보려고 함 .
			// goodsList(s_id) 상품정보창에서 쓸수있게끔 만들예정

		} else {
			String message = "오류가 발생하였습니다.";
			mav.addObject("message", message);
			mav.setViewName("redirect:/main/main.do");
			return mav;
		}

		// 사이트 유효성 검사 ( 잘못된 get방식으로 들어왔을경우)
		HttpSession session = request.getSession();
		SellerVO sellerLog = (SellerVO) session.getAttribute("sellerLog");
		AdminVO adminLog = (AdminVO) session.getAttribute("adminInfo");
		if (sellerLog != null || adminLog != null) {
			return mav;
		} else {
			String message = "잘못된 경로로 이동하였습니다.";
			mav.addObject("message", message);
			mav.setViewName("redirect:/main/main.do");
			return mav;
		}
	}

	// 판매자 마이페이지 내부 주문내역 및 상품내역을 출력하기위해 사용 0614
	@Override
	@RequestMapping(value = "/sellerMypage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView sellerMypage(@RequestParam(value = "s_id", required = false) String s_id,
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminVO = (AdminVO) session.getAttribute("adminInfo");
		// 추후 admin도 추가할 예정(s_id)
		if (sellerVO != null) {
			String s_id1 = sellerVO.getS_id();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);

			HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
			pagingInfo.put("section", section);
			pagingInfo.put("pageNum", pageNum);

			HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);

			pagingMap.put("s_id", s_id1);
			// 굿즈리스트 호출을 위해 사용
			List<GoodsVO> goodsList = goodsService.selectGoodsPage(pagingMap);

			// 주문내역 확인
			List<OrderVO> orderList = orderService.orderSellerList(pagingMap);
			// 취소된 주문 확인
			List<OrderVO> orderCanceledSellerList = orderService.orderCanceledSellerList(pagingMap);

			System.out.println("---------------------------");
			System.out.println("goodsList : " + goodsList);
			System.out.println("---------------------------");
			System.out.println("sellerVO : " + sellerVO);
			System.out.println("---------------------------");
			System.out.println("orderList : " + orderList);
			System.out.println("---------------------------");

			mav.addObject("sellerVO", sellerVO);
			mav.addObject("orderList", orderList);
			mav.addObject("goodsList", goodsList);
			mav.setViewName(viewName);
			mav.addObject("orderCanceledSellerList", orderCanceledSellerList);
			return mav;
		}else if (adminVO != null) {
			sellerVO = (SellerVO) sellerService.decode(s_id);
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);

			HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
			pagingInfo.put("section", section);
			pagingInfo.put("pageNum", pageNum);

			HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);

			pagingMap.put("s_id", s_id);
			// 굿즈리스트 호출을 위해 사용
			List<GoodsVO> goodsList = goodsService.selectGoodsPage(pagingMap);

			// 주문내역 확인
			List<OrderVO> orderList = orderService.orderSellerList(pagingMap);
			// 취소된 주문 확인
			List<OrderVO> orderCanceledSellerList = orderService.orderCanceledSellerList(pagingMap);

			System.out.println("---------------------------");
			System.out.println("goodsList : " + goodsList);
			System.out.println("---------------------------");
			System.out.println("sellerVO : " + sellerVO);
			System.out.println("---------------------------");
			System.out.println("orderList : " + orderList);
			System.out.println("---------------------------");


			mav.addObject("sellerVO", sellerVO);
			mav.addObject("orderList", orderList);
			mav.addObject("goodsList", goodsList);
			mav.addObject("orderCanceledSellerList", orderCanceledSellerList);
			mav.setViewName(viewName);

			return mav;
		}
		String message = "잘못된 접근방법입니다.";
		mav.addObject("message", message);
		String viewName1 = "redirect:/main/main.do";
		mav.setViewName(viewName1);
		return mav;
		
	
	}

	
	
	@Override
	@RequestMapping(value = "/sellerBoardMypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sellerBoardMypage(@RequestParam(value = "s_id", required = false) String s_id,
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum,
			@RequestParam(value = "message", required = false) String message,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		System.out.println("진입");

		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminVO = (AdminVO) session.getAttribute("adminInfo");
		if (sellerVO != null) {
			String s_id1 = sellerVO.getS_id();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);

			HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
			pagingInfo.put("section", section);
			pagingInfo.put("pageNum", pageNum);

			HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);

			pagingMap.put("s_id", s_id1);
			// 굿즈리스트 호출을 위해 사용

			// 1대1문의 내역 확인위해 사용 0615
			List<Board1VO> board1SellerList = board1Service.selectMyBoard1List(pagingMap);
			// Board1 답변여부 확인을 위해 추가 0615
			List<Board1VO> board1A = board1Service.selectBoard1allList();
			;
			// 상품문의 내역 확인 0615
			List<BoardGqVO> boardGqSellerList = boardGqService.boardGqSellerList(pagingMap);
			// 상품문의 답변여부 확인을 위해 추가 0615
			List<BoardGqVO> boardGqA = boardGqService.selectBoardGqallList();
			// 상품후기 내역확인 0616
			List<BoardGrVO> boardGrSellerList = boardGrService.selectBoardGrSList(pagingMap);
			// 상품후기 답변여부 확인을 위해 추가 0616
			List<BoardGrVO> boardGrA = boardGrService.selectBoardGrallList();
		

			for (Board1VO item : board1SellerList) {
				for (Board1VO a : board1A) {
					if (!((int) item.getB_1_id() == (int) a.getParentNo())) {
						String compare = "N";
						item.setCompare(compare);
					} else {
						String compare = "Y";
						item.setCompare(compare);
						System.out.println("---------------------------");
						System.out.println("Board1Compare" + item.getB_1_id());
						System.out.println("---------------------------");
						break;
					}
				}
			}

			for (BoardGqVO item : boardGqSellerList) {
				for (BoardGqVO a : boardGqA) {
					if (!((int) item.getB_gq_id() == (int) a.getParentNo())) {
						String compare = "N";
						item.setCompare(compare);
					} else {
						String compare = "Y";
						item.setCompare(compare);
						System.out.println("---------------------------");
						System.out.println("BoardGqCompare" + item.getB_gq_id());
						System.out.println("---------------------------");
						break;
					}
				}
			}

			for (BoardGrVO item : boardGrSellerList) {
				for (BoardGrVO a : boardGrA) {
					if (!((int) item.getB_gr_id() == (int) a.getParentNo())) {
						String compare = "N";
						item.setCompare(compare);
					} else {
						String compare = "Y";
						item.setCompare(compare);
						System.out.println("---------------------------");
						System.out.println("BoardGrCompare" + item.getB_gr_id());
						System.out.println("---------------------------");
						break;
					}
				}
			}

			mav.addObject("boardGqSellerList", boardGqSellerList);
			mav.addObject("board1SellerList", board1SellerList);
			mav.addObject("boardGrSellerList", boardGrSellerList);
			mav.addObject("sellerVO", sellerVO);
			mav.setViewName(viewName);
			if (message != null) {
				mav.addObject("message", message);
			}

			return mav;
			
		} else if (adminVO != null) {

			
			System.out.println("진입");
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);

			HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
			pagingInfo.put("section", section);
			pagingInfo.put("pageNum", pageNum);

			HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);

			// s_id > SellerVO 만들기
			sellerVO = (SellerVO) sellerService.decode(s_id);

			pagingMap.put("s_id", s_id);
			// 굿즈리스트 호출을 위해 사용

			// 1대1문의 내역 확인위해 사용 0615
			List<Board1VO> board1SellerList = board1Service.selectMyBoard1List(pagingMap);
			// Board1 답변여부 확인을 위해 추가 0615
			List<Board1VO> board1A = board1Service.selectBoard1allList();
			;
			// 상품문의 내역 확인 0615
			List<BoardGqVO> boardGqSellerList = boardGqService.boardGqSellerList(pagingMap);
			// 상품문의 답변여부 확인을 위해 추가 0615
			List<BoardGqVO> boardGqA = boardGqService.selectBoardGqallList();
			// 상품후기 내역확인 0616
			List<BoardGrVO> boardGrSellerList = boardGrService.selectBoardGrSList(pagingMap);
			// 상품후기 답변여부 확인을 위해 추가 0616
			List<BoardGrVO> boardGrA = boardGrService.selectBoardGrallList();

			for (Board1VO item : board1SellerList) {
				for (Board1VO a : board1A) {
					if (!((int) item.getB_1_id() == (int) a.getParentNo())) {
						String compare = "N";
						item.setCompare(compare);
					} else {
						String compare = "Y";
						item.setCompare(compare);
						System.out.println("---------------------------");
						System.out.println("Board1Compare" + item.getB_1_id());
						System.out.println("---------------------------");
						break;
					}
				}
			}

			for (BoardGqVO item : boardGqSellerList) {
				for (BoardGqVO a : boardGqA) {
					if (!((int) item.getB_gq_id() == (int) a.getParentNo())) {
						String compare = "N";
						item.setCompare(compare);
					} else {
						String compare = "Y";
						item.setCompare(compare);
						System.out.println("---------------------------");
						System.out.println("BoardGqCompare" + item.getB_gq_id());
						System.out.println("---------------------------");
						break;
					}
				}
			}

			for (BoardGrVO item : boardGrSellerList) {
				for (BoardGrVO a : boardGrA) {
					if (!((int) item.getB_gr_id() == (int) a.getParentNo())) {
						String compare = "N";
						item.setCompare(compare);
					} else {
						String compare = "Y";
						item.setCompare(compare);
						System.out.println("---------------------------");
						System.out.println("BoardGrCompare" + item.getB_gr_id());
						System.out.println("---------------------------");
						break;
					}
				}
			}
			System.out.println("---------------------------");
			System.out.println("sellerVO : " + sellerVO);
			System.out.println("---------------------------");
			System.out.println("boardGqSellerList : " + boardGqSellerList);
			System.out.println("---------------------------");
			System.out.println("board1SellerList : " + board1SellerList);
			System.out.println("---------------------------");
			System.out.println("boardGrSellerList : " + boardGrSellerList);
			System.out.println("---------------------------");

			mav.addObject("boardGqSellerList", boardGqSellerList);
			mav.addObject("board1SellerList", board1SellerList);
			mav.addObject("boardGrSellerList", boardGrSellerList);
			mav.addObject("sellerVO", sellerVO);
			mav.setViewName(viewName);
			if (message != null) {
				mav.addObject("message", message);
			}

			return mav;

		} else {
			message = "잘못된 접근방법입니다.";
			mav.addObject("message", message);
			String viewName1 = "redirect:/main/main.do";
			mav.addObject("message", message);
			mav.setViewName(viewName1);
			return mav;
		}
	}

}