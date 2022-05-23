package com.meal.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.admin.vo.AdminVO;
import com.meal.member.vo.MemberVO;
import com.meal.seller.vo.SellerVO;

public interface AdminDAO{

	public AdminVO decode(String u_id) throws DataAccessException;
	public void addAdmin(AdminVO adminVO) throws DataAccessException;
	public List<MemberVO> selectAllMembers(HashMap<String, Object> pagingMap) throws DataAccessException;
	public List<SellerVO> selectAllSellers(HashMap<String, Object> pagingMap) throws DataAccessException;
	public void insertReason(HashMap<String, Object> map) throws DataAccessException;
	public String selectOverlappedId(String pw) throws DataAccessException;
		
}
