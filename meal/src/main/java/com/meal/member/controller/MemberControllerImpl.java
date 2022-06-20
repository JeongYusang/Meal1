package com.meal.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meal.admin.service.AdminService;
import com.meal.admin.vo.AdminVO;
import com.meal.board.gq.service.BoardGqService;
import com.meal.board.gq.vo.BoardGqVO;
import com.meal.board.gr.service.BoardGrService;
import com.meal.board.gr.vo.BoardGrVO;
import com.meal.board.gr.vo.Img_grVO;
import com.meal.board.one.service.Board1Service;
import com.meal.board.one.vo.Board1VO;
import com.meal.common.controller.BaseController;
import com.meal.goods.service.GoodsService;
import com.meal.goods.vo.GoodsVO;
import com.meal.member.service.MemberService;
import com.meal.member.vo.MemberVO;
import com.meal.member.vo.MileageVO;
import com.meal.order.service.OrderService;
import com.meal.order.vo.OrderVO;
import com.meal.seller.service.SellerService;
import com.meal.seller.vo.SellerVO;

@Controller("memberController")
@RequestMapping("/member")
public class MemberControllerImpl extends BaseController implements MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);

	@Autowired
	private MemberService memberService;
	@Autowired
	private SellerService sellerService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private BoardGqService boardGqService;
	@Autowired
	private BoardGrService boardGrService;
	@Autowired
	private Board1Service board1Service;
	@Autowired
	private GoodsService goodsService;

	@Autowired
	private MemberVO memberVO;
	@Autowired
	private SellerVO sellerVO;
	@Autowired
	private AdminVO adminVO;
	@Autowired
	private MileageVO mileageVO;

	@Autowired
	BCryptPasswordEncoder passwordEncode;

	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		session.removeAttribute("quickZzimList");
		session.removeAttribute("quickZzimListNum");
		String message = "로그아웃이 완료되었습니다.";
		mav.addObject("message", message);
		mav.setViewName("redirect:/main/main.do");

		return mav;
	}

	@Override
	@RequestMapping(value = "/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember1(@ModelAttribute("memberVO") MemberVO _memberVO, @RequestParam("u_id") String u_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		// BCriptPassWordEncoder encoder = new BCriptPassWordEncoder();

		try {
			String u_pw = _memberVO.getU_pw();
			String encodeu_pw = passwordEncode.encode(u_pw);
			_memberVO.setU_pw(encodeu_pw);
			memberService.addMember(_memberVO);
			String viewName = "/member/memberResult";
			mav.setViewName(viewName);
			String id = u_id;
			request.setAttribute("id", id);
			_memberVO.setU_pw(u_pw);
			mav.addObject("MemberInfo", _memberVO);
			return mav;
		} catch (Exception e) {
			String message = "다시 가입해주세요";
			mav.addObject("message", message);
			String viewName = "/main/memberForm";
			mav.setViewName(viewName);
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);

		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/updatemember.do", method = RequestMethod.POST)
	public ResponseEntity updateMember(@ModelAttribute("memberVO") MemberVO _memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			if (_memberVO.getU_pw() != null) {
				String u_pw = _memberVO.getU_pw();
				String encodeu_pw = passwordEncode.encode(u_pw);
				_memberVO.setU_pw(encodeu_pw);
				memberService.updateMember(_memberVO);
				_memberVO.setU_pw(u_pw);
				HttpSession session = request.getSession();
				session.setAttribute("memberInfo", _memberVO);

				message = "<script>";
				message += " alert('회원수정이 완료되었습니다..');";
				message += " location.href='" + request.getContextPath() + "/member/memberResult.do';";
				message += " </script>";
				/*
				 * } else { message = "<script>"; message += " alert('다시 내용을 입력해주세요');"; message
				 * += " location.href='" + request.getContextPath() + "/user/userUpdate.do';";
				 * message += " </script>"; }
				 */
			} else {
				memberService.updateMember(_memberVO);
				message = "<script>";
				message += " alert('회원수정이 완료되었습니다..');";
				message += " location.href='" + request.getContextPath() + "/member/memberDetail.do?u_id="
						+ _memberVO.getU_id() + "';";
				message += " </script>";
			}
		} catch (Exception e) {
			message = "<script>";
			message += " alert('다시 내용을 입력해주세요');";
			message += " location.href='" + request.getContextPath() + "/member/MemberUpdateForm.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/MemberUpdateForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView UpdateForm(@RequestParam(value = "u_id", required = false) String u_id,
			@RequestParam HashMap<String, Object> map, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		AdminVO adminInfo = (AdminVO) session.getAttribute("adminInfo");
		String pw = (String) map.get("pw");
		if (memberInfo != null) {
			// 복호화를 위해 꺼내줌
			MemberVO memberVO = memberService.decode(memberInfo.getU_id());
			// 입력해준 값에 관하여 pw를 꺼내줌

			if (passwordEncode.matches(pw, memberVO.getU_pw())) {
				memberVO.setU_pw(memberInfo.getU_pw());
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				mav.addObject("memberVO", memberVO);
			} else {
				String message = "비밀번호가 틀렸습니다";
				mav.addObject(message);
				String viewName = "redirect://member/memberDetail.do?u_id=" + memberInfo.getU_id();
				mav.setViewName(viewName);
			}

		} else if (u_id != null && adminInfo != null) {
			MemberVO memberVO = memberService.decode(u_id);
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			mav.addObject("memberVO", memberVO);
		}
		return mav;

	}

	@SuppressWarnings("unused")
	@Override
	@RequestMapping(value = "/deleteMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity deleteMember(@RequestParam(value = "u_id", required = false) String u_id,
			@RequestParam HashMap<String, Object> map, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		// 복호화를 위해 꺼내줌
		
		String message = "";
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			if (memberInfo != null) {
				MemberVO memberVO2 = memberService.decode(memberInfo.getU_id());
				// 입력해준 값에 관하여 pw를 꺼내줌
				String pw = (String) map.get("pw");
				if (passwordEncode.matches(pw, memberVO2.getU_pw())) {
					memberService.delMember(memberInfo);
					adminService.insertReason(map);
					session.setAttribute("isLogOn", false);
					session.removeAttribute("memberInfo");
					session.removeAttribute("sellerInfo");
					message = "<script>";
					message += "alert('회원이 삭제되었습니다.');";
					message += "location.href='" + request.getContextPath() + "/main/main.do';";
					message += "</script>";
					session.removeAttribute("memberInfo");
					session.setAttribute("lsLogOn", false);
				} else {
					message = "<script>";
					message += "alert('비밀번호가 동일하지 않습니다.');";
					message += "location.href='" + request.getContextPath() + "/mypage/deleteMemberform.do';";
					message += "</script>";
				}
			}else if (u_id != null) {
					MemberVO memberVO = memberService.decode(u_id);
					memberService.delMember(memberVO);
					message = "<script>";
					message += "alert('회원이 삭제되었습니다.');";
					message += "location.href='" + request.getContextPath() + "/main/main.do';";
					message += "</script>";
			}else {
				message = "<script>";
				message += "alert('비밀번호가 동일하지 않습니다.');";
				message += "location.href='" + request.getContextPath() + "/mypage/deleteMemberform.do';";
				message += "</script>";
				
			}
			ResponseEntity resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			return resEntity;
		}

		

	// 회원 상세 정보창으로 가는것 admin 상세로도 사용중
	@Override
	@RequestMapping(value = "/memberDetail.do", method = RequestMethod.GET)
	public ModelAndView memberDetail(@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum,
			@RequestParam(value = "u_id", required = false) String u_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberInfo = (MemberVO) memberService.decode(u_id);
		HttpSession session = request.getSession();
		AdminVO adminInfo = (AdminVO) session.getAttribute("adminInfo");

		if (memberInfo != null || adminInfo != null) {
			mav.addObject("memberVO", memberInfo);
			HashMap<String, Object> Map = new HashMap<String, Object>();
			Map.put("pageNum", pageNum);
			Map.put("section", section);
			HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(Map);
			pagingMap.put("u_id", u_id);
			List<OrderVO> OrderList = orderService.UserboardOrderPage(pagingMap);
			for (OrderVO item : OrderList) {
				int o_id = item.getO_id();
				String review = orderService.overlappedO_id(o_id);
				item.setReview(review);
				BoardGrVO o_idSearch = (BoardGrVO) boardGrService.o_idSearch(o_id);
				if(o_idSearch != null) {
				if ((int) item.getO_id() == (int) ((BoardGrVO) o_idSearch).getO_id()) {
								item.setB_gr_id(((BoardGrVO) o_idSearch).getB_gr_id());
							}
				}
			}
			
			List<OrderVO> CancledOrderList = orderService.CanceledUserOrderPage(pagingMap);
			List<Board1VO> Board1List = board1Service.selectMyBoard1List(pagingMap);
			List<BoardGrVO> BoardGrList = boardGrService.selectMyBoardGrList(pagingMap);
			List<BoardGqVO> BoardGqList = boardGqService.selectMyBoardGqList(pagingMap);
			List<BoardGrVO> BoardGr = boardGrService.selectBoardGrallList();
			List<BoardGqVO> BoardGq = boardGqService.selectBoardGqallList();
			List<Board1VO> board1 = board1Service.selectBoard1allList();

			for (Board1VO item : Board1List) {
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

			for (BoardGqVO item : BoardGqList) {
				int g_id = item.getG_id();
				GoodsVO goodsVO = goodsService.selectGoodsDetail(g_id);
				String g_name = goodsVO.getG_name();
				item.setG_name(g_name);
			}

			for (BoardGqVO item : BoardGqList) {
				for (BoardGqVO j : BoardGq) {
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

			for (BoardGrVO item : BoardGrList) {
				int g_id = item.getG_id();
				GoodsVO goodsVO = goodsService.selectGoodsDetail(g_id);
				String g_name = goodsVO.getG_name();
				item.setG_name(g_name);
			}

			for (BoardGrVO item : BoardGrList) {
				for (BoardGrVO j : BoardGr) {
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
			mav.addObject("OrderList", OrderList);
			mav.addObject("CancledOrderList", CancledOrderList);
			mav.addObject("Board1List", Board1List);
			mav.addObject("BoardGrList", BoardGrList);
			mav.addObject("BoardGqList", BoardGqList);
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
		} else {
			message = "로그인을 해주시길 바랍니다.";
			String viewName = "redirect:/main/loginForm.do";
			mav.setViewName(viewName);

		}

		return mav;
	}

	// hp 인증
	@RequestMapping(value = "/FindIDResult2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView FindIDEmail(@RequestParam HashMap<String, Object> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			String name = (String) map.get("name");
			String hp1 = (String) map.get("hp1");
			String u_id = memberService.FindID2(map).getU_id();
			;
			mav.addObject("u_id", u_id);
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		} catch (Exception e) {
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}

	}

	// 회원 마일리지 조회
	@Override
	@RequestMapping(value = "/myMileage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myMileage(@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		try {
			if (memberInfo != null) {
				String u_id = memberInfo.getU_id();
				int u_mile = memberInfo.getU_mile();
				HashMap<String, Object> Map = new HashMap<String, Object>();
				Map.put("pageNum", pageNum);
				Map.put("section", section);
				HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(Map);
				pagingMap.put("u_id", u_id);

				List<MileageVO> MilagePage = memberService.myMileageList(pagingMap);
				List<MileageVO> myMileagePlus = memberService.myMileagePlus(pagingMap);
				List<MileageVO> myMileageMinus = memberService.myMileageMinus(pagingMap);
				String viewName = (String) request.getAttribute("viewName");
				mav.addObject("MilagePage", MilagePage);
				mav.addObject("myMileagePlus", myMileagePlus);
				mav.addObject("myMileageMinus", myMileageMinus);
				mav.addObject("u_mile", u_mile);
				mav.setViewName(viewName);
			} else {
				message = "로그인 해주시길 바랍니다.";
				String viewName = "redirect:/main/loginForm.do";
				mav.setViewName(viewName);
				mav.addObject(message);
			}

		} catch (Exception e) {
			message = "오류가 발생하였습니다";
			String viewName = "redirect:/main/main.do";
			mav.setViewName(viewName);
			mav.addObject(message);
		}

		return mav;

	}

}
