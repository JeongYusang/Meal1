package com.meal.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.meal.order.vo.OrderVO;

public interface OrderController {

	public ModelAndView insertOrder(OrderVO _orderVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
