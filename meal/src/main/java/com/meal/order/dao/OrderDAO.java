package com.meal.order.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.order.vo.OrderVO;

public interface OrderDAO {
	public void insertOrder(OrderVO orderVO) throws DataAccessException;

	public List<OrderVO> selectUserOrders(String u_id) throws DataAccessException;
	
	public List<OrderVO> UserboardOrderPage(HashMap<String, Object> map) throws DataAccessException;

	public List<OrderVO> selectorderList(HashMap<String, String> OrderState);

	public String findU_id(int o_id);

	public void deleteOrder(int o_id);

	public String overlappedO_id(int o_id);


}
