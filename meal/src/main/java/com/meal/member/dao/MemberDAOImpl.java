package com.meal.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.board.one.vo.Board1VO;
import com.meal.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl  implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;	
	
	
	@Override
	public MemberVO decode(String u_id) throws DataAccessException{
		return (MemberVO)sqlSession.selectOne("mapper.user.decode",u_id);
	}

	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.user.insertNewMember",memberVO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  (String)sqlSession.selectOne("mapper.user.selectOverlappedID",id);
		return result;
	}
	@Override
	public MemberVO selectall(MemberVO memberVO) throws DataAccessException {
		MemberVO member =(MemberVO)sqlSession.selectList("mapper.user.selectall",memberVO);
		return member;
	}
	@Override
	public void updateMember(MemberVO memberVO) throws DataAccessException{
	sqlSession.update("mapper.user.updateMember",memberVO);

	}

	@Override
	public void delMember(MemberVO memberVO) throws DataAccessException {
	sqlSession.delete("mapper.user.deleteMember",memberVO);
	}
	

	
	@Override
	public void lastLog(String u_id) throws DataAccessException {
		sqlSession.update("mapper.user.lastLog",u_id);
	}
	
}

