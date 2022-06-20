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
	
	@Override
	public int insertOrder(OrderVO _orderVO) throws DataAccessException {
		sqlSession.insert("mapper.order.insertOrder", _orderVO);
		return _orderVO.getParentNo();
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
	public List<OrderVO> selectorderList(HashMap<String, Object> map) {
		List<OrderVO> orderList = (List<OrderVO>) sqlSession.selectList("mapper.order.UserboardOrderListPage", map);
		return orderList;
	}

	@Override
	public void deleteOrder(int o_id) throws DataAccessException {
		 sqlSession.update("mapper.order.deleteOrder", o_id);
	}

	@Override
	public String overlappedO_id(int o_id) throws DataAccessException {
		return (String) sqlSession.selectOne("mapper.order.overlappedO_id", o_id);
	}

	@Override
	public List<OrderVO> OrderResult(String parentNo) throws DataAccessException {
		List<OrderVO> orderList = (List<OrderVO>) sqlSession.selectList("mapper.order.OrderResult", parentNo);
		return orderList;
	}

	@Override
	public List<OrderVO> UserboardOrderListPage(HashMap<String, Object> pagingMap) throws DataAccessException {
		List<OrderVO> listInfo = (List<OrderVO>) sqlSession.selectList("mapper.order.UserboardOrderListPage", pagingMap);
		return listInfo;
	}

	@Override
	public String selectMaxParentNO(String u_id) throws DataAccessException {
		return (String) sqlSession.selectOne("mapper.order.MaxParentNo", u_id);
		
	}
	
	//판매자 주문내역 확인위해 사용 0614
	@Override
	public List<OrderVO> orderSellerList(HashMap<String, Object> pgMap) throws DataAccessException {
		List<OrderVO> orderList = (List<OrderVO>) sqlSession.selectList("mapper.order.orderSellerList", pgMap);
		return orderList;
	}
	//카트부분 6.14
	@Override
	public int MaxOrderNum() throws DataAccessException{
		return (Integer) sqlSession.selectOne("mapper.order.MaxOrderNum");		
	}
	@Override
	public void insertCartOrder(OrderVO orderVO) throws DataAccessException{
		sqlSession.insert("mapper.order.insertCartOrder",orderVO);
	}

	@Override
	public OrderVO selectOrder(int o_id) throws DataAccessException {
		return (OrderVO) sqlSession.selectOne("mapper.order.selectOrder", o_id);
	}

	@Override
	public List<OrderVO> CanceledUserOrderPage(HashMap<String, Object> map) throws DataAccessException {
		List<OrderVO> listInfo = (List<OrderVO>) sqlSession.selectList("mapper.order.CanceledUserOrderPage", map);
		return listInfo;
	}

	@Override
	public List<OrderVO> CanceledUserOrders(String u_id) throws DataAccessException {
		List<OrderVO> listInfo = (List<OrderVO>) sqlSession.selectList("mapper.order.CanceledUserOrders", u_id);
		return listInfo;
	}
	// 인기상품 스케줄러를 위한 검색
	public List<OrderVO> BestGoodsCount() throws DataAccessException{
		List<OrderVO> bestGoodsbyOrder = (List<OrderVO>)sqlSession.selectList("mapper.order.BestGoodsCount");
		return bestGoodsbyOrder;
	}

	@Override
	public List<OrderVO> orderCanceledSellerList(HashMap<String, Object> map) throws DataAccessException {
		List<OrderVO> orderCanceledSellerList = (List<OrderVO>)sqlSession.selectList("mapper.order.orderCanceledSellerList",map);
		return orderCanceledSellerList;
	}
}
