package com.meal.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.meal.board.gr.vo.BoardGrVO;
import com.meal.goods.vo.GoodsVO;
import com.meal.order.dao.OrderDAO;
import com.meal.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public int insertOrder(OrderVO _orderVO) throws Exception {
		int parentNo = orderDAO.insertOrder(_orderVO);
		return parentNo;

	}

	@Override
	public List<OrderVO> selectUserOrders(String u_id) throws Exception {
		List<OrderVO> listInfo = (List<OrderVO>) orderDAO.selectUserOrders(u_id);
		return listInfo;
	}

	@Override
	public List<OrderVO> UserboardOrderPage(HashMap<String, Object> Map) throws Exception {
		List<OrderVO> listInfo = (List<OrderVO>) orderDAO.UserboardOrderPage(Map);
		return listInfo;
	}

	@Override
	public Map<String, List<OrderVO>> orderlist(String u_id) throws Exception {
		HashMap<String, String> FindMap = new HashMap<String, String>();
		FindMap.put("u_id", u_id);
		FindMap.put("delivery_state", "배송완료");
		List<OrderVO> orderListDone = orderDAO.selectorderList(FindMap);
		// 상품 주문당 1 후기를 위한 후기글 중복 검사
		for (OrderVO item : orderListDone) {
			int o_id = item.getO_id();
			String review = orderDAO.overlappedO_id(o_id);
			item.setReview(review);
		}
		HashMap<String, String> FindMap2 = new HashMap<String, String>();
		FindMap2.put("u_id", u_id);
		FindMap2.put("delivery_state", "배송시작");
		List<OrderVO> orderListDstart = orderDAO.selectorderList(FindMap2);

		HashMap<String, String> FindMap3 = new HashMap<String, String>();
		FindMap3.put("u_id", u_id);
		FindMap3.put("delivery_state", "결제완료");
		List<OrderVO> orderListPaid = orderDAO.selectorderList(FindMap3);

		Map<String, List<OrderVO>> orderMap = new HashMap<String, List<OrderVO>>();
		orderMap.put("orderListDone", orderListDone);
		orderMap.put("orderListPaid", orderListPaid);
		orderMap.put("orderListDstart", orderListDstart);
		return orderMap;
	}

	@Override
	public void deleteOrder(int o_id) {
		orderDAO.deleteOrder(o_id);

	}

	@Override
	public String overlappedO_id(int o_id) {
		return orderDAO.overlappedO_id(o_id);
	}

	@Override
	public List<OrderVO> OrderResult(String parentNo) {
		return orderDAO.OrderResult(parentNo);
	}

	@Override
	public List<OrderVO> UserboardOrderListPage(HashMap<String, Object> pagingMap) throws Exception {
		List<OrderVO> listInfo = (List<OrderVO>) orderDAO.UserboardOrderListPage(pagingMap);
		return listInfo;
	}

	@Override
	public List<OrderVO> tabpageorderlist(HashMap<String, Object> infoMap) {
		List<OrderVO> listInfo = (List<OrderVO>) orderDAO.tabpageorderlist(infoMap);
		return listInfo;
	}

	@Override
	public String selectMaxParentNO(String u_id) throws Exception {
		return orderDAO.selectMaxParentNO(u_id);
	}

	// 판매자 마이페이지 내 오더리스트 불러오기위해 만듬 0614
	@Override
	public List<OrderVO> orderSellerList(String s_id) throws Exception {
		List<OrderVO> orderList = (List<OrderVO>) orderDAO.orderSellerList(s_id);
		return orderList;
	}

	// 카트 주문parentNo가져올예정
	@Override
	public int MaxOrderNum() throws Exception {
		return orderDAO.MaxOrderNum();

	}

	@Override
	public void insertCartOrder(OrderVO orderVO) throws Exception {
		orderDAO.insertCartOrder(orderVO);
	}

	// 6월 14일 취소된 주문 조회
	@Override
	public List<OrderVO> CanceledUserOrders(String u_id) throws Exception {
		List<OrderVO> listInfo = (List<OrderVO>) orderDAO.CanceledUserOrders(u_id);
		return listInfo;
	}

	// 6월 14일 취소된 주문 조회 페이징
	@Override
	public List<OrderVO> CanceledUserOrderPage(HashMap<String, Object> Map) throws Exception {
		List<OrderVO> listInfo = (List<OrderVO>) orderDAO.CanceledUserOrderPage(Map);
		return listInfo;
	}

	// 6월 14일o_id를 이용한 주문 조회
	@Override
	public OrderVO selectOrder(int o_id) {
		return orderDAO.selectOrder(o_id);
	}
}
