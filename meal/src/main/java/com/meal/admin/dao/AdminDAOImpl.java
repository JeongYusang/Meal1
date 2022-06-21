package com.meal.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.admin.vo.AdminVO;
import com.meal.goods.vo.GoodsVO;
import com.meal.member.vo.MemberVO;
import com.meal.order.vo.OrderVO;
import com.meal.seller.vo.SellerVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {
		@Autowired
		private SqlSession sqlSession;

		@Override
		public AdminVO decode(String u_id) {
			return (AdminVO)sqlSession.selectOne("mapper.admin.decode",u_id);
		}

		@Override
		public void addAdmin(AdminVO adminVO) throws DataAccessException {
			sqlSession.insert("mapper.admin.insertNewAdmin",adminVO);
		}


		@Override
		public List<MemberVO> selectAllMembers(HashMap<String, Object> pagingMap) throws DataAccessException {
			List<MemberVO> memberInfo = (List<MemberVO>)sqlSession.selectList("mapper.adminM.userPage", pagingMap);
			return memberInfo;
		}
		@Override
		public List<SellerVO> selectAllSellers(HashMap<String, Object> pagingMap) throws DataAccessException {
			List<SellerVO> memberInfo = (List<SellerVO>)sqlSession.selectList("mapper.adminM.sellerPage", pagingMap);
			return memberInfo;
		}
		@Override
		public void insertReason(HashMap<String, Object> map) throws DataAccessException{
			sqlSession.insert("mapper.admin.insertReason",map); 
		}
		@Override
		public String selectOverlappedId(String pw) throws DataAccessException{
		    String result = (String)sqlSession.selectOne("mapper.admin.selectOverlappedId", pw);
		    return result;
		}
		@Override
		public List<AdminVO> selectAllAdmins(HashMap<String,Object> pagingMap) throws DataAccessException{
			List<AdminVO> adminList = (List<AdminVO>)sqlSession.selectList("mapper.admin.selectAllAdmin", pagingMap);
			return adminList;
		}

		//판매자 상품배송 상태 변경을 위해 생성 0615
		@Override
		public void delivUpdate(Map<String, String> delivMap) throws DataAccessException {
			sqlSession.update("mapper.order.delivUpdate", delivMap);
		}

		@Override
		public List<GoodsVO> GoodsList(HashMap<String, Object> pagingMap) throws DataAccessException {
			List<GoodsVO> GoodsList = (List<GoodsVO>)sqlSession.selectList("mapper.adminO.GoodsPage", pagingMap);
			return GoodsList;
		}

		@Override
		public List<OrderVO> CancledOrderList(HashMap<String, Object> pagingMap) throws DataAccessException {
			List<OrderVO> CancledOrderList = (List<OrderVO>)sqlSession.selectList("mapper.adminO.CanceledOrderPage", pagingMap);
			return CancledOrderList;
		}

		@Override
		public List<OrderVO> OrderList(HashMap<String, Object> pagingMap) throws DataAccessException {
			List<OrderVO> OrderList = (List<OrderVO>)sqlSession.selectList("mapper.adminO.OrderPage", pagingMap);
			return OrderList;
		}

}

