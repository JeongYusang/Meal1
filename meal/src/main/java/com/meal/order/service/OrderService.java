package com.meal.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.meal.order.vo.OrderVO;

public interface OrderService {

	public void insertOrder(OrderVO _orderVO) throws Exception;

	public List<OrderVO> selectUserOrders(String u_id) throws Exception;
	
	public List<OrderVO> UserboardOrderPage(HashMap<String, Object> Map) throws Exception;

	public Map<String, List<OrderVO>> orderlist(String u_id) throws Exception;

	public String findU_id(int o_id);

	public void deleteOrder(int o_id);

	public String overlappedO_id(int o_id);

}
