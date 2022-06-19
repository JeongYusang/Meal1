package com.meal.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meal.order.vo.OrderVO;

public interface OrderController {

	public ModelAndView selectUserOrders(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView deleteOrder(@RequestParam("o_id") int o_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView OrderForm(@RequestParam("g_id") int g_id, @RequestParam("amount") int amount,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView insertOrder(OrderVO _orderVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView OrderResult(@RequestParam(value = "parentNo", required = false) String parentNo,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView CartOrderForm(@RequestParam("OrderToCart") String OrderToCart, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView insertCartOrder(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception ;

	public ModelAndView selectCanceledOrders(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView selectOrder(@RequestParam("o_id") int o_id,
			@RequestParam(value = "message", required = false) String message, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
