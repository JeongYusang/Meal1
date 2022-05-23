package com.meal.order.dao;

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
		sqlSession.insert("mapper.order.insertOrder",_orderVO);
	}
}
