
package com.meal.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.meal.cart.dao.CartDAO;
import com.meal.cart.vo.CartVO;

@Service("cartService")
@Transactional(propagation = Propagation.REQUIRED)
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;

	@Override
	public List<CartVO> myCartList(String u_id) throws Exception {
		List<CartVO> myCartList = cartDAO.selectCartList(u_id);

		return myCartList;
	}

	@Override
	public boolean findCartGoods(CartVO cartVO) throws Exception {
		return cartDAO.selectCountInCart(cartVO);

	}

	@Override
	public void addGoodsInCart(CartVO cartVO) throws Exception {
		cartDAO.insertGoodsInCart(cartVO);
	}

	@Override
	public void removeCartGoods(int cart_id) throws Exception {
		cartDAO.deleteCartGoods(cart_id);
	}

	@Override
	public void plusCartGoods(int c_id) throws Exception {
		cartDAO.plusCartGoods(c_id);

	}

	@Override
	public void minusCartGoods(int c_id) throws Exception {
		cartDAO.minusCartGoods(c_id);

	}

	@Override
	public int CartQty(int c_id) throws Exception {
		int cart_Qty = cartDAO.CartQty(c_id);
		return cart_Qty;
	}

	@Override
	public List<CartVO> myZzimList(String u_id) throws Exception {
		List<CartVO> myZzimList = cartDAO.selectZzimList(u_id);
		return myZzimList;
	}

	@Override
	public CartVO selectCartInfo(int c_id) throws Exception{
		CartVO cartInfo= (CartVO)cartDAO.selectCartInfo(c_id);
		return cartInfo;
		
	}
}
