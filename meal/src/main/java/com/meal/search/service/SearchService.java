package com.meal.search.service;

import java.util.HashMap;
import java.util.List;

import com.meal.goods.vo.GoodsVO;

public interface SearchService {
	public List<GoodsVO> SearchGoods(HashMap<String,Object> map) throws Exception ;

	public List<GoodsVO> CateSearchGoods(HashMap<String, Object> pagingMap) throws Exception ;
}
