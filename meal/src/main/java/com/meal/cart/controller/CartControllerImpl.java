package com.meal.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.meal.cart.service.CartService;
import com.meal.cart.vo.CartVO;
import com.meal.common.controller.BaseController;
import com.meal.member.vo.MemberVO;

@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends BaseController implements CartController{
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;
	
	@RequestMapping(value="/myCartList.do" ,method = RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		MemberVO memberInfo=(MemberVO)session.getAttribute("memberInfo");
		String u_id=memberInfo.getU_id();
		List <CartVO> CartList=cartService.myCartList(u_id);
		System.out.println(CartList);
		mav.addObject("CartList", CartList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/addGoodsInCart.do" ,method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity addGoodsInCart(@RequestParam("g_id") int g_id,
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
			String member_id=memberVO.getU_id();
			cartVO.setU_id(member_id);
			cartVO.setG_id(g_id);
			cartVO.setCate("cart");
			boolean isAreadyExisted=cartService.findCartGoods(cartVO);
			System.out.println("isAreadyExisted:"+isAreadyExisted);
			if(isAreadyExisted==true){
				message = "<script>";
				message += " alert('이미 등록된 상품입니다.');";
				message += " location.href='" + request.getContextPath() + "/goods/goodsDetail.do?g_id=" + g_id +"';";
				message += " </script>";
				
			}else{
				cartService.addGoodsInCart(cartVO);
				message = "<script>";
				message += " confirm('장바구니에 추가 되었습니다. 장바구니를 확인 하시겠습니까?');";
				message += " location.href='" + request.getContextPath() + "/cart/myCartList.do';";
				message += " </script>";
			}

		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다');";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/modifyCartQty.do" ,method = RequestMethod.POST)
	public @ResponseBody String  modifyCartQty(@RequestParam("goods_id") int goods_id,
			                                   @RequestParam("cart_goods_qty") int c_qty,
			                                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getU_id();
		cartVO.setG_id(goods_id);
		cartVO.setU_id(member_id);
		cartVO.setC_qty(c_qty);
		boolean result=cartService.modifyCartQty(cartVO);
		
		if(result==true){
		   return "modify_success";
		}else{
			  return "modify_failed";	
		}
		
	}
	/*
	@RequestMapping(value="/addGoodsInCart.do" ,method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public  @ResponseBody String addGoodsInCart(@RequestParam("g_id") int g_id,
			                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String U_id=memberVO.getU_id();
		
		cartVO.setU_id(U_id);
		//īƮ ������� �̹� ��ϵ� ��ǰ���� �Ǻ��Ѵ�.
		cartVO.setG_id(g_id);
		cartVO.setU_id(U_id);
		boolean isAreadyExisted=cartService.findCartGoods(cartVO);
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		if(isAreadyExisted==true){
			return "already_existed";
		}else{
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}
	*/
	@RequestMapping(value="/removeCartGoods.do" ,method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView removeCartGoods(@RequestParam("c_id") int c_id,
			                          HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav=new ModelAndView();
		cartService.removeCartGoods(c_id);
		String viewName = "redirect:/cart/myCartList.do";
		mav.setViewName(viewName);
		return mav;
	}
}
