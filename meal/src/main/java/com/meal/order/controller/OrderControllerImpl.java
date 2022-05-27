package com.meal.order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.meal.common.controller.BaseController;
import com.meal.order.dao.OrderDAO;
import com.meal.order.service.OrderService;
import com.meal.order.vo.OrderVO;


@RequestMapping("/order")
@Controller("orderController")
public class OrderControllerImpl extends BaseController implements OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderControllerImpl.class);
	
		@Autowired
		OrderDAO orderdao;
		
		@Autowired
		OrderService orderService;
		
		@Override
		@RequestMapping(value ="/insertOrder.do", method = RequestMethod.POST)
		public ModelAndView insertOrder(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			try {
			orderService.insertOrder(_orderVO);
			String viewName = "/order/orderresult";
			mav.setViewName(viewName);
			return mav;
		}
			catch(Exception e){
				String viewName1 = "/order/orderform";
				mav.setViewName(viewName1);
				String message = "주문중 오류가 발생 하였습니다. 다시 주문해주시길 바랍니다";
				mav.addObject(message);
				return mav;
			}
				
		}
}


