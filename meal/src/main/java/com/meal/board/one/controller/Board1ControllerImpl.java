package com.meal.board.one.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meal.admin.vo.AdminVO;
import com.meal.board.gr.controller.BoardGrControllerImpl;
import com.meal.board.one.service.Board1Service;
import com.meal.board.one.vo.Board1VO;
import com.meal.common.controller.BaseController;
import com.meal.member.vo.MemberVO;
import com.meal.seller.vo.SellerVO;

@Controller("board1Controller")
@RequestMapping("/board1")

public class Board1ControllerImpl extends BaseController implements Board1Controller {

	private static final Logger logger = LoggerFactory.getLogger(Board1ControllerImpl.class);

	@Autowired
	private Board1Service board1Service;
	@Autowired
	private Board1VO board1VO;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private SellerVO sellerVO;

	// 회원이 쓴 문의게시글 조회
	@Override
	@RequestMapping(value = "/selectMyBoard1.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectMyBoard1List(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
		if (memberInfo != null) {

			String u_id = memberInfo.getU_id();

			if (message != null) {
				mav.addObject("message", message);
			}
			HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
			pagingInfo.put("section", section);
			pagingInfo.put("pageNum", pageNum);
			HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);
			pagingMap.put("u_id", u_id);

			List<Board1VO> boardPage = board1Service.selectMyBoard1List(pagingMap);
			List<Board1VO> board1 = board1Service.selectBoard1allList();

			for (Board1VO item : boardPage) {
				for (Board1VO j : board1) {
					if (!((int) item.getB_1_id() == (int) j.getParentNo())) {
						String compare = "N";
						item.setCompare(compare);
					} else {
						String compare = "Y";
						item.setCompare(compare);
						System.out.println("BoardCompare" + item.getB_1_id());
						break;
					}
				}
			}
			mav.addObject("message", message);
			mav.addObject("board1", boardPage);
			mav.setViewName(viewName);
		} else if (sellerInfo != null) {
			String s_id = sellerInfo.getS_id();
			if (message != null) {
				mav.addObject("message", message);
			}
			HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
			pagingInfo.put("section", section);
			pagingInfo.put("pageNum", pageNum);
			HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);
			pagingMap.put("s_id", s_id);

			List<Board1VO> boardPage = board1Service.selectMyBoard1List(pagingMap);
			List<Board1VO> board1 = board1Service.selectBoard1allList();

			for (Board1VO item : boardPage) {
				for (Board1VO j : board1) {
					if (!((int) item.getB_1_id() == (int) j.getParentNo())) {
						String compare = "N";
						item.setCompare(compare);
					} else {
						String compare = "Y";
						item.setCompare(compare);
						System.out.println("BoardCompare" + item.getB_1_id());
						break;
					}
				}
			}
			mav.addObject("message", message);
			mav.addObject("board1", boardPage);
			mav.setViewName(viewName);

		} else {
			message = "로그인 해주시길 바랍니다";
			mav.addObject("message", message);
			String viewName1 = "redirect:/main/main.do";
			mav.setViewName(viewName1);
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/board1insert.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView writeBoard1(@ModelAttribute("Board1VO") Board1VO board1VO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			HttpSession session = request.getSession();
			MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
			SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
			AdminVO adminInfo = (AdminVO) session.getAttribute("adminInfo");
			if (memberInfo != null || sellerInfo != null) {
				board1Service.board1Write(board1VO);
				String message = "글이 작성 되었습니다";
				mav.addObject("message", message);
				String viewName = "redirect:/board1/selectMyBoard1.do";
				mav.setViewName(viewName);
			}else if(adminInfo != null) {
				board1Service.board1Write(board1VO);
				String message = "글이 작성 되었습니다";
				mav.addObject("message", message);
				String viewName = "redirect:/board1/selectBoard1List.do";
				mav.setViewName(viewName);
			}else {
				String message = "로그인 해주시길 바랍니다";
				mav.addObject("message", message);
				String viewName = "redirect:/main/loginForm.do";
				mav.setViewName(viewName);
			}
			return mav;
		} catch (Exception e) {
			String viewName1 = "/board1/board1Write";
			mav.setViewName(viewName1);
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/board1Updateform.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView board1Updateform(@RequestParam("b_1_id") Integer b_1_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		Board1VO board1VO = board1Service.board1View(b_1_id);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminVO = (AdminVO) session.getAttribute("adminInfo");
		if (memberVO != null) {
			if (memberVO.getU_id().equals(board1VO.getU_id())) {
				mav.addObject("board1VO", board1VO);
				mav.setViewName(viewName);
			} else {
				String message = "회원정보가 일치하지 않습니다.";
				mav.addObject("message", message);
				mav.addObject("b_1_id", b_1_id);
				viewName = "redirect:/board1/b1Detail.do";
				mav.setViewName(viewName);

			}
		} else if (sellerVO != null)
			if (sellerVO.getS_id().equals(board1VO.getS_id())) {
				mav.addObject("board1VO", board1VO);
				mav.setViewName(viewName);
			} else {
				String message = "회원정보가 일치하지 않습니다.";
				mav.addObject("message", message);
				mav.addObject("b_1_id", b_1_id);
				viewName = "redirect:/board1/b1Detail.do";
				mav.setViewName(viewName);
			}
		else if (adminVO != null) {
			mav.addObject("board1VO", board1VO);
			mav.setViewName(viewName);
		} else {
			String message = "회원정보가 일치하지 않습니다.";
			mav.addObject("message", message);
			mav.addObject("b_1_id", b_1_id);
			viewName = "redirect:/board1/b1Detail.do";
			mav.setViewName(viewName);
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/board1Update.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView board1Update(@ModelAttribute Board1VO board1VO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		try {
			board1Service.board1Update(board1VO);
			viewName = "redirect:/board1/b1Detail.do";
			int b_1_id = board1VO.getB_1_id();
			mav.addObject("b_1_id", b_1_id);
			mav.setViewName(viewName);
		} catch (Exception e) {
			int b_1_id = (Integer) board1VO.getB_1_id();
			mav.addObject("b_1_id", b_1_id);
			viewName = "redirect:/board1/board1Updateform.do";
			mav.setViewName(viewName);
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/selectBoard1List.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectBoard1List(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		if (message != null) {
			mav.addObject("message", message);
		}
		HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
		pagingInfo.put("section", section);
		pagingInfo.put("pageNum", pageNum);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);

		List<Board1VO> board1 = board1Service.selectBoard1List(pagingMap);
		List<Board1VO> board2 = board1Service.selectBoard1allList();

		for (Board1VO item : board1) {
			for (Board1VO j : board2) {
				if (!((int) item.getB_1_id() == (int) j.getParentNo())) {
					String compare = "N";
					item.setCompare(compare);
				} else {
					String compare = "Y";
					item.setCompare(compare);
					System.out.println("BoardCompare" + item.getB_1_id());
					break;
				}
			}
		}
		mav.addObject("message", message);
		mav.addObject("board1", board1);
		return mav;
	}

	@Override
	@RequestMapping(value = "/b1Detail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView board1View(@RequestParam("b_1_id") int b_1_id,
			@RequestParam(value = "message", required = false) String message, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		if (message != null) {
			mav.addObject("message", message);
		}
		mav.setViewName(viewName);
		Board1VO board1VO = board1Service.board1View(b_1_id);
		// 추가 리스트 들고올 것
		List<Board1VO> boardList = board1Service.board1ViewReview(b_1_id);
		mav.addObject("board1Info", board1VO);
		mav.addObject("ReviewList", boardList);

		return mav;
	}

	@Override
	@RequestMapping(value = "/board1Write.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView writeCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerInfo = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminInfo = (AdminVO) session.getAttribute("AdminInfo");
		System.out.println("member :" + memberInfo + "  seller :" + sellerInfo + "  admin : " + adminInfo);
		if (memberInfo == null && sellerInfo == null && adminInfo == null) {
			String viewName1 = "redirect:/board1/selectBoard1List.do";
			String message = "로그인을 해주세요.";
			mav.addObject("message", message);
			mav.setViewName(viewName1);
			return mav;
		} else {
			String viewName = "/board1/board1Write";
			mav.setViewName(viewName);
			return mav;
		}

	}

	@Override
	@RequestMapping(value = "/board1Reviewform.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView board1ReviewForm(@RequestParam(value = "b_1_id", required = false) Integer b_1_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		Board1VO board1VO = board1Service.board1View(b_1_id);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminVO = (AdminVO) session.getAttribute("adminInfo");
		try {
			if (sellerVO != null && memberVO == null) {
				mav.addObject("board1VO", board1VO);
				mav.setViewName(viewName);
			} else if (adminVO != null && memberVO == null) {
				mav.addObject("board1VO", board1VO);
				mav.setViewName(viewName);
			} else {
				String message = "리뷰에 대한 권한이없습니다.";
				mav.addObject("message", message);
				mav.addObject("b_1_id", b_1_id);
				viewName = "redirect:/board1/b1Detail.do";
				mav.setViewName(viewName);

			}
			return mav;
		} catch (Exception e) {
			mav.addObject("board1VO", board1VO);
			String message = "회원정보가 일치하지 않습니다.";
			mav.addObject("message", message);
			mav.addObject("b_1_id", b_1_id);
			viewName = "redirect:/board1/b1Detail.do";
			mav.setViewName(viewName);
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/board1Delete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView board1Delete(@RequestParam(value = "b_1_id", required = false) Integer b_1_id,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = request.getParameter("viewName");
		Board1VO board1VO = board1Service.board1View(b_1_id);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		AdminVO adminVO = (AdminVO) session.getAttribute("adminInfo");
		try {
			if (memberVO != null) {

				if (memberVO.getU_id().equals(board1VO.getU_id())) {
					board1Service.board1Delete(b_1_id);
					String viewName1 = "redirect:/board1/selectMyBoard1.do";
					mav.setViewName(viewName1);
					return mav;
				}

			} else if (sellerVO != null) {

				if (sellerVO.getS_id().equals(board1VO.getS_id())) {
					board1Service.board1Delete(b_1_id);
					String viewName1 = "redirect:/board1/selectBoard1List.do";
					mav.setViewName(viewName1);
					return mav;
				}

			} else if (adminVO != null) {
				board1Service.board1Delete(b_1_id);
				String viewName1 = "redirect:/board1/selectBoard1List.do";
				mav.setViewName(viewName1);
				return mav;
			}
			String message = "게시물 작성자가 아닙니다.";
			redirectAttributes.addAttribute("message", message);
			viewName = "redirect:/board1/b1Detail.do";
			mav.setViewName(viewName);
			return mav;

		} catch (Exception e) {
			mav.addObject("board1VO", board1VO);
			String message = "회원정보가 일치하지 않습니다.";
			redirectAttributes.addAttribute("message", message);
			viewName = "redirect:/board1/b1Detail.do";
			mav.setViewName(viewName);
			return mav;
		}

	}

}
