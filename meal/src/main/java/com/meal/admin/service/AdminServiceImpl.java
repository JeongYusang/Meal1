package com.meal.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meal.admin.dao.AdminDAO;
import com.meal.admin.vo.AdminVO;
import com.meal.member.vo.MemberVO;
import com.meal.seller.vo.SellerVO;


@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public AdminVO decode(String u_id) throws Exception {
		AdminVO mem =(AdminVO)adminDAO.decode(u_id);
		return mem;
	}

	@Override
	public void addAdmin(AdminVO adminVO) throws Exception {
		adminDAO.addAdmin(adminVO);
	}


	@Override
	public List<MemberVO> selectAllMembers(HashMap<String, Object> pagingMap) throws Exception {
		 List<MemberVO> listInfo = (List<MemberVO>) adminDAO.selectAllMembers(pagingMap);
		 return listInfo;
	}
	@Override
	public List<SellerVO> selectAllSellers(HashMap<String, Object> pagingMap) throws Exception {
		 List<SellerVO> listInfo = (List<SellerVO>) adminDAO.selectAllSellers(pagingMap);
		 return listInfo;
	}
	@Override
	public void insertReason(HashMap<String, Object> map) throws Exception{
	adminDAO.insertReason(map);
	}
	
}
