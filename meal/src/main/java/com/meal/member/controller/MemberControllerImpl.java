package com.meal.member.controller;

import java.util.HashMap;

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
import com.meal.common.controller.BaseController;
import com.meal.member.service.MemberService;
import com.meal.member.vo.MemberVO;
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
	private MemberVO memberVO;
	@Autowired
	private SellerVO sellerVO;
	@Autowired
	private AdminVO adminVO;
	@Autowired
	BCryptPasswordEncoder passwordEncode;

	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		String u_id = memberInfo.getU_id();
	
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
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
			String viewName1 = "/main/memberForm";
			mav.setViewName(viewName1);
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
		} catch (Exception e) {
			message = "<script>";
			message += " alert('다시 내용을 입력해주세요');";
			message += " location.href='" + request.getContextPath() + "/user/userUpdateForm.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/deleteMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity deleteMember(@RequestParam HashMap<String,Object> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		MemberVO memberVO1 = (MemberVO) session.getAttribute("memberInfo");
		//복호화를 위해 꺼내줌
		MemberVO memberVO2 = memberService.decode(memberVO1.getU_id());
		//입력해준 값에 관하여 pw를 꺼내줌
		String pw= (String) map.get("pw");
		String message = "";
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			if (passwordEncode.matches(pw, memberVO2.getU_pw())) {

				memberService.delMember(memberVO1);
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
		} catch (Exception e) {
			e.printStackTrace();
		}

		ResponseEntity resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	


}
