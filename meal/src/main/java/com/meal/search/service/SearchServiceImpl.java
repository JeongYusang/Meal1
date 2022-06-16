package com.meal.search.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meal.goods.vo.GoodsVO;
import com.meal.search.dao.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService{

	
	@Autowired
	private SearchDAO searchDAO;
	
	public List<GoodsVO> SearchGoods(HashMap<String,Object> map) throws Exception {
		
		return (List<GoodsVO>)searchDAO.SearchGoods(map);
		
	}

	@Override
	public List<GoodsVO> CateSearchGoods(HashMap<String, Object> map) throws Exception {
		return (List<GoodsVO>)searchDAO.CateSearchGoods(map);
	}
	
}
