package com.meal.search.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.goods.vo.GoodsVO;

public interface SearchDAO {
	
	public List<GoodsVO> SearchGoods(HashMap<String,Object> map) throws DataAccessException;

	public List<GoodsVO> CateSearchGoods(HashMap<String, Object> map) throws DataAccessException;
		

}
