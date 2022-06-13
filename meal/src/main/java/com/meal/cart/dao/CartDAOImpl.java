package com.meal.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.cart.vo.CartVO;
import com.meal.goods.vo.GoodsVO;

@Repository("cartDAO")
public class CartDAOImpl  implements  CartDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CartVO> selectCartList(String u_id) throws DataAccessException {
		List<CartVO> cartList =(List)sqlSession.selectList("mapper.cart.selectCartList",u_id);
		return cartList;
	}
	@Override
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String  result =(String)sqlSession.selectOne("mapper.cart.selectCountInCart",cartVO);
		return Boolean.parseBoolean(result);
	}
	@Override
	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException{
		int cart_id=selectMaxCartId();
		cartVO.setC_id(cart_id);
		sqlSession.insert("mapper.cart.insertGoodsInCart",cartVO);
	}
	@Override
	public void updateCartGoodsQty(CartVO cartVO) throws DataAccessException{
		sqlSession.insert("mapper.cart.updateCartGoodsQty",cartVO);
	}
	@Override
	public void deleteCartGoods(int cart_id) throws DataAccessException{
		sqlSession.delete("mapper.cart.deleteCartGoods",cart_id);
	}
	@Override
	public int selectMaxCartId() throws DataAccessException{
		int cart_id =(Integer)sqlSession.selectOne("mapper.cart.selectMaxCartId");
		return cart_id;
	}

	@Override
	public void plusCartGoods(int c_id) throws DataAccessException {
		sqlSession.update("mapper.cart.plusCartGoods", c_id);
	}

	@Override
	public void minusCartGoods(int c_id) throws DataAccessException {
		sqlSession.update("mapper.cart.minusCartGoods", c_id);
	}

	@Override
	public int CartQty(int c_id) throws DataAccessException {
		int cart_qty = (Integer) sqlSession.selectOne("mapper.cart.CartQty", c_id);
		return cart_qty;
	}
	@Override
	public List<CartVO> selectZzimList(String u_id) throws DataAccessException {
		List<CartVO> cartList =(List)sqlSession.selectList("mapper.cart.selectZzimList",u_id);
		return cartList;
	}

	
	//6-13 c_id>cartVO추출구문
	@Override
	public CartVO selectCartInfo(int c_id) throws DataAccessException{
		CartVO cartInfo= (CartVO)sqlSession.selectOne("mapper.cart.cartInfo",c_id);
		return cartInfo;
		
	}
}
