
package com.meal.seller.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.seller.vo.Img_sVO;
import com.meal.seller.vo.SellerVO;

public interface SellerService {

	public SellerVO decode(String s_id) throws Exception;

	public String addSeller(HashMap<String, Object> newSellerMap) throws Exception;

	public void updateSeller(HashMap<String, Object> newSellerMap) throws Exception;

	public void addSellerImg(HashMap<String, Object> map) throws Exception;

	public void deleteSeller(SellerVO sellerVO) throws Exception;

	public List<Img_sVO> selectSellerImg(String s_id) throws Exception;

	public void updateSellerImg(HashMap<String, Object> map) throws Exception;

	public void lastLog(String s_id) throws Exception;
	public SellerVO FindPW(HashMap<String,Object> map) throws Exception;

	public String FindId(HashMap<String,Object> map) throws Exception;
}
