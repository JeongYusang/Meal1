package com.meal.goods.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.meal.board.gq.service.BoardGqService;
import com.meal.board.gq.vo.BoardGqVO;
import com.meal.board.gr.service.BoardGrService;
import com.meal.board.gr.vo.BoardGrVO;
import com.meal.common.controller.BaseController;
import com.meal.goods.service.GoodsService;
import com.meal.goods.vo.GoodsVO;
import com.meal.goods.vo.Img_gVO;
import com.meal.seller.service.SellerService;
import com.meal.seller.vo.SellerVO;

@Controller("GoodsController")
@RequestMapping("/goods")
public class GoodsControllerImpl extends BaseController implements GoodsController {
	private static final String CURR_IMAGE_UPLOAD_PATH = "C:\\Meal\\Image";
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private Img_gVO img_gVO;
	@Autowired
	private SellerVO sellerVO;
	@Autowired
	private GoodsVO goodsVO;
	@Autowired
	private SellerService sellerService;
	@Autowired
	private BoardGrService boardGrService;
	@Autowired
	private BoardGqService boardGqService;

	// 상품등록창
	@Override
	@RequestMapping(value = "/goodsForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	protected ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");// 인터셉터있을때 없으면주석
		/* String viewName = (String)request.getAttribute("viewName"); 인터셉터없을때 */
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/addNewGoods.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = multipartRequest.getSession();
		// 세션에 저장되어있던 sellerInfo를 꺼내옴
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		if (sellerVO == null) {
			String viewName = "redirect:/main/main.do";
			String message = "판매자로 로그인 해주세요.";
			mav.addObject("message", message);
			mav.setViewName(viewName);
			return mav;
		}
		String imageFileName = null;

		HashMap<String, Object> newGoodsMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		// input type=file제외 모두 들어감
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name + value : " + name + " + " + value);
			newGoodsMap.put(name, value);
		}

		String H = (String) sellerVO.getS_HACCP_Num();
		String GR = (String) sellerVO.getS_GR_Num();
		System.out.println("H : " + H);
		System.out.println("GR : " + GR);
		logger.debug("===================================");
		logger.debug("H : " + H);
		logger.debug("GR : " + GR);

		logger.debug("===================================");
		if (H != null && GR != null) {
			newGoodsMap.put("g_cate3", "HGR");

		} else if (H != null && GR == null) {

			newGoodsMap.put("g_cate3", "H");

		} else if (H == null && GR != null) {
			newGoodsMap.put("g_cate3", "GR");
		} else {
			newGoodsMap.put("g_cate3", "N");

		}
		System.out.println("g_cate3 : " + (String) newGoodsMap.get("g_cate3"));

		// newGoodsMap내부에 키g_name을 이용하여 A에 바인딩
		String A = (String) newGoodsMap.get("g_name");
		// 바인딩된 A에 sellerInfo에 등러있던 s_Wname을 더하여 g_name에 바인딩
		String g_name = "[" + sellerVO.getS_Wname() + "]" + " " + A;
		System.out.println("g_name : " + g_name);
		// 바인딩한 g_name 값을 키g_name에 바인딩하여 newGoodsMap에 저장함
		newGoodsMap.put("g_name", g_name);
		// 굿즈에 대한 정보들 = 서비스메소드삽입
		goodsService.addNewGoods(newGoodsMap);
		// 파일이 아닌것들에 대하여 맵에 집어넣음 추후 판매자INFO로 들어감

		GoodsVO goodsInfo = (GoodsVO) goodsService.findg_id(g_name);
		int g_id = (Integer) goodsInfo.getG_id();

		// 베이스 컨트롤러로 이동하여 파일에 대하여 C\Meal\Image\temp로 저장시켜줌
		List<HashMap<String, Object>> imageFileList = (List<HashMap<String, Object>>) upload(multipartRequest);
		// 이미지 리스트에 관하여 파일정보 MAP에 판매자 아이디를 추가시킴
		// 이미지 이동을 위한 메소드
		try {
			if (imageFileList != null && imageFileList.size() != 0) {

				// HashMap을 해석해주는 구문
				for (HashMap<String, Object> item : imageFileList) {

					item.put("g_id", g_id);
					goodsService.addGoodsImg(item);
					imageFileName = (String) item.get("fileName");
					String cate = (String) item.get("cate");
					if (!(imageFileName.equals("fileName") || imageFileName == null)) {
						// 이미지에 해당하는 정보를 DB에 저장 s_id | cate = fileName |fileName = originalfileName
						// temp에 있는 이미지파일경로 설정
						File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + imageFileName);
						// 이동하고자 하는 이미지 파일경로 설정
						File destDir = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "goods" + "\\" + g_id + "\\" + cate);
						// 경로 추가? 해야할 것
						// 이동
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
					}
				}
			}
			// 결과창에 출력해주기 위해 판매자 정보를 저장해줌
			String message = "상품등록이 완료되었습니다.";
			mav.addObject("goodsInfo", goodsInfo);
			String viewName = "redirect:/main/main.do";
			mav.addObject("message", message);
			mav.setViewName(viewName);
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			// 에러가 날경우 temp에 있는 저장했던 이미지 파일들을 삭제 시킴
			if (imageFileList != null && imageFileList.size() != 0) {
				for (HashMap<String, Object> item : imageFileList) {
					imageFileName = (String) item.get("fileName");
					File srcFile = new File(
							CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + "g_name" + "\\" + imageFileName);
					srcFile.delete();
				}
			}
			String viewName1 = (String) multipartRequest.getAttribute("viewName1");
			mav.setViewName(viewName1);
			return mav;
		}
	}

	// G_NAME을 통해서 유효성평가 진행(중복되면 상품등록 X)
	@Override
	@RequestMapping(value = "/goodsoverlapped.do", method = RequestMethod.POST)
	public ResponseEntity goodsoverlapped(@RequestParam("g_name") String g_name, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");

		String g_name1 = "[" + sellerVO.getS_Wname() + "] " + g_name;
		String result = goodsService.goodsoverlapped(g_name1);

		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/goodsDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView goodsDetail(@RequestParam("g_id") int g_id,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		String viewName = (String) request.getAttribute("viewName");
		// 상품에 관한 정보 및 이미지
		GoodsVO goodsInfo = (GoodsVO) goodsService.selectGoodsDetail(g_id);
		List<Img_gVO> imgList = (List<Img_gVO>) goodsService.selectImgList(g_id);
		// 상품리뷰게시판 리스트 정보
		HashMap<String, Object> Map = new HashMap<String, Object>();
		Map.put("pageNum", pageNum);
		Map.put("section", section);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(Map);
		pagingMap.put("g_id", g_id);

		List<BoardGrVO> boardGrList = boardGrService.selectGoodsBoardGrList(pagingMap);
		List<BoardGrVO> boardGr = boardGrService.selectGoodsBoardGrallList(g_id);
		List<BoardGrVO> boardGrReviewList = boardGrService.SelectReview(g_id);
		int g_avg = boardGrService.selectGoodAvg(g_id);

		for (BoardGrVO item : boardGr) {
			for (BoardGrVO j : boardGrList) {
				if (!((int) item.getB_gr_id() == (int) j.getParentNo())) {
					String compare = "N";
					item.setCompare(compare);
				} else {
					String compare = "Y";
					item.setCompare(compare);
					System.out.println("BoardCompare" + item.getB_gr_id());

					break;
				}
			}
		}
		// 상품문의게시판 리스트 정보
		List<BoardGqVO> boardGqList = boardGqService.selectGoodsBoardGqList(pagingMap);
		List<BoardGqVO> boardGq = boardGqService.selectGoodsBoardGqallList(g_id);
		List<BoardGqVO> boardGqReviewList = boardGqService.SelectReview(g_id);

		for (BoardGqVO item : boardGq) {
			for (BoardGqVO j : boardGqList) {
				if (!((int) item.getB_gq_id() == (int) j.getParentNo())) {
					String compare = "N";
					item.setCompare(compare);
				} else {
					String compare = "Y";
					item.setCompare(compare);
					System.out.println("BoardCompare" + item.getB_gq_id());
					break;
				}
			}
		}

		HttpSession session = request.getSession();

		logger.info("--------------------------------");
		logger.info("goodsInfo" + goodsInfo);
		logger.info("--------------------------------");
		logger.info("imgList" + imgList);
		logger.info("--------------------------------");
		logger.info("boardGrList" + boardGrList);
		logger.info("--------------------------------");
		logger.info("boardGqList" + boardGqList);
		logger.info("--------------------------------");
		if (g_id == 0) {
			message = "삭제된 상품입니다.";
			mav.addObject("message", message);

			String viewName1 = "redirect:/main/main.do";
			mav.setViewName(viewName1);
		} else {
			mav.addObject("goodsInfo", goodsInfo);
			mav.addObject("g_avg", g_avg);
			mav.addObject("ImgList", imgList);
			mav.addObject("boardGrList", boardGrList);
			mav.addObject("boardGrReviewList", boardGrReviewList);
			mav.addObject("boardGqList", boardGqList);
			mav.addObject("boardGqReviewList", boardGqReviewList);
			mav.setViewName(viewName);
			addGoodsInQuick(g_id, goodsInfo, session);
		}
		if(message != null) {
			mav.addObject(message);
		}
		return mav;

	}

	// 상품 관리에 관한 메소드
	@Override
	@RequestMapping(value = "/selectGoodsPage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectAllGoods(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section1", required = false) String section,
			@RequestParam(value = "pgNum", required = false) String pgNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		if (sellerVO == null) {
			String message = "판매자 로그인을 해주세요.";
			mav.addObject("message", message);
			String viewName = "redirect:/main/main.do";
			mav.setViewName(viewName);
			return mav;
		}
		String s_id = sellerVO.getS_id();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		//
		HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
		pagingInfo.put("section", section);
		pagingInfo.put("pageNum", pgNum);

		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);

		pagingMap.put("s_id", s_id);
		List<GoodsVO> goodsList = goodsService.selectGoodsPage(pagingMap);
		mav.addObject("goodsList", goodsList);

		return mav;
	}

	@Override
	@RequestMapping(value = "/updateGoodsForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView updateGoodsForm(@RequestParam("g_id") int g_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
		// AdminVO adminInfo = (AdminVO) session.getAttribute("AdminInfo");
		GoodsVO goodsInfo = (GoodsVO) goodsService.goodsG_Info(g_id);
		List<Img_gVO> imageList = (List<Img_gVO>) goodsService.selectImgList(g_id);

		if (sellerInfo.getS_id().equals(goodsInfo.getS_id())) {
			String viewName = "/goods/updateGoodsForm";
			mav.addObject("goodsInfo", goodsInfo);
			mav.setViewName(viewName);
			mav.addObject("imageList", imageList);
			return mav;

		} // else if (adminInfo != null) {
			// String viewName = "/goods/updateGoodsForm";
			// mav.setViewName(viewName);
			// return mav;

		// }
		else {
			String message = "회원정보가 일치하지 않습니다.";
			mav.addObject("message", message);
			String viewName = "redirect:/goods/searchGoods.do";
			mav.setViewName(viewName);
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/updateGoods.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity updateGoods(@RequestParam("g_id") int g_id, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		HttpSession session = multipartRequest.getSession();
		GoodsVO goodsInfo = (GoodsVO) goodsService.goodsG_Info(g_id);
		HashMap<String, Object> newGoodsMap = new HashMap<String, Object>();

		Enumeration enu = multipartRequest.getParameterNames();
		// input type=file제외 모두 들어감
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name + value : " + name + value);
			System.out.println("value.class.name = " + value.getClass().getName());
			if (value != null && value != "") {
				newGoodsMap.put(name, value);
			}
		}

		String g_saleDate1 = (String) newGoodsMap.get("g_saleDate1");
		String g_saleDate2 = (String) newGoodsMap.get("g_saleDate2");
		String g_saleDate3 = (String) newGoodsMap.get("g_saleDate3");
		String g_saleDate4 = (String) newGoodsMap.get("g_saleDate4");

		
		if (g_saleDate3.contains("-") ) {
			newGoodsMap.put("g_saleDate1", g_saleDate3);
			logger.info("==============================");
			logger.info("if1 : in");
			logger.info("==============================");
			
		} else if(!g_saleDate1.equals("")){
			DateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
			
			String beforeDate1 = g_saleDate1;
			Date date1 = dateFormat.parse(beforeDate1);
			String afterDate1 = sdf.format(date1);
			newGoodsMap.put("g_saleDate1", afterDate1);
			logger.info("==============================");
			logger.info("g_saleD1 : "+ afterDate1);
			logger.info("g_saleD3 : "+ g_saleDate3);
			logger.info("g_saleD4 : "+ g_saleDate4);
			logger.info("if1 : "+newGoodsMap.containsKey("g_saleDate3"));
			logger.info("if1 : "+newGoodsMap.containsKey("g_saleDate4"));
			logger.info("if1 : "+newGoodsMap.containsValue("g_saleDate3"));
			logger.info("if2 : "+newGoodsMap.containsValue("g_saleDate4"));
			logger.info("==============================");
			
		}
		if (g_saleDate4.contains("-")) {
			newGoodsMap.put("g_saleDate2", g_saleDate4);
			logger.info("==============================");
			logger.info("if2 : in");
			logger.info("==============================");
			
		} else if(!g_saleDate2.equals("")) {
			DateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
			
			String beforeDate2 = g_saleDate2;
			Date date2 = dateFormat.parse(beforeDate2);
			String afterDate2 = sdf.format(date2);
			newGoodsMap.put("g_saleDate2", afterDate2);
			logger.info("==============================");
			logger.info("g_saleD2 : "+ afterDate2);
			logger.info("g_saleD3 : "+ g_saleDate3);
			logger.info("g_saleD4 : "+ g_saleDate4);
			logger.info("if1 : "+newGoodsMap.containsKey("g_saleDate3"));
			logger.info("if1 : "+newGoodsMap.containsKey("g_saleDate4"));
			logger.info("if1 : "+newGoodsMap.containsValue("g_saleDate3"));
			logger.info("if2 : "+newGoodsMap.containsValue("g_saleDate4"));
			logger.info("==============================");
		} 
		
		// 3.4있대
		/*
		 * if (g_saleDate3 != null || g_saleDate3 != "") {
		 * newGoodsMap.put("g_saleDate1", g_saleDate3); } if (g_saleDate4 != null ||
		 * g_saleDate4 != "") { newGoodsMap.put("g_saleDate2", g_saleDate4); }
		 */
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			// 이미지 추출을 위하여 g_id사용
			int g_id1 = (Integer) goodsInfo.getG_id();
			// 현재 저장된 상품 이미지리스트를 불러옴
			List<Img_gVO> OldimageList = (List<Img_gVO>) goodsService.selectImgList(g_id);
			List<HashMap<String, Object>> imageFileList = (List<HashMap<String, Object>>) upload(multipartRequest);
			// 기존 이미지와 신규 이미지 비교
			for (Img_gVO oldi : OldimageList) {
				for (HashMap<String, Object> newi : imageFileList) {
					String oldCate = oldi.getCate();
					String newCate = (String) newi.get("cate");
					String newImgFileName = (String) newi.get("fileName");
					String oldImgFileName = oldi.getFileName();
					newi.put("g_id", g_id);
					// 기존 이미지목록과 새로운 이미지 목록에 관한 비교문임
					if (oldCate.equals(newCate)) {
						// 기존이미지가 있고 신규미이지 등록을 하였을 경우
						if (oldImgFileName != null && newImgFileName != null) {
							String oldpath = CURR_IMAGE_UPLOAD_PATH + "\\" + "goods" + "\\" + g_id + "\\" + oldCate;
							deleteFolder(oldpath);
							// 등록할 이미지 경로설정(upload)메소드로 path내부에 이미 존재함
							File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + newImgFileName);
							// 이동하고자 하는 이미지 파일경로 설정
							File destDir = new File(
									CURR_IMAGE_UPLOAD_PATH + "\\" + "goods" + "\\" + g_id + "\\" + newCate);
							// 이동
							FileUtils.moveFileToDirectory(srcFile, destDir, true);
							// db에 있는 이미지 정보 변경해주기
							goodsService.updateGoodsImg(newi);
							System.out.println(newi);
							// 신규이미지 등록일 경우에
						} else if (oldImgFileName == null && newImgFileName != null) {
							// 등록할 이미지 경로설정(upload)메소드로 path내부에 이미 존재함
							File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + newImgFileName);
							// 이동하고자 하는 이미지 파일경로 설정
							File destDir = new File(
									CURR_IMAGE_UPLOAD_PATH + "\\" + "goods" + "\\" + g_id + "\\" + newCate);
							// 이동
							FileUtils.moveFileToDirectory(srcFile, destDir, true);
							// DB에 저장
							goodsService.addGoodsImg(newi);
							System.out.println(newi);
						}
					}
				}
			}
			goodsService.updateGoods(newGoodsMap);

			message = "<script>";
			message += " alert('상품수정이 완료되었습니다..');";
			// 컨트롤러 내부를 거쳐서 가는거기 때문에 바인딩해줄 요소가 없음
			message += " location.href='" + multipartRequest.getContextPath() + "/main/main.do';";
			message += " </script>";

		} catch (Exception e) {

			message = "<script>";
			message += " alert('다시 내용을 입력해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/main/main.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;

	}

	@Override
	@RequestMapping(value = "/deleteGoods.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView deleteGoods(@RequestParam HashMap<String, Object> map, @RequestParam("g_id") int g_id,
			HttpServletRequest request, HttpServletResponse repsponse) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
		GoodsVO goodsInfo = (GoodsVO) goodsService.goodsG_Info(g_id);
		String s_id = (String) sellerInfo.getS_id();
		String s_id1 = (String) goodsInfo.getS_id();

		if (s_id.equals(s_id1)) {
			String path = CURR_IMAGE_UPLOAD_PATH + "\\" + "goods" + "\\" + goodsInfo.getG_id();
			deleteFolder(path);
			goodsService.deleteGoods(goodsInfo);

			session.setAttribute("isLogOn", true);
			String message = "상품이 삭제되었습니다.";
			mav.addObject("message", message);
			String viewName = "redirect:/goods/selectGoodsPage.do";
			mav.setViewName(viewName);
			return mav;
		} else {
			String viewName = "redirect:/goods/selectGoodsPage.do";
			mav.setViewName(viewName);
			return mav;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/saleEnd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String goodsSaleEnd(int g_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		try {
			goodsService.goodsSaleEnd(g_id);
			String message = "적용되있던 세일정보가 삭제되었습니다.";
			return message;
		} catch (Exception e) {
			String message = "세일정보가 없습니다.";
			return message;
		}
	}

	// 디테일 진입시 퀵 메뉴에 추가
	@Override
	public void addGoodsInQuick(int g_id, GoodsVO goodsInfo, HttpSession session) throws Exception {
		boolean already_existed = false;
		List<GoodsVO> quickGoodsList;
		quickGoodsList = (ArrayList<GoodsVO>) session.getAttribute("quickGoodsList");

		if (quickGoodsList != null) {
			if (quickGoodsList.size() < 4) {
				for (int i = 0; i < quickGoodsList.size(); i++) {
					GoodsVO _goodsBean = (GoodsVO) quickGoodsList.get(i);
					if (g_id == _goodsBean.getG_id()) {
						already_existed = true;
						break;
					}
				}
				if (already_existed == false) {
					quickGoodsList.add(goodsInfo);
				}
			}

		} else {
			quickGoodsList = new ArrayList<GoodsVO>();
			quickGoodsList.add(goodsInfo);

		}
		session.setAttribute("quickGoodsList", quickGoodsList);
		session.setAttribute("quickGoodsListNum", quickGoodsList.size());
	}

}