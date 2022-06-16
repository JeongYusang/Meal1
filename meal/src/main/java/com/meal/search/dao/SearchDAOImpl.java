package com.meal.search.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.goods.vo.GoodsVO;

@Repository("searchDAO")
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsVO> SearchGoods(HashMap<String,Object> map) throws DataAccessException {

		List<GoodsVO> searchList = (List<GoodsVO>) sqlSession.selectList("mapper.goods.SearchGoods", map);
		return searchList;
	}

	@Override
	public List<GoodsVO> CateSearchGoods(HashMap<String, Object> map) throws DataAccessException {
		List<GoodsVO> searchList = (List<GoodsVO>) sqlSession.selectList("mapper.goods.CateSearchGoods", map);
		return searchList;
	}

}
