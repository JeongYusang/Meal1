package com.meal.board.a.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.meal.admin.vo.AdminVO;
import com.meal.board.a.service.BaService;
import com.meal.board.a.vo.BaVO;
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

		List<HashMap<String, Object>> imageFileList = (List<HashMap<String, Object>>) upload(multipartRequest);

		// auto로 배정되는 b_a_id 찾기
		BaVO boardInfo = (BaVO) baService.findb_a_id();
		int b_a_id = (Integer) boardInfo.getB_a_id();
		AdminVO adminVO = (AdminVO)session.getAttribute("adminInfo");

		// 이미지 이동을 위한 메소드
		try {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (HashMap<String, Object> item : imageFileList) {
					// 이미지 리스트에 관하여 파일정보 MAP에 판매자 아이디를 추가시킴
					item.put("b_a_id", b_a_id);
					if (adminVO != null) {
						String reg_id = adminVO.getA_id();
						item.put("reg_id", reg_id);
					}

					// 이미지 파일네임을통해 파일경로 설정
					imageFileName = (String) item.get("fileName");
					if (!(imageFileName.equals("") || imageFileName == null)) {
						// 이미지에 해당하는 정보를 DB에 저장 g_id | fileName = originalfileName
						baService.addImg(item);
						// temp에 있는 이미지파일경로 설정
						File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + imageFileName);
						// 이동하고자 하는 이미지 파일경로 설정
						File destDir = new File(
								CURR_IMAGE_UPLOAD_PATH + "\\" + "boardA" + "\\" + "\\" + "A" + "\\" + b_a_id);
						// 이동
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
					}
				}
			}

			// 결과창에 출력해주기 위해 판매자 정보를 저장해줌
			AdminVO adminInfo = (AdminVO) session.getAttribute("adminInfo");
			mav.addObject("adminInfo", adminInfo);
			String viewName = "redirect:/main/main.do";
			mav.setViewName(viewName);
			return mav;
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
			// 에러가 날경우 temp에 있는 저장했던 이미지 파일들을 삭제 시킴
			if (imageFileList != null && imageFileList.size() != 0) {
				for (HashMap<String, Object> item : imageFileList) {
					imageFileName = (String) item.get("fileName");
					File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + imageFileName);
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
}
