package com.meal.goods.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.goods.vo.GoodsVO;
import com.meal.goods.vo.Img_gVO;

@Repository("goodsDAO")
public class GoodsDAOImpl implements GoodsDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void addNewGoods(HashMap<String,Object> newGoodsMap) throws DataAccessException{
		sqlSession.insert("mapper.goods.insertNewGoods",newGoodsMap);
		 
	}

	@Override
	public void addGoodsImg(HashMap<String, Object> map) throws DataAccessException{
		sqlSession.insert("mapper.goods.img_gInsert",map);
	}

	@Override
	public GoodsVO findg_id (String g_name) throws DataAccessException {
		GoodsVO gVO = (GoodsVO)sqlSession.selectOne("mapper.goods.findg_id", g_name);
		return gVO;
	}

	@Override
	public String selectOverlappedG_NAME(String g_name) throws DataAccessException {
		String result = (String)sqlSession.selectOne("mapper.goods.selectOverlappedG_NAME", g_name);
		return result;
	}
	
	@Override
	public List<Img_gVO> selectImgList(int g_id)throws DataAccessException{
		List<Img_gVO> list = (List<Img_gVO>)sqlSession.selectList("mapper.goods.selectGoodsImg", g_id);
		return list;
	}
	@Override
	public List<GoodsVO> selectAllGoods(String cate1) throws DataAccessException {
		List<GoodsVO> list = (List<GoodsVO>) sqlSession.selectList("mapper.goods.selectGoods",cate1);
		return list;
	}
	public Img_gVO selectOneImg(HashMap<String,Object> map) throws DataAccessException {
		Img_gVO vo = (Img_gVO) sqlSession.selectOne("mapper.goods.selectOneImg", map);
		return vo;
	}
	public List<GoodsVO> selectNew_Goods()throws DataAccessException{
		List<GoodsVO> list = sqlSession.selectList("mapper.goods.selectNew_Goods");
		return list;
	}
	public void updateNomalGoods(GoodsVO newGoods) throws DataAccessException{
		sqlSession.update("mapper.goods.updateNomalGoods", newGoods);
		
	}
	public GoodsVO selectGoodsDetail(int g_id) throws DataAccessException{
		GoodsVO goodsVO = (GoodsVO) sqlSession.selectOne("mapper.goods.selectGoodsDetail", g_id);
		return goodsVO;
	}

}
