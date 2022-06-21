package com.meal.board.gq.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meal.admin.vo.AdminVO;
import com.meal.board.gq.service.BoardGqService;
import com.meal.board.gq.vo.BoardGqVO;
import com.meal.board.gq.vo.Img_gqVO;
import com.meal.common.controller.BaseController;
import com.meal.goods.service.GoodsService;
import com.meal.goods.vo.GoodsVO;
import com.meal.goods.vo.Img_gVO;
import com.meal.member.vo.MemberVO;
import com.meal.seller.vo.SellerVO;

@Controller("boardGqController")
@RequestMapping("/boardGq")

public class BoardGqControllerImpl extends BaseController implements BoardGqController {

	private String CURR_IMAGE_UPLOAD_PATH = "C:\\Meal\\Image";
	@Autowired
	private BoardGqService boardGqService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private BoardGqVO boardGqVO;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private SellerVO sellerVO;
	@Autowired
	private AdminVO adminVO;

	@Override
	@RequestMapping(value = "/boardGqinsert.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView writeBoardGq(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String imageFileName = null;
		HttpSession session = multipartRequest.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
		if(memberInfo == null && sellerInfo == null) {
			String message = "로그인 해주시길 바랍니다";
			mav.addObject(message);
			String viewName = "redirect:/main/loginForm.do";
			mav.setViewName(viewName);
		}
		HashMap<String, Object> newboardGqMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name + value = " + name + " : " + value);
			newboardGqMap.put(name, value);
		}
		boardGqService.boardGqWrite(newboardGqMap);

		List<HashMap<String, Object>> imageFileList = (List<HashMap<String, Object>>) upload(multipartRequest);

		// auto로 배정되는 b_gq_id 찾기
		BoardGqVO boardInfo = (BoardGqVO) boardGqService.findb_gq_id();
		int b_gq_id = (Integer) boardInfo.getB_gq_id();
		int g_id = (Integer) boardInfo.getG_id();
		

		// 이미지 이동을 위한 메소드
		try {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (HashMap<String, Object> item : imageFileList) {
					// 이미지 리스트에 관하여 파일정보 MAP에 판매자 아이디를 추가시킴
					item.put("b_gq_id", b_gq_id);
					if (memberInfo != null ) {
						String reg_id = memberInfo.getU_id();
						item.put("reg_id", reg_id);
					} else {
						String reg_id = sellerInfo.getS_id();
						item.put("reg_id", reg_id);
					}

					// 이미지 파일네임을통해 파일경로 설정
					imageFileName = (String) item.get("fileName");
					if (!(imageFileName.equals("") || imageFileName == null)) {
						// 이미지에 해당하는 정보를 DB에 저장 g_id | fileName = originalfileName
						boardGqService.addImg(item);
						// temp에 있는 이미지파일경로 설정
						File srcFile = new File(CURR_IMAGE_UPLOAD_PATH + "\\" + "temp" + "\\" + imageFileName);
						// 이동하고자 하는 이미지 파일경로 설정
						File destDir = new File(
								CURR_IMAGE_UPLOAD_PATH + "\\" + "goods" + "\\" + g_id + "\\" + "Gq" + "\\" + b_gq_id);
						// 이동
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
					}
				}
			}

			// 결과창에 출력해주기 위해 판매자 정보를 저장해줌
			if(memberInfo != null) {
				String message = "글을 등록했습니다";
				String viewName = "redirect:/goods/goodsDetail.do?g_id=" + g_id;
				mav.setViewName(viewName);
				mav.addObject(message);
			}else if (sellerInfo != null) {
				String message = "답변을 등록했습니다";
				mav.addObject(message);
				String viewName = "redirect:/seller/sellerBoardMypage.do";
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
					String viewName = "redirect:/goods/goodsDetail.do?g_id=" + g_id;
					mav.setViewName(viewName);
				}
			}
		}
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/boardGqUpdateform.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGqUpdateform(@ModelAttribute("b_gq_id") Integer b_gq_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		Map boardGqMap = boardGqService.boardGqView(b_gq_id);
		BoardGqVO boardGqVO = (BoardGqVO) boardGqMap.get("boardGqVO");
		List<Img_gqVO> imageList = (List<Img_gqVO>) boardGqMap.get("imageList");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		try {
			if (memberVO != null) {
				if (memberVO.getU_id().equals(boardGqVO.getU_id())) {
					mav.addObject("boardGqVO", boardGqVO);
					mav.addObject("imageList", imageList);
					mav.setViewName(viewName);
					return mav;
				} else {
					String message = "회원정보가 일치하지 않습니다.";
					mav.addObject("message", message);
					mav.addObject("b_gq_id", b_gq_id);
					viewName = "redirect:/boardGq/gq_detail.do";
					mav.setViewName(viewName);
					return mav;
				}
			} else if (adminVO != null) {
				mav.addObject("boardGqVO", boardGqVO);
				mav.addObject("imageList", imageList);
				mav.setViewName(viewName);
				return mav;
			} else {
				String message = "회원정보가 일치하지 않습니다.";
				mav.addObject("message", message);
				mav.addObject("b_gq_id", b_gq_id);
				viewName = "redirect:/boardGq/gq_detail.do";
				mav.setViewName(viewName);
				return mav;
			}
		} catch (Exception e) {
			mav.addObject("boardGqVO", boardGqVO);
			String message = "회원정보가 일치하지 않습니다.";
			mav.addObject("message", message);
			mav.addObject("b_gq_id", b_gq_id);
			viewName = "redirect:/boardGq/gq_detail.do";
			mav.setViewName(viewName);
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/boardGqUpdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGqUpdate(@ModelAttribute BoardGqVO boardGqVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		try {
			boardGqService.boardGqUpdate(boardGqVO);
			if (boardGqVO.getParentNo() == 0) {
				viewName = "redirect:/boardGq/gq_detail.do";
				int b_gq_id = boardGqVO.getB_gq_id();
				mav.addObject("b_gq_id", b_gq_id);
				mav.setViewName(viewName);
			} else {
				viewName = "redirect:/boardGq/gq_detail.do";
				int ParentNO = boardGqVO.getParentNo();
				mav.addObject("b_gq_id", ParentNO);
				mav.setViewName(viewName);

			}
		} catch (Exception e) {
			int b_gq_id = (Integer) boardGqVO.getB_gq_id();
			mav.addObject("b_gq_id", b_gq_id);
			viewName = "redirect:/boardGq/boardGqUpdateform.do";
			mav.setViewName(viewName);
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/selectBoardGqList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectBoardGqList(@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();

		if (message != null) {
			mav.addObject("message", message);
		}
		HashMap<String, Object> Map = new HashMap<String, Object>();
		Map.put("pageNum", pageNum);
		Map.put("section", section);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(Map);

		List<BoardGqVO> boardGq = boardGqService.selectBoardGqList(pagingMap);
		List<BoardGqVO> board2 = boardGqService.selectBoardGqallList();

		for (BoardGqVO item : boardGq) {
			for (BoardGqVO j : board2) {
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
		mav.addObject("boardGq", boardGq);
		return mav;
	}

	@Override
	@RequestMapping(value = "/selectMyBoardGqList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectMyBoardGqList(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			@RequestParam(value = "message", required = false) String message,HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		if (memberInfo != null) {
		String u_id = memberInfo.getU_id();
		HashMap<String, Object> Map = new HashMap<String, Object>();
		Map.put("pageNum", pageNum);
		Map.put("section", section);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(Map);
		pagingMap.put("u_id", u_id);

		List<BoardGqVO> boardGq = boardGqService.selectMyBoardGqList(pagingMap);
		List<BoardGqVO> board2 = boardGqService.selectBoardGqallList();

		for (BoardGqVO item : boardGq) {
			int g_id = item.getG_id();
			GoodsVO goodsVO = goodsService.selectGoodsDetail(g_id);
			String g_name = goodsVO.getG_name();
			item.setG_name(g_name);
		}

		for (BoardGqVO item : boardGq) {
			for (BoardGqVO j : board2) {
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
		mav.addObject("memberVO", memberVO);
		mav.addObject("boardGq", boardGq);
		}else {
			viewName = "redirect:/main/loginForm.do";
			mav.setViewName(viewName);
			message = "판매자 아이디로 로그인 해주시길 바랍니다";
		}
		if (message != null) {
			mav.addObject("message", message);
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/selectSellerBoardGqList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectSMyBoardGqList(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum,
			@RequestParam(value = "message", required = false) String message,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
		if(sellerInfo != null) {
			String s_id = sellerVO.getS_id();
			HashMap<String, Object> Map = new HashMap<String, Object>();
			Map.put("pageNum", pageNum);
			Map.put("section", section);
			HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(Map);
			pagingMap.put("s_id", s_id);

			List<BoardGqVO> boardGq = boardGqService.selectSellerBoardGqList(pagingMap);
			List<BoardGqVO> board2 = boardGqService.selectSellerBoardGqallList(s_id);

			for (BoardGqVO item : boardGq) {
				int g_id = item.getG_id();
				GoodsVO goodsVO = goodsService.selectGoodsDetail(g_id);
				String g_name = goodsVO.getG_name();
				item.setG_name(g_name);
			}

			for (BoardGqVO item : boardGq) {
				for (BoardGqVO j : board2) {
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
			mav.addObject("boardGq", boardGq);
			mav.addObject("sellerVO", sellerVO);
			mav.setViewName(viewName);
		}else {
			viewName = "redirect:/main/loginForm.do";
			mav.setViewName(viewName);
			message = "판매자 아이디로 로그인 해주시길 바랍니다";
		}
		if (message != null) {
			mav.addObject("message", message);
		}
		
		return mav;

	}

	@Override
	@RequestMapping(value = "gq_detail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGqView(@RequestParam("b_gq_id") int b_gq_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String message = (String) request.getAttribute("message");
		if (message != null) {
			mav.addObject("message", message);
		}
		Map boardGqMap = boardGqService.boardGqView(b_gq_id);
		BoardGqVO boardGqVO = (BoardGqVO) boardGqMap.get("boardGqVO");
		List<Img_gqVO> imageList = (List<Img_gqVO>) boardGqMap.get("imageList");
		mav.addObject("boardGqInfo", boardGqVO);
		mav.addObject("imageList", imageList);
		System.out.println("뷰네임" + viewName);
		mav.setViewName(viewName);

		// 추가 리스트 들고올 것
		List<BoardGqVO> boardList = boardGqService.boardGqViewReview(b_gq_id);

		mav.addObject("ReviewList", boardList);

		return mav;
	}

	@Override
	@RequestMapping(value = "/boardGqWrite.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView writeCheck(@RequestParam(value = "g_id", required = false) int g_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminInfo = (AdminVO) session.getAttribute("AdminVO");
		System.out.println("member :" + memberInfo + "  seller :" + sellerInfo + "  admin : " + adminInfo);
		if (memberInfo == null && sellerInfo == null && adminInfo == null) {
// g_detail로 viewName 변경
			String viewName = "redirect:/main/loginForm.do";
			String message = "로그인을 해주세요.";
			mav.addObject("message", message);
			mav.setViewName(viewName);
			return mav;
		} else {
			String viewName = "/boardGq/boardGqWrite";
			mav.setViewName(viewName);
			List<Img_gVO> imageList = (List<Img_gVO>) goodsService.selectImgList(g_id);
			mav.addObject("imageList", imageList);
			GoodsVO goodsInfo = (GoodsVO) goodsService.selectGoodsDetail(g_id);
			mav.addObject("goodsInfo", goodsInfo);
			return mav;
		}

	}

	@Override
	@RequestMapping(value = "/boardGqReviewform.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGqReviewForm(@RequestParam(value = "b_gq_id", required = false) Integer b_gq_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map boardGqMap = boardGqService.boardGqView(b_gq_id);
		BoardGqVO boardGqVO = (BoardGqVO) boardGqMap.get("boardGqVO");
		int g_id = boardGqVO.getG_id();
		String viewName = (String) request.getAttribute("viewName");
		List<Img_gqVO> imageList = (List<Img_gqVO>) boardGqMap.get("imageList");
		HttpSession session = request.getSession();
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminVO = (AdminVO) session.getAttribute("adminInfo");
		try {
			if (sellerInfo != null) {
				if(sellerInfo.getS_id().equals(boardGqVO.getS_id())) {
				mav.addObject("boardGqVO", boardGqVO);
				mav.addObject("imageList", imageList);
				mav.setViewName(viewName);
				}
			} else if (adminVO != null) {
				mav.addObject("boardGqVO", boardGqVO);
				mav.addObject("imageList", imageList);
				mav.setViewName(viewName);
			} else {
				String message = "리뷰에 대한 권한이없습니다.";
				mav.addObject("message", message);
				mav.addObject("b_gq_id", b_gq_id);
				viewName = "redirect:/goods/goodsDetail.do?g_id="+ g_id;
				mav.setViewName(viewName);

			}
			return mav;
		} catch (Exception e) {
			mav.addObject("boardGqVO", boardGqVO);
			String message = "회원정보가 일치하지 않습니다.";
			mav.addObject("message", message);
			mav.addObject("b_gq_id", b_gq_id);
			viewName = "redirect:/boardGq/gq_detail.do";
			mav.setViewName(viewName);
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/boardGqReviewUpdateform.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGqReviewUpdateForm(@RequestParam(value = "b_gq_id", required = false) Integer b_gq_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		Map boardGqMap = boardGqService.boardGqView(b_gq_id);
		BoardGqVO boardGqVO = (BoardGqVO) boardGqMap.get("boardGqVO");
		List<Img_gqVO> imageList = (List<Img_gqVO>) boardGqMap.get("imageList");
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminVO = (AdminVO) session.getAttribute("adminInfo");
		try {
			if (sellerVO != null) {
				if (sellerVO.getS_id().equals(boardGqVO.getS_id())) {
					//mav.addObject("sellerVO", sellerVO);
					mav.addObject("boardGqVO", boardGqVO);
					mav.addObject("imageList", imageList);
					mav.setViewName(viewName);
				} else {
					String message = "리뷰에 대한 권한이없습니다.";
					mav.addObject("message", message);
					mav.addObject("b_gq_id", b_gq_id);
					viewName = "redirect:/boardGq/gq_detail.do";
					mav.setViewName(viewName);
				}

			} else if (adminVO != null) {
				mav.addObject("boardGqVO", boardGqVO);
				mav.addObject("imageList", imageList);
				mav.setViewName(viewName);
			} else {
				String message = "리뷰에 대한 권한이없습니다.";
				mav.addObject("message", message);
				mav.addObject("b_gq_id", b_gq_id);
				viewName = "redirect:/boardGq/gq_detail.do";
				mav.setViewName(viewName);
			}
			return mav;
		} catch (Exception e) {
			mav.addObject("boardGqVO", boardGqVO);
			String message = "회원정보가 일치하지 않습니다.";
			mav.addObject("message", message);
			mav.addObject("b_gq_id", b_gq_id);
			viewName = "redirect:/boardGq/gq_detail.do";
			mav.setViewName(viewName);
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/boardGqDelete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardGqDelete(@RequestParam(value = "b_gq_id", required = false) Integer b_gq_id,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		Map boardGqMap = boardGqService.boardGqView(b_gq_id);
		BoardGqVO boardGqVO = (BoardGqVO) boardGqMap.get("boardGqVO");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		System.out.println("sellerInfo : " + sellerVO + "1" + boardGqVO.getS_id());
		AdminVO adminVO = (AdminVO) session.getAttribute("adminInfo");
		try {
			if (memberVO != null) {

				if (memberVO.getU_id().equals(boardGqVO.getU_id())) {
					boardGqService.boardGqDelete(b_gq_id);
					String viewName1 = "redirect:/boardGq/selectMyBoardGqList.do";
					String message = "게시글이 삭제 되었습니다";
					redirectAttributes.addAttribute("message", message);
					mav.setViewName(viewName1);
					return mav;
				}

			} else if (sellerVO != null) {
				if (sellerVO.getS_id().equals(boardGqVO.getS_id())) {
					boardGqService.boardGqDelete(b_gq_id);
					String message = "게시글이 삭제 되었습니다";
					redirectAttributes.addAttribute("message", message);
					String viewName1 = "redirect:/boardGq/selectSellerBoardGqList.do";
					mav.setViewName(viewName1);
					return mav;
				}

			} else if (adminVO != null) {
				boardGqService.boardGqDelete(b_gq_id);
				String message = "게시글이 삭제 되었습니다";
				redirectAttributes.addAttribute("message", message);
				String viewName1 = "redirect:/boardGq/selectBoardGqList.do";
				mav.setViewName(viewName1);
				return mav;
			}else {
			String message = "게시물 작성자가 아닙니다.";
			redirectAttributes.addAttribute("message", message);
			redirectAttributes.addAttribute("b_gq_id", b_gq_id);
			viewName = "redirect:/boardGq/gq_detail.do";
			mav.setViewName(viewName);
			return mav;
			}
			return mav;
		} catch (Exception e) {
			mav.addObject("boardGqVO", boardGqVO);
			String message = "회원정보가 일치하지 않습니다.";
			redirectAttributes.addAttribute("message", message);
			redirectAttributes.addAttribute("b_gq_id", b_gq_id);
			viewName = "redirect:/boardGq/gq_detail.do";
			mav.setViewName(viewName);
			return mav;
		}

	}

}
