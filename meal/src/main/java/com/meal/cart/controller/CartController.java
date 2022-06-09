package com.meal.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ResponseEntity addGoodsInCart(@RequestParam("g_id") int g_id,String cate,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView removeCartGoods(@RequestParam("c_id") int c_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView minusCartGoods(@RequestParam("c_id") int c_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
		
	public ModelAndView plusCartGoods(@RequestParam("c_id") int c_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView myZzim(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView removeZzimGoods(@RequestParam("c_id") int c_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
