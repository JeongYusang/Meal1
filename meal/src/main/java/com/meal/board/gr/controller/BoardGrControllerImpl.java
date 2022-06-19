package com.meal.board.gr.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meal.admin.vo.AdminVO;
import com.meal.board.gr.service.BoardGrService;
import com.meal.board.gr.vo.BoardGrVO;
import com.meal.board.gr.vo.Img_grVO;
import com.meal.common.controller.BaseController;
import com.meal.goods.service.GoodsService;
import com.meal.goods.vo.GoodsVO;
import com.meal.member.vo.MemberVO;
import com.meal.order.service.OrderService;
import com.meal.seller.vo.SellerVO;

@Controller("boardGrController")
@RequestMapping("/boardGr")

public class BoardGrControllerImpl extends BaseController implements BoardGrController {

	private static final Logger logger = LoggerFactory.getLogger(BoardGrControllerImpl.class);

	private String CURR_IMAGE_UPLOAD_PATH = "C:\\Meal\\Image";
	@Autowired
	private BoardGrService boardGrService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private OrderService orderService;

	@Autowired
	private BoardGrVO boardGrVO;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private SellerVO sellerVO;
	@Autowired
	private AdminVO adminVO;

	@Override
	@RequestMapping(value = "/boardGrinsert.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView writeBoardGr(@RequestParam(value = "o_id", required = false) String o_id, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String imageFileName = null;
		HttpSession session = multipartRequest.getSession();

		HashMap<String, Object> newboardGrMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name + value = " + name + " : " + value);
			newboardGrMap.put(name, value);
		}
		boardGrService.boardGrWrite(newboardGrMap);

		List<HashMap<String, Object>> imageFileList = (List<HashMap<String, Object>>) upload(multipartRequest);

		// a
		BoardGrVO boardInfo = (BoardGrVO) boardGrService.findb_gr_id();
		int b_gr_id = (Integer) boardInfo.getB_gr_id();
		int g_id = (Integer) boardInfo.getG_id();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");

		// 이미지 이동을 위한 메소드
		try {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (HashMap<String, Object> item : imageFileList) {
					// 이미지 리스트에 관하여 파일정보 MAP에 판매자 아이디를 추가시킴
					item.put("b_gr_id", b_gr_id);
					if (memberVO != null) {
						String reg_id = memberVO.getU_id();
						item.put("reg_id", reg_id);
					} else {
						String reg_id = sellerVO.getS_id();
						item.put("reg_id", reg_id);
					}

					// 이미지 파일네임을통해 파일경로 설정
					imageFileName = (String) item.get("fileName");
					if (!(imageFileName.equals("") || imageFileName == null)) {
						// 이미지에 해당하는 정보를 DB에 저장 g_id | fileName = originalfileName
						boardGrService.addImg(item);
						// temp에 있는 이미지파일경로 설정
						File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + imageFileName);
						// 이동하고자 하는 이미지 파일경로 설정
						File destDir = new File(
								CURR_IMAGE_UPLOAD_PATH + "\\" + "goods" + "\\" + g_id + "\\" + "Gr" + "\\" + b_gr_id);
						// 이동
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
					}
				}
			}

			/*
			 * MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
			 * mav.addObject("memberInfo", memberInfo);
			 */
			if (memberVO != null) {
				String viewName = "redirect:/order/selectUserOrders.do";
				mav.setViewName(viewName);
			} else if (sellerVO != null) {
				String viewName = "redirect:/boardGr/selectSellerBoardGrList.do";
				mav.setViewName(viewName);
			}
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			// 에러가 날경우 temp에 있는 저장했던 이미지 파일들을 삭제 시킴
			if (imageFileList != null && imageFileList.size() != 0) {
				for (HashMap<String, Object> item : imageFileList) {
					imageFileName = (String) item.get("fileName");
					File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
					String viewName1 = "redirect:/boardGr/selectBoardGrList.do";
					mav.setViewName(viewName1);
					return mav;
				}
			}
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/boardGrUpdateform.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGrUpdateform(@RequestParam("b_gr_id") Integer b_gr_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		Map boardGrMap = boardGrService.boardGrView(b_gr_id);
		BoardGrVO boardGrVO = (BoardGrVO) boardGrMap.get("boardGrVO");
		List<Img_grVO> imageList = (List<Img_grVO>) boardGrMap.get("imageList");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		try {
			if (memberVO != null)
				if (memberVO.getU_id().equals(boardGrVO.getU_id())) {
					mav.addObject("boardGrVO", boardGrVO);
					mav.addObject("imageList", imageList);
					mav.setViewName(viewName);
				} else if (adminVO != null) {
					mav.addObject("boardGrVO", boardGrVO);
					mav.addObject("imageList", imageList);
					mav.setViewName(viewName);
				} else {
					String message = "회원정보가 일치하지 않습니다.";
					mav.addObject("message", message);
					mav.addObject("b_gr_id", b_gr_id);
					viewName = "redirect:/boardGr/gr_detail.do";
					mav.setViewName(viewName);

				}
			return mav;
		} catch (Exception e) {
			mav.addObject("boardGrVO", boardGrVO);
			String message = "회원정보가 일치하지 않습니다.";
			mav.addObject("message", message);
			mav.addObject("b_gr_id", b_gr_id);
			viewName = "redirect:/boardGr/gr_detail.do";
			mav.setViewName(viewName);
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/boardGrUpdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGrUpdate(@ModelAttribute BoardGrVO boardGrVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		try {
			boardGrService.boardGrUpdate(boardGrVO);
			if (boardGrVO.getParentNo() == 0) {
				System.out.println("parentno = 0 답변 수정 완료");
				viewName = "redirect:/boardGr/gr_detail.do";
				int b_gr_id = boardGrVO.getB_gr_id();
				mav.addObject("b_gr_id", b_gr_id);
				mav.setViewName(viewName);
			} else {
				System.out.println("답변 수정 완료");
				viewName = "redirect:/boardGr/gr_detail.do";
				int ParentNO = boardGrVO.getParentNo();
				mav.addObject("b_gr_id", ParentNO);
				mav.setViewName(viewName);
			}
		} catch (Exception e) {
			int b_gr_id = (Integer) boardGrVO.getB_gr_id();
			mav.addObject("b_gr_id", b_gr_id);
			viewName = "redirect:/boardGr/boardGrUpdateform.do";
			mav.setViewName(viewName);
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/selectBoardGrList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectBoardGrList(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		String message = (String) request.getAttribute("message");
		if (message != null) {
			mav.addObject("message", message);
		}
		HashMap<String, Object> Map = new HashMap<String, Object>();
		Map.put("pageNum", pageNum);
		Map.put("section", section);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(Map);

		List<BoardGrVO> boardGr = boardGrService.selectBoardGrList(pagingMap);
		List<BoardGrVO> board2 = boardGrService.selectBoardGrallList();

		for (BoardGrVO item : boardGr) {
			for (BoardGrVO j : board2) {
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
		mav.addObject("boardGr", boardGr);
		return mav;
	}

	@Override
	@RequestMapping(value = "/selectMyBoardGrList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectMyBoardGrList(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String u_id = memberVO.getU_id();
		String message = (String) request.getAttribute("message");
		if (message != null) {
			mav.addObject("message", message);
		}
		HashMap<String, Object> Map = new HashMap<String, Object>();
		Map.put("pageNum", pageNum);
		Map.put("section", section);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(Map);
		pagingMap.put("u_id", u_id);

		List<BoardGrVO> boardGrList = boardGrService.selectMyBoardGrList(pagingMap);
		List<BoardGrVO> board2 = boardGrService.selectBoardGrallList();

		for (BoardGrVO item : boardGrList) {
			int g_id = item.getG_id();
			GoodsVO goodsVO = goodsService.selectGoodsDetail(g_id);
			String g_name = goodsVO.getG_name();
			item.setG_name(g_name);
		}

		for (BoardGrVO item : boardGrList) {
			for (BoardGrVO j : board2) {
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

		mav.addObject("memberVO", memberVO);
		mav.addObject("boardGr", boardGrList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/selectSellerBoardGrList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectSMyBoardGrList(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		String s_id = sellerVO.getS_id();
		String message = (String) request.getAttribute("message");
		if (message != null) {
			mav.addObject("message", message);
		}
		HashMap<String, Object> Map = new HashMap<String, Object>();
		Map.put("pageNum", pageNum);
		Map.put("section", section);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(Map);
		pagingMap.put("s_id", s_id);

		List<BoardGrVO> boardGr = boardGrService.selectSellerBoardGrList(pagingMap);
		List<BoardGrVO> board2 = boardGrService.selectSellerBoardGrallList(s_id);
		for (BoardGrVO item : boardGr) {
			int g_id = item.getG_id();
			GoodsVO goodsVO = goodsService.selectGoodsDetail(g_id);
			String g_name = goodsVO.getG_name();
			item.setG_name(g_name);
		}

		for (BoardGrVO item : boardGr) {
			for (BoardGrVO j : board2) {
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
		mav.addObject("boardGr", boardGr);
		mav.addObject("sellerVO", sellerVO);
		return mav;
	}

	@Override
	@RequestMapping(value = "/gr_detail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGrView(@RequestParam("b_gr_id") int b_gr_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String message = (String) request.getAttribute("message");
		if (message != null) {
			mav.addObject("message", message);
		}
		Map boardGrMap = boardGrService.boardGrView(b_gr_id);
		BoardGrVO boardGrVO = (BoardGrVO) boardGrMap.get("boardGrVO");
		List<Img_grVO> imageList = (List<Img_grVO>) boardGrMap.get("imageList");
		mav.addObject("boardGrInfo", boardGrVO);
		mav.addObject("imageList", imageList);
		System.out.println("뷰네임" + viewName);
		mav.setViewName(viewName);

		// 추가 리스트 들고올 것
		List<BoardGrVO> boardList = boardGrService.boardGrViewReview(b_gr_id);

		mav.addObject("ReviewList", boardList);

		return mav;
	}

	@Override
	@RequestMapping(value = "/boardGrWrite.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGrWrite(@RequestParam("g_id") int g_id, @RequestParam("o_id") int o_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminInfo = (AdminVO) session.getAttribute("AdminVO");
		String _o_id = orderService.overlappedO_id(o_id);
		logger.info("member :" + memberInfo + "  seller :" + sellerInfo + "  admin : " + adminInfo);
		if (goodsService.goodsG_Info(g_id) != null) {
			if (memberInfo == null && sellerInfo == null && adminInfo == null) {
				String viewName = "redirect:/order/selectUserOrders.do";
				String message = "로그인을 해주세요.";
				mav.addObject("message", message);
				mav.setViewName(viewName);
				return mav;
			} else {
				if (_o_id.equals("false")) {
					GoodsVO goodsVO = goodsService.selectGoodsDetail(g_id);
					String viewName = "/boardGr/boardGrWrite";
					mav.setViewName(viewName);
					mav.addObject("goodsVO", goodsVO);
					mav.addObject("o_id", o_id);
					return mav;
				} else if (_o_id.equals("true")) {
					String viewName = "redirect:/order/selectUserOrders.do";
					String message = "이미 후기를 작성하셨습니다";
					mav.addObject("message", message);
					mav.setViewName(viewName);
					return mav;
				}
			}

		} else {
			String viewName2 = "redirect:/order/selectUserOrders.do";
			String message = "삭제된 상품입니다.";
			mav.addObject("message", message);
			mav.setViewName(viewName2);
		}
		return mav;

	}

	@Override
	@RequestMapping(value = "/boardGrReviewform.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGrReviewForm(@RequestParam(value = "b_gr_id", required = false) Integer b_gr_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		Map boardGrMap = boardGrService.boardGrView(b_gr_id);
		BoardGrVO boardGrVO = (BoardGrVO) boardGrMap.get("boardGrVO");
		List<Img_grVO> imageList = (List<Img_grVO>) boardGrMap.get("imageList");
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminVO = (AdminVO) session.getAttribute("adminInfo");
		try {
			if (sellerVO != null) {
				mav.addObject("boardGrVO", boardGrVO);
				mav.addObject("imageList", imageList);
				mav.setViewName(viewName);
			} else if (adminVO != null) {
				mav.addObject("boardGrVO", boardGrVO);
				mav.addObject("imageList", imageList);
				mav.setViewName(viewName);
			} else {
				String message = "리뷰에 대한 권한이없습니다.";
				mav.addObject("message", message);
				mav.addObject("b_gr_id", b_gr_id);
				viewName = "redirect:/boardGr/gr_detail.do";
				mav.setViewName(viewName);

			}
			return mav;
		} catch (Exception e) {
			mav.addObject("boardGrVO", boardGrVO);
			String message = "회원정보가 일치하지 않습니다.";
			mav.addObject("message", message);
			mav.addObject("b_gr_id", b_gr_id);
			viewName = "redirect:/boardGr/gr_detail.do";
			mav.setViewName(viewName);
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/boardGrReviewUpdateform.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGrReviewUpdateForm(@RequestParam(value = "b_gr_id", required = false) Integer b_gr_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		Map boardGrMap = boardGrService.boardGrView(b_gr_id);
		BoardGrVO boardGrVO = (BoardGrVO) boardGrMap.get("boardGrVO");
		List<Img_grVO> imageList = (List<Img_grVO>) boardGrMap.get("imageList");
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminVO = (AdminVO) session.getAttribute("adminInfo");
		try {
			if (sellerVO != null) {
				mav.addObject("sellerVO", sellerVO);
				mav.addObject("boardGrVO", boardGrVO);
				mav.addObject("imageList", imageList);
				mav.setViewName(viewName);
			} else if (adminVO != null) {
				mav.addObject("boardGrInfo", boardGrVO);
				mav.addObject("imageList", imageList);
				mav.setViewName(viewName);
			} else {
				String message = "리뷰에 대한 권한이없습니다.";
				mav.addObject("message", message);
				mav.addObject("b_gr_id", b_gr_id);
				viewName = "redirect:/boardGr/gr_detail.do";
				mav.setViewName(viewName);

			}
			return mav;
		} catch (Exception e) {
			mav.addObject("boardGrVO", boardGrVO);
			String message = "회원정보가 일치하지 않습니다.";
			mav.addObject("message", message);
			mav.addObject("b_gr_id", b_gr_id);
			viewName = "redirect:/boardGr/gr_detail.do";
			mav.setViewName(viewName);
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/boardGrDelete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGrDelete(@RequestParam(value = "b_gr_id", required = false) Integer b_gr_id,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		Map boardGrMap = boardGrService.boardGrView(b_gr_id);
		BoardGrVO boardGrVO = (BoardGrVO) boardGrMap.get("boardGrVO");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		System.out.println("sellerInfo : " + sellerVO + "1" + boardGrVO.getS_id());
		AdminVO adminVO = (AdminVO) session.getAttribute("adminInfo");
		try {
			if (memberVO != null) {

				if (memberVO.getU_id().equals(boardGrVO.getU_id())) {
					boardGrService.boardGrDelete(b_gr_id);
					String viewName1 = "redirect:/boardGr/selectMyBoardGrList.do";
					String message = "게시글이 삭제 되었습니다";
					redirectAttributes.addAttribute("message", message);
					mav.setViewName(viewName1);
					return mav;
				}

			} else if (sellerVO != null) {
				if (sellerVO.getS_id().equals(boardGrVO.getS_id())) {
					boardGrService.boardGrDelete(b_gr_id);
					String viewName1 = "redirect:/boardGr/selectSellerBoardGrList.do";
					mav.setViewName(viewName1);
					return mav;
				}

			} else if (adminVO != null) {
				boardGrService.boardGrDelete(b_gr_id);
				String viewName1 = "redirect:/boardGr/selectBoardGrList.do";
				mav.setViewName(viewName1);
				return mav;
			}
			String message = "게시물 작성자가 아닙니다.";
			redirectAttributes.addAttribute("message", message);
			viewName = "redirect:/boardGr/gr_detail.do";
			mav.setViewName(viewName);
			return mav;

		} catch (Exception e) {
			mav.addObject("boardGrVO", boardGrVO);
			String message = "회원정보가 일치하지 않습니다.";
			redirectAttributes.addAttribute("message", message);
			viewName = "redirect:/boardGr/gr_detail.do";
			mav.setViewName(viewName);
			return mav;
		}

	}

}
