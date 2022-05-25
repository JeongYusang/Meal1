package com.meal.admin.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.admin.vo.AdminVO;
import com.meal.member.vo.MemberVO;
import com.meal.seller.vo.SellerVO;

public interface AdminService {
	public AdminVO decode(String u_id) throws Exception;
	public void addAdmin(AdminVO adminVO) throws Exception;

	public List<MemberVO> selectAllMembers(HashMap<String, Object> pagingMap) throws Exception;
	public List<SellerVO> selectAllSellers(HashMap<String, Object> pagingMap) throws Exception;
	public void insertReason(HashMap<String, Object> map) throws Exception;
	public List<AdminVO> selectAllAdmins(HashMap<String,Object> pagingMap) throws Exception;
		
}
