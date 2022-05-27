package com.meal.order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meal.order.vo.OrderVO;

public interface OrderController {

	public ModelAndView insertOrder(OrderVO _orderVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView selectUserOrders(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView deleteOrder(@RequestParam("o_id") int o_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView OrderForm(@RequestParam("g_id") int g_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
