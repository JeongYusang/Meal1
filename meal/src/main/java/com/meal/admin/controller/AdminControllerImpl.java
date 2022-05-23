package com.meal.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.meal.goods.service.GoodsService;
import com.meal.member.service.MemberService;
import com.meal.member.vo.MemberVO;
import com.meal.seller.service.SellerService;
import com.meal.seller.vo.SellerVO;

@Controller("adminController")
@RequestMapping("/admin")
public class AdminControllerImpl extends BaseController implements AdminController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private SellerService sellerService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private GoodsService goodsService;
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
		AdminVO adminInfo = (AdminVO) session.getAttribute("adminInfo");
		String a_id = adminInfo.getA_id();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("adminInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}

	@RequestMapping(value = "/addadmin.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addAdmin(@ModelAttribute("adminVO") AdminVO _adminVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String a_id = _adminVO.getU_id();
		String a_pw = _adminVO.getU_pw();
		String a_name = _adminVO.getU_name();
		String a_hp = _adminVO.getU_hp1();
		String a_email1 = _adminVO.getU_email1();
		String a_email2 = _adminVO.getU_email2();
		String encodeu_pw = passwordEncode.encode(a_pw);
		_adminVO.setA_id(a_id);
		_adminVO.setA_pw(encodeu_pw);
		_adminVO.setA_name(a_name);
		_adminVO.setA_hp(a_hp);
		_adminVO.setA_email1(a_email1);
		_adminVO.setA_email2(a_email2);
		adminService.addAdmin(_adminVO);
		String viewName = "/main/main";
		mav.setViewName(viewName);
		return mav;
	}
	//회원조회
	@RequestMapping(value = "/selectAllMembers.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectAllMembers(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
		pagingInfo.put("section", section);
		pagingInfo.put("pageNum", pageNum);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);
		List<MemberVO> memberVO = adminService.selectAllMembers(pagingMap);
		mav.addObject("memberlist", memberVO);
		
		//해당부분은 메세지가 있을경우 출력해주기 위한것!
		String message = (String)request.getAttribute("message");
		if (message !=null ) {
			mav.addObject("message", message);
		}
		return mav;
	}
	
	//판매자조회
	@RequestMapping(value = "/selectAllSellers.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectAllSellers(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
		pagingInfo.put("section", section);
		pagingInfo.put("pageNum", pageNum);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);
		List<SellerVO> sellerVO = adminService.selectAllSellers(pagingMap);
		mav.addObject("sellerlist", sellerVO);
		
		return mav;
	}

	
	// 관리자 기준의 상품 or 회원관리 관련한 폼
		@RequestMapping(value = "/AUpdateForm.do", method = RequestMethod.GET)
		public ModelAndView AupdateForm(@RequestParam("id") String id, HttpServletRequest request,
				HttpServletResponse response) throws Exception {

			ModelAndView mav = new ModelAndView();
			HttpSession session = request.getSession();
			AdminVO adminInfo = (AdminVO)session.getAttribute("adminInfo");
			//id 를 통해서 seller인지 member인지 확인
			MemberVO memberVO = (MemberVO)memberService.decode(id);
			SellerVO sellerVO = (SellerVO) sellerService.decode(id);
			
			
			if (memberVO != null) {
			
				String viewName = "/admin/memberUpdate";
				mav.setViewName(viewName);
				return mav;
				
			}else if (sellerVO != null) {
				String viewName = "/admin/sellerUpdate";
				mav.setViewName(viewName);
				return mav;
			}else {
				
				String message = "등록되지 않은 회원입니다.";
				String viewName = "redirect:/admin/selectAllSellers.do";
				mav.addObject("message", message);
				mav.setViewName(viewName);
			}
			

			return mav;
		}
}
