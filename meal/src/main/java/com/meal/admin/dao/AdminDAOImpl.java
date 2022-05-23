package com.meal.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.admin.vo.AdminVO;
import com.meal.member.vo.MemberVO;
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
}
