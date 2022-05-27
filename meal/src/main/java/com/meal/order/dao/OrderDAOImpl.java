package com.meal.order.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.order.vo.OrderVO;

@Repository("OrderDAO")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	public void insertOrder(OrderVO _orderVO) throws DataAccessException {
		sqlSession.insert("mapper.order.insertOrder", _orderVO);
	}

	@Override
	public List<OrderVO> selectUserOrders(String u_id) throws DataAccessException {
		List<OrderVO> listInfo = (List<OrderVO>) sqlSession.selectList("mapper.order.selectUserOrders", u_id);
		return listInfo;
	}

	@Override
	public List<OrderVO> UserboardOrderPage(HashMap<String, Object> map) throws DataAccessException {
		List<OrderVO> listInfo = (List<OrderVO>) sqlSession.selectList("mapper.order.UserboardOrderPage", map);
		return listInfo;
	}

	@Override
	public List<OrderVO> selectorderList(HashMap<String, String> OrderState) {
		List<OrderVO> orderList = (List<OrderVO>) sqlSession.selectList("mapper.order.selectOrderList", OrderState);
		return orderList;
	}

	@Override
	public String findU_id(int o_id) {
		return (String) sqlSession.selectOne("mapper.order.findU_id", o_id);
	}

	@Override
	public void deleteOrder(int o_id) {
		 sqlSession.delete("mapper.order.deleteOrder", o_id);
		
	}

	@Override
	public String overlappedO_id(int o_id) {
		return (String) sqlSession.selectOne("mapper.order.overlappedO_id", o_id);
	}
}
