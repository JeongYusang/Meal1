package com.meal.cart.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.cart.vo.CartVO;
import com.meal.goods.vo.GoodsVO;

public interface CartDAO {
	public List<CartVO> selectCartList(String u_id) throws DataAccessException;
	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException;
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException;
	public void updateCartGoodsQty(CartVO cartVO) throws DataAccessException;
	public void deleteCartGoods(int cart_id) throws DataAccessException;
	public void plusCartGoods(int c_id)throws DataAccessException;
	public void minusCartGoods(int c_id)throws DataAccessException;
	public int selectMaxCartId() throws DataAccessException;
	public int CartQty(int c_id) throws DataAccessException;
	public List<CartVO> selectZzimList(String u_id)throws DataAccessException;
	public CartVO selectCartInfo(int c_id) throws DataAccessException;
	
}
