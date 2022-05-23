package com.meal.order.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.meal.order.dao.OrderDAO;
import com.meal.order.vo.OrderVO;



@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public void insertOrder(OrderVO _orderVO) {
		orderDAO.insertOrder(_orderVO);
		
	}

	

		
	}


