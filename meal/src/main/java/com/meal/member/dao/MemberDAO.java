package com.meal.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.meal.member.vo.MemberVO;

public interface MemberDAO {
	
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public MemberVO selectall(MemberVO memberVO) throws DataAccessException;
	public void delMember(MemberVO memberVO) throws DataAccessException;
	public void updateMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO decode(String u_id) throws DataAccessException;
	public void lastLog(String u_id) throws DataAccessException;
}