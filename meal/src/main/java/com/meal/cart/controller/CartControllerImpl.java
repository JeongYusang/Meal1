package com.meal.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import com.meal.cart.service.CartService;
import com.meal.cart.vo.CartVO;
import com.meal.common.controller.BaseController;
import com.meal.member.vo.MemberVO;

@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends BaseController implements CartController{
	
	private static final Logger logger = LoggerFactory.getLogger(CartControllerImpl.class);
	
	
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/myCartList.do" ,method = RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		MemberVO memberInfo=(MemberVO)session.getAttribute("memberInfo");
		String u_id=memberInfo.getU_id();
		List <CartVO> CartList=cartService.myCartList(u_id);
		mav.addObject("CartList", CartList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/myZzimList.do" ,method = RequestMethod.GET)
	public ModelAndView myZzim(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		MemberVO memberInfo=(MemberVO)session.getAttribute("memberInfo");
		String u_id=memberInfo.getU_id();
		List <CartVO> ZzimList=cartService.myZzimList(u_id);
		mav.addObject("ZzimList", ZzimList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/addGoodsInCart.do" ,method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity addGoodsInCart(@RequestParam("g_id") int g_id,@RequestParam("cate") String cate,@RequestParam(value="c_qty", required = false) String c_qty,
            HttpServletRequest request, HttpServletResponse response)  throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			HttpSession session=request.getSession();
			memberVO=(MemberVO)session.getAttribute("memberInfo");
			String u_id=memberVO.getU_id();
			CartVO cartVO = new CartVO();
			cartVO.setU_id(u_id);
			cartVO.setG_id(g_id);
			cartVO.setCate(cate);
			if(c_qty!= null) {
			cartVO.setC_qty(Integer.parseInt(c_qty));
			}
			boolean isAreadyExisted=cartService.findCartGoods(cartVO);
			if(isAreadyExisted==true){
				if(cate.equals("cart")) {
				message = "<script>";
				message += " alert('이미 장바구니에 등록된 상품입니다.');";
				message += " location.href='" + request.getContextPath() + "/main/main.do';";
				message += " </script>";
				}else if(cate.equals("zzim"))  {
					message = "<script>";
					message += " alert('이미 찜된 상품입니다.');";
					message += " location.href='" + request.getContextPath() + "/main/main.do';";
					message += " </script>";
				}
			}else{
				if(cate.equals("cart")) {
				cartService.addGoodsInCart(cartVO);
				message = "<script>";
				message += " if (confirm('장바구니에 추가 되었습니다 장바구니 페이지로 이동하시겠습니까?.'))";
				message += " {location.href='" + request.getContextPath() + "/cart/myCartList.do';}";
				message += " else {";
				message += " location.href='" + request.getContextPath() + "/goods/goodsDetail.do?g_id=" + g_id +"';}";
				message += " </script>";
				}else {
					cartService.addGoodsInCart(cartVO);
					List<CartVO> quickZzimList = cartService.myZzimList(u_id);
					session.setAttribute("quickZzimList",quickZzimList);
					session.setAttribute("quickZzimListNum", quickZzimList.size());
					message = "<script>";
					message += " alert('찜되었습니다.');";
					message += " location.href='" + request.getContextPath() + "/main/main.do';";
					message += " </script>";
				}
			}

		} catch (Exception e) {
			message = "<script>";
			message += " alert('로그인 해주시길 바랍니다');";
			message += " location.href='" + request.getContextPath() + "/main/loginForm.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/removeCartGoods.do" ,method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView removeCartGoods(@RequestParam("c_id") int c_id,HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		cartService.removeCartGoods(c_id);
		session.removeAttribute("quickZzimList");
		session.removeAttribute("quickZzimListNum");
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		String u_id = memberInfo.getU_id();
		List <CartVO> quickZzimList=cartService.myZzimList(u_id);
		String viewName = "redirect:/cart/myCartList.do";
		mav.setViewName(viewName);
		session.setAttribute("quickZzimList",quickZzimList);
		session.setAttribute("quickZzimListNum", quickZzimList.size());
		return mav;
	}
	@Override
	@RequestMapping(value="/removeZzimGoods.do" ,method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView removeZzimGoods(@RequestParam("c_id") int c_id,HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav=new ModelAndView();
		cartService.removeCartGoods(c_id);
		String viewName = "redirect:/cart/myZzimList.do";
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/plusCartGoods.do" ,method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView plusCartGoods(@RequestParam("c_id") int c_id,HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav=new ModelAndView();
		cartService.plusCartGoods(c_id);
		String viewName = "redirect:/cart/myCartList.do";
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/minusCartGoods.do" ,method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView minusCartGoods(@RequestParam("c_id") int c_id,HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav=new ModelAndView();
		int c_qty = cartService.CartQty(c_id);
		logger.info("=======================");		
		logger.info(c_qty + "문자열");
		logger.info("=======================");
		if (c_qty <= 1) {
			String viewName = "redirect:/cart/myCartList.do";
			String message = "수량 최소 1개 이상 선택해주시길 바랍니다";
			mav.setViewName(viewName);
			mav.addObject(message);
			return mav;
		}else {
			cartService.minusCartGoods(c_id);
			String viewName = "redirect:/cart/myCartList.do";
			mav.setViewName(viewName);
			return mav;
		}
		
	}
	
}
