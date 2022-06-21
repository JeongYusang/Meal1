package com.meal.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.meal.admin.vo.AdminVO;
import com.meal.goods.vo.GoodsVO;
import com.meal.member.vo.MemberVO;
import com.meal.order.vo.OrderVO;
import com.meal.seller.vo.SellerVO;

public interface AdminDAO{

	public AdminVO decode(String u_id) throws DataAccessException;
	public void addAdmin(AdminVO adminVO) throws DataAccessException;
	public List<MemberVO> selectAllMembers(HashMap<String, Object> pagingMap) throws DataAccessException;
	public List<SellerVO> selectAllSellers(HashMap<String, Object> pagingMap) throws DataAccessException;
	public void insertReason(HashMap<String, Object> map) throws DataAccessException;
	public String selectOverlappedId(String pw) throws DataAccessException;
	public List<AdminVO> selectAllAdmins(HashMap<String,Object> pagingMap) throws DataAccessException;
	
	//판매자 상품배송 상태 변경을 위해 생성 0615
	public void delivUpdate(Map<String, String> delivMap) throws DataAccessException;
	public List<GoodsVO> GoodsList(HashMap<String, Object> pagingMap) throws DataAccessException;
	public List<OrderVO> CancledOrderList(HashMap<String, Object> pagingMap) throws DataAccessException;
	public List<OrderVO> OrderList(HashMap<String, Object> pagingMap) throws DataAccessException;
			
}
