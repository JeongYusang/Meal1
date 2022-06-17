package com.meal.board.a.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.meal.admin.vo.AdminVO;
import com.meal.board.a.service.BaService;
import com.meal.board.a.vo.BaVO;
import com.meal.board.a.vo.Img_aVO;
import com.meal.common.controller.BaseController;

@Controller("boardAController")
@RequestMapping("/boardA")
public class BaControllerImpl extends BaseController implements BaController {
	private String CURR_IMAGE_UPLOAD_PATH = "C:\\Meal\\Image";
	
	@Autowired
	private BaService baService;
	
	@Override
	@RequestMapping(value = "/boardAinsert.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView writeBoardA(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String imageFileName = null;
		HttpSession session = multipartRequest.getSession();
		

		HashMap<String, Object> newboardAMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name + value = " + name + " : " + value);
			newboardAMap.put(name, value);
		}
		baService.boardAWrite(newboardAMap);

		// auto로 배정되는 b_a_id 찾기
		BaVO boardInfo = (BaVO) baService.findb_a_id();
		int b_a_id = (Integer) boardInfo.getB_a_id();
		AdminVO adminInfo = (AdminVO)session.getAttribute("adminInfo");
		if (adminInfo == null) {
			String viewName = "redirect:/main/main.do";
			String message = "판매자로 로그인 해주세요.";
			mav.addObject("message", message);
			mav.setViewName(viewName);
			return mav;
		}

		List<HashMap<String, Object>> imageFileList = (List<HashMap<String, Object>>) upload(multipartRequest);
		// 이미지 이동을 위한 메소드
		try {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (HashMap<String, Object> item : imageFileList) {
					System.out.println("구문진입");
					// 이미지 리스트에 관하여 파일정보 MAP에 판매자 아이디를 추가시킴
					item.put("b_a_id", b_a_id);
					baService.addImg(item);
					// 이미지 파일네임을통해 파일경로 설정
					imageFileName = (String) item.get("fileName");
					String cate = (String) item.get("cate");
					if (!(imageFileName.equals("fileName") || imageFileName == null)) {
						// 이미지에 해당하는 정보를 DB에 저장 b_a_id | fileName = originalfileName
						// temp에 있는 이미지파일경로 설정
						File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + imageFileName);
						System.out.println("구문진입");
						//이동하고자 하는 이미지 파일경로 설정
						File destDir = new File(
								CURR_IMAGE_UPLOAD_PATH + "\\" + "boardA" + "\\"  + b_a_id + "\\" + cate);
						// 이동
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
					}
				}
			}

			String message = "게시물이 등록되었습니다.";
			mav.addObject("adminInfo", adminInfo);
			String viewName = "redirect:/main/main.do";
			mav.addObject("message", message);
			mav.setViewName(viewName);
			return mav;
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
			// 에러가 날경우 temp에 있는 저장했던 이미지 파일들을 삭제 시킴
			if (imageFileList != null && imageFileList.size() != 0) {
				for (HashMap<String, Object> item : imageFileList) {
					imageFileName = (String) item.get("fileName");
					File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + "\\" + imageFileName);
					srcFile.delete();
					String viewName1 = "redirect:/main/main.do";
					mav.setViewName(viewName1);
					return mav;
				}
			}
			return mav;
		}
	}
	
	@Override
	@RequestMapping(value="/boardAWrite.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardAWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		AdminVO adminInfo = (AdminVO) session.getAttribute("adminInfo");
		System.out.println("-----------------------");
		System.out.println("adminInfo : " + adminInfo);
		System.out.println("-----------------------");
		
		if (adminInfo == null) {
			String viewName1 = "redirect:/main/main.do";
			String message = "잘못된 접근입니다.";
			mav.addObject("message", message);
			mav.setViewName(viewName1);
			return mav;
		} else {
			String viewName = "/boardA/boardAWrite";
			mav.setViewName(viewName);
			return mav;
		}
	}
	
	@Override
	@RequestMapping(value="/boardAList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardAList(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
		@RequestParam(value = "section1", required = false) String section,
		@RequestParam(value = "pgNum", required = false) String pgNum, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		AdminVO adminInfo = (AdminVO) session.getAttribute("adminInfo");
		
		if (adminInfo != null) {
			
			String a_id = adminInfo.getA_id();
			System.out.println("-------------");
			System.out.println(a_id);
			System.out.println("-------------");
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			
			
			HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
			pagingInfo.put("section", section);
			pagingInfo.put("pgNum", pgNum);
			HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);
		
			
			//관리자 게시판 조회를 위해 사용
			List<BaVO> boardAList = (List<BaVO>) baService.BaAllList(pagingMap);
			System.out.println("---------------------------");
			System.out.println("boardAList : " + boardAList);
			System.out.println("---------------------------");

		
			mav.addObject("boardAList", boardAList);
			mav.addObject("adminInfo", adminInfo);
			mav.setViewName(viewName);

			return mav;
		
			} else {
				String message ="잘못된 접근방법입니다.";
				String viewName1 = "redirect:/admin/selectAllMembers.do";
				mav.addObject("message", message);
				mav.setViewName(viewName1);
				return mav;
			}
}

	@Override
	@RequestMapping(value="/boardADetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardAList(@RequestParam("b_a_id") String b_a_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		AdminVO adminInfo = (AdminVO) session.getAttribute("adminInfo");
		
		int b_a_id1 = Integer.parseInt(b_a_id);
		List<Img_aVO> imgList =(List<Img_aVO>)baService.selectImgList(b_a_id1); 
		BaVO boardAInfo = (BaVO) baService.selectBaDetail(b_a_id1);
		System.out.println("---------------------------");
		System.out.println("boardAInfo : " + boardAInfo);
		System.out.println("---------------------------");
		System.out.println("imgList : " + imgList);
		System.out.println("---------------------------");

		String viewName = (String) request.getAttribute("viewName");
		mav.addObject("adminInfo", adminInfo);
		mav.addObject("imgList", imgList);
		mav.addObject("boardAInfo", boardAInfo);
		mav.setViewName(viewName);

		return mav;
	
	}
	
	@Override
	@RequestMapping(value="/boardASPList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardASPList(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
		@RequestParam(value = "section1", required = false) String section,
		@RequestParam(value = "pgNum", required = false) String pgNum,
		@RequestParam(value = "cate", required = false) String cate,
		HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
		pagingInfo.put("section", section);
		pagingInfo.put("pgNum", pgNum);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);

		List<BaVO> boardASPList = (List<BaVO>) baService.BaAllList(pagingMap);
		
		
		if ( cate == "이벤트") {
			System.out.println("---------------------------");
			System.out.println("boardASPList : " + boardASPList);
			System.out.println("---------------------------");
			
			String viewName = (String) request.getAttribute("viewName");
			mav.addObject("boardASPList", boardASPList);
			mav.setViewName(viewName);

			} else if ( cate == "공지사항") {
				System.out.println("---------------------------");
				System.out.println("boardASPList : " + boardASPList);
				System.out.println("---------------------------");
				
				String viewName = (String) request.getAttribute("viewName");
				mav.addObject("boardASPList", boardASPList);
				mav.setViewName(viewName);

			} else if ( cate == "자주묻는질문") {
				System.out.println("---------------------------");
				System.out.println("boardASPList : " + boardASPList);
				System.out.println("---------------------------");
				
				String viewName = (String) request.getAttribute("viewName");
				mav.addObject("boardASPList", boardASPList);
				mav.setViewName(viewName);

			} 
		return mav;
		}
			
	
}
