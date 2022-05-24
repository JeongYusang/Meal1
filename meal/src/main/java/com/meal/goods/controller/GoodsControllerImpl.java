package com.meal.goods.controller;

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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.meal.board.gr.service.BoardGrService;
import com.meal.common.controller.BaseController;
import com.meal.goods.dao.GoodsDAO;
import com.meal.goods.service.GoodsService;
import com.meal.goods.vo.GoodsVO;
import com.meal.goods.vo.Img_gVO;
import com.meal.seller.service.SellerService;
import com.meal.seller.vo.SellerVO;

@Controller("GoodsController")
@RequestMapping("/goods")
public class GoodsControllerImpl extends BaseController implements GoodsController {
	private static final String CURR_IMAGE_UPLOAD_PATH = "C:\\Meal\\Image";
	private static final HttpServletRequest multipartRequest = null;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private GoodsDAO goodsDAO;
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


	//상품등록창
	@RequestMapping(value = "/goodsForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	protected ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");// 인터셉터있을때 없으면주석
		/* String viewName = (String)request.getAttribute("viewName"); 인터셉터없을때 */
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/addNewGoods.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String imageFileName = null;

		HashMap<String, Object> newGoodsMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		// input type=file제외 모두 들어감
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name + value : " + name + value);
			newGoodsMap.put(name, value);

		}

		HttpSession session = multipartRequest.getSession();
		// 세션에 저장되어있던 sellerInfo를 꺼내옴
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
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
						File destDir = new File(
								CURR_IMAGE_UPLOAD_PATH + "\\" + "goods" + "\\" + g_id + "\\" + cate);
						// 경로 추가? 해야할 것
						// 이동
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
					}
				}
			}
			// 결과창에 출력해주기 위해 판매자 정보를 저장해줌
			mav.addObject("goodsInfo", goodsInfo);
			String viewName= "redirect:/main/main.do";
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

		String g_name1 = sellerVO.getS_Wname() + " " + g_name;
		String result = goodsService.goodsoverlapped(g_name1);

		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}


	   @RequestMapping(value = "/goodsDetail.do", method = RequestMethod.GET)
	   public ModelAndView goodsDetail(@RequestParam("g_id") int g_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView();

	      //int _g_id = Integer.parseInt(g_id);
	      String viewName = (String) request.getAttribute("viewName");
	      GoodsVO goodsInfo = (GoodsVO)goodsService.selectGoodsDetail(g_id);
	      System.out.println("goodsInfo" + goodsInfo);
	      List<Img_gVO> imgList = (List<Img_gVO>)goodsService.selectImgList(g_id);
	      System.out.println("imgList" + imgList);
	      //굿즈디테일 상품리뷰 탭 부분
	      //List<BoardGrVO> listGR = (List<BoardGrVO>)boardService.selectBoardGrallList();
	
	      mav.setViewName(viewName);
	      mav.addObject("goodsInfo", goodsInfo);
	      mav.addObject("ImgList", imgList);

	      //상품 후기에 관한 게시판 조회또한 등록할 것

	      return mav;

	   }
	 
	   //상품 관리에 관한 메소드
		@RequestMapping(value = "/selectGoodsPage.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView selectAllGoods(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
				@RequestParam(value = "section1", required = false) String section1,
				@RequestParam(value = "pgNum", required = false) String pgNum, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			HashMap<String, Object> pgMap = new HashMap<String, Object>();
			Integer pg = 1;
			Integer index1 = 0;
			
			if (pgNum != null) {

				if (section1 != null) {
					Integer pg1 = Integer.parseInt((String) pgNum);
					Integer index2 = Integer.parseInt((String) section1);

					System.out.println("인덱스" + index1);
					Integer start = (pg1 - 1) * 10 + index2 * 100;
					Integer end = 10;
					//Integer end = (pg1) * 10 + index1 * 100; 출력개수를 정함.
					pgMap.put("start", start);
					pgMap.put("end", end);
					System.out.println(start);
					System.out.println(end);
					System.out.println(pgMap);
				} else {
					Integer pg1 = Integer.parseInt((String) pgNum);

					Integer start = (pg1 - 1) * 10 + index1 * 100;
					Integer end = (pg1) * 10 + index1 * 100;
					pgMap.put("start", start);
					pgMap.put("end", end);
				}
			} else {
				Integer start = (pg - 1) * 10 + index1 * 100;
				Integer end = (pg) * 10 + index1 * 100;
				pgMap.put("start", start);
				pgMap.put("end", end);
			}
			System.out.println(pgMap);
			List<GoodsVO> goodsList = goodsService.selectGoodsPage(pgMap);
			mav.addObject("goodsList", goodsList);

			
			return mav;
	}

}
