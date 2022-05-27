package com.meal.order.dao;

import org.springframework.dao.DataAccessException;

import com.meal.order.vo.OrderVO;

public interface OrderDAO {
	public void insertOrder(OrderVO orderVO) throws DataAccessException;

}
