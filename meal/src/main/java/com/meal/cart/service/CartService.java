package com.meal.cart.service;

import java.util.List;

import com.meal.cart.vo.CartVO;

public interface CartService {
	public List<CartVO> myCartList(String u_id) throws Exception;
	public boolean findCartGoods(CartVO cartVO) throws Exception;
	public void addGoodsInCart(CartVO cartVO) throws Exception;
	public void removeCartGoods(int cart_id) throws Exception;
	public void plusCartGoods(int c_id)throws Exception;
	public void minusCartGoods(int c_id)throws Exception;
	public int CartQty(int c_id) throws Exception;
	public List<CartVO> myZzimList(String u_id)throws Exception;
	public CartVO selectCartInfo(int c_id) throws Exception;
		
}
