package com.meal.order.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meal.order.vo.OrderVO;

public interface OrderController {

	public ModelAndView selectUserOrders(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView deleteOrder(@RequestParam("o_id") int o_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView OrderForm(@RequestParam("g_id") int g_id,@RequestParam("amount") int amount,HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView insertOrder(OrderVO _orderVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView OrderResult(@RequestParam(value = "parentNo", required = false)String parentNo,HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView selectUserOrderList(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum,
			@RequestParam(value = "delivery_state", required = false) String delivery_state,HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView CartOrderForm(@RequestParam("OrderToCart") String OrderToCart,
			HttpServletRequest request, HttpServletResponse response) throws Exception ;
	@RequestMapping(value = "/insertCartOrder.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView insertCartOrder(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception ;
	
	
}
