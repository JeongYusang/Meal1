package com.meal.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.meal.order.vo.OrderVO;

public interface OrderService {

	public int insertOrder(OrderVO _orderVO) throws Exception;

	public List<OrderVO> selectUserOrders(String u_id) throws Exception;

	public List<OrderVO> UserboardOrderPage(HashMap<String, Object> Map) throws Exception;

	public Map<String, List<OrderVO>> orderlist(String u_id) throws Exception;

	public String findU_id(int o_id) throws Exception;

	public void deleteOrder(int o_id) throws Exception;

	public String overlappedO_id(int o_id) throws Exception;

	public List<OrderVO> OrderResult(String parentNo) throws Exception;

	public List<OrderVO> UserboardOrderListPage(HashMap<String, Object> pagingMap) throws Exception;

	public List<OrderVO> tabpageorderlist(HashMap<String, Object> infoMap);

	public String selectMaxParentNO(String u_id) throws Exception;

	public Map<String, List<OrderVO>> orderSellerList(String s_id) throws Exception;

	public int MaxOrderNum() throws Exception;

	public void insertCartOrder(OrderVO orderVO) throws Exception;
}
