package com.meal.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.meal.admin.dao.AdminDAO;
import com.meal.admin.vo.AdminVO;
import com.meal.goods.vo.GoodsVO;
import com.meal.member.vo.MemberVO;
import com.meal.order.vo.OrderVO;
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
	
	public List<AdminVO> selectAllAdmins(HashMap<String,Object> pagingMap) throws DataAccessException{
	List<AdminVO> adminList = (List<AdminVO>)adminDAO.selectAllAdmins(pagingMap);
	return adminList;
	}

	//판매자 상품배송 상태 변경을 위해 생성 0615
	@Override
	public void delivUpdate(Map<String, String> delivMap) throws Exception {
		adminDAO.delivUpdate(delivMap);
	}

	@Override
	public List<GoodsVO> GoodsList(HashMap<String, Object> pagingMap) throws Exception {
		List<GoodsVO> GoodsList = (List<GoodsVO>)adminDAO.GoodsList(pagingMap);
		return GoodsList;
	}

	@Override
	public List<OrderVO> CancledOrderList(HashMap<String, Object> pagingMap) throws Exception {
		List<OrderVO> CancledOrderList = (List<OrderVO>)adminDAO.CancledOrderList(pagingMap);
		return CancledOrderList;
	}

	@Override
	public List<OrderVO> OrderList(HashMap<String, Object> pagingMap) throws Exception {
		List<OrderVO> OrderList = (List<OrderVO>)adminDAO.OrderList(pagingMap);
		return OrderList;
	}	
}
