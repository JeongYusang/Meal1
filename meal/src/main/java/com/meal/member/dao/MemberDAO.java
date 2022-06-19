package com.meal.member.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.member.vo.MemberVO;
import com.meal.member.vo.MileageVO;

public interface MemberDAO {

	public void insertNewMember(MemberVO memberVO) throws DataAccessException;

	public String selectOverlappedID(String id) throws DataAccessException;

	public MemberVO selectall(MemberVO memberVO) throws DataAccessException;

	public void delMember(MemberVO memberVO) throws DataAccessException;

	public void updateMember(MemberVO memberVO) throws DataAccessException;

	public MemberVO decode(String u_id) throws DataAccessException;

	public void lastLog(String u_id) throws DataAccessException;

	public MemberVO FindPW(HashMap<String, Object> map) throws DataAccessException;

	public String FindId(HashMap<String, Object> map) throws DataAccessException;

	public List<MileageVO> myMileageList(HashMap<String, Object> pagingMap) throws DataAccessException;

	public List<MileageVO> myMileageMinus(HashMap<String, Object> pagingMap) throws DataAccessException;

	public List<MileageVO> myMileagePlus(HashMap<String, Object> pagingMap) throws DataAccessException;

	public MemberVO FindID2(HashMap<String, Object> map) throws DataAccessException;


}