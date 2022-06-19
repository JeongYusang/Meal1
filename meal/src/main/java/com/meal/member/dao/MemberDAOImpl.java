package com.meal.member.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.member.vo.MemberVO;
import com.meal.member.vo.MileageVO;

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
	
	@Override
	public String FindId(HashMap<String , Object> map) throws DataAccessException{
		return  (String)sqlSession.selectOne("mapper.user.FindId",map);
	}

	@Override
	public MemberVO FindPW(HashMap<String,Object> map) throws DataAccessException{
		MemberVO memberVO = (MemberVO)sqlSession.selectOne("mapper.user.FindPW", map);
		return memberVO;
	}

	@Override
	public List<MileageVO> myMileageList(HashMap<String, Object> pagingMap) throws DataAccessException {
		List<MileageVO> boardInfo = (List<MileageVO>) sqlSession.selectList("mapper.user.myMileagePage", pagingMap);
		return boardInfo;
	}

	@Override
	public List<MileageVO> myMileageMinus(HashMap<String, Object> pagingMap) throws DataAccessException {
		List<MileageVO> boardInfo = (List<MileageVO>) sqlSession.selectList("mapper.user.myMileageMinus", pagingMap);
		return boardInfo;
	}

	@Override
	public List<MileageVO> myMileagePlus(HashMap<String, Object> pagingMap) throws DataAccessException {
		List<MileageVO> boardInfo = (List<MileageVO>) sqlSession.selectList("mapper.user.myMileagePlus", pagingMap);
		return boardInfo;
	}

	@Override
	public MemberVO FindID2(HashMap<String, Object> map) throws DataAccessException {
		MemberVO memberVO = (MemberVO)sqlSession.selectOne("mapper.user.FindID2", map);
		return memberVO;
	}
}

