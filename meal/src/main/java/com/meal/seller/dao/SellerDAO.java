
package com.meal.seller.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.meal.seller.vo.Img_sVO;
import com.meal.seller.vo.SellerVO;

public interface SellerDAO {

	public SellerVO login(Map loginMap) throws DataAccessException;
	public String insertNewSeller(HashMap<String, Object> newSellerMap) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public void updateSeller(HashMap<String, Object> newSellerMap) throws DataAccessException;
	public void addSellerImg(HashMap<String, Object> newSellerMap) throws DataAccessException;
	public SellerVO decode(String s_id) throws DataAccessException;
	public void deleteSeller(SellerVO sellerVO) throws DataAccessException;
	public List<Img_sVO> selectSellerImg(String s_id) throws DataAccessException;
	public void updateSellerImg(HashMap<String,Object> map) throws DataAccessException;
	public void lastLog(String s_id) throws DataAccessException;
	public SellerVO FindPW(HashMap<String,Object> map) throws DataAccessException;		

	public String FindId(HashMap<String,Object> map) throws DataAccessException;
}
