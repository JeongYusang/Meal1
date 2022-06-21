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
	public void addNewGoods(HashMap<String, Object> newGoodsMap) throws DataAccessException {
		sqlSession.insert("mapper.goods.insertNewGoods", newGoodsMap);

	}

	@Override
	public void addGoodsImg(HashMap<String, Object> map) throws DataAccessException {
		sqlSession.insert("mapper.goods.img_gInsert", map);
	}

	@Override
	public GoodsVO findg_id(String g_name) throws DataAccessException {
		GoodsVO gVO = (GoodsVO) sqlSession.selectOne("mapper.goods.findg_id", g_name);
		return gVO;
	}

	@Override
	public String selectOverlappedG_NAME(String g_name) throws DataAccessException {
		String result = (String) sqlSession.selectOne("mapper.goods.selectOverlappedG_NAME", g_name);
		return result;
	}

	@Override
	public List<Img_gVO> selectImgList(int g_id) throws DataAccessException {
		List<Img_gVO> list = (List<Img_gVO>) sqlSession.selectList("mapper.goods.selectGoodsImg", g_id);
		return list;
	}

	@Override
	public List<GoodsVO> selectAllGoods(String cate1) throws DataAccessException {
		List<GoodsVO> list = (List<GoodsVO>) sqlSession.selectList("mapper.goods.selectGoods", cate1);
		return list;
	}

	public Img_gVO selectOneImg(HashMap<String, Object> map) throws DataAccessException {
		Img_gVO vo = (Img_gVO) sqlSession.selectOne("mapper.goods.selectOneImg", map);
		return vo;
	}

	public List<GoodsVO> selectNew_Goods() throws DataAccessException {
		List<GoodsVO> list = sqlSession.selectList("mapper.goods.selectNew_Goods");
		return list;
	}

	public void updateNomalGoods(GoodsVO newGoods) throws DataAccessException {
		sqlSession.update("mapper.goods.updateNomalGoods", newGoods);

	}

	public GoodsVO selectGoodsDetail(int g_id) throws DataAccessException {
		GoodsVO goodsVO = (GoodsVO) sqlSession.selectOne("mapper.goods.selectGoodsDetail", g_id);
		return goodsVO;
	}

	@Override
	public List<GoodsVO> selectGoodsPage(HashMap<String, Object> pgMap) throws DataAccessException {
		List<GoodsVO> GoodsInfo = (List<GoodsVO>) sqlSession.selectList("mapper.goods.goodsPage", pgMap);
		return GoodsInfo;
	}

	@Override
	public List<GoodsVO> searchGoodsSale() throws DataAccessException {
		List<GoodsVO> goodsInfo = (List<GoodsVO>) sqlSession.selectList("mapper.goods.searchGoodsSale");
		return goodsInfo;
	}

	@Override
	public void goodsSaleBegin(GoodsVO goodsVO) throws DataAccessException {
		sqlSession.update("mapper.goods.goodsSaleBegin", goodsVO);
	}

	@Override
	public List<GoodsVO> searchGoodsSaleE() throws DataAccessException {
		List<GoodsVO> goodsInfo = (List<GoodsVO>) sqlSession.selectList("mapper.goods.searchGoodsSaleE");
		return goodsInfo;
	}

	public void goodsSaleEnd(int g_id) throws DataAccessException {
		sqlSession.update("mapper.goods.goodsSaleEnd", g_id);
	}

	@Override
	public GoodsVO goodsG_Info(int g_id) throws DataAccessException {
		GoodsVO goodsVO = (GoodsVO) sqlSession.selectOne("mapper.goods.selectGoodsDetail", g_id);
		return goodsVO;
	}

	@Override
	public void updateGoods(HashMap<String, Object> newGoodsMap) throws DataAccessException {
		sqlSession.update("mapper.goods.updateGoods", newGoodsMap);
	}

	@Override
	public void updateGoodsImg(HashMap<String, Object> newi) throws DataAccessException {
		sqlSession.update("mapper.goods.updateGoodsImg", newi);
	}

	@Override
	public void deleteGoods(GoodsVO goodsInfo) throws DataAccessException {
		sqlSession.delete("mapper.goods.deleteGoods", goodsInfo);
	}

	@Override
	public Img_gVO selectImgOne(int ig_id) throws DataAccessException {
		Img_gVO goodsImg = (Img_gVO) sqlSession.selectOne("mapper.goods.selectGoodsImg1", ig_id);
		return goodsImg;
	}

	@Override
	public List<GoodsVO> GoodsCateList(String cate) throws DataAccessException {
		List<GoodsVO> goodsInfo = (List<GoodsVO>) sqlSession.selectList("mapper.goods.GoodsCateList", cate);
		return goodsInfo;
	}

	// 6-16 BestGoods scheduler -1
	@Override
	public List<GoodsVO> selectBestGoodsN() throws DataAccessException {
		List<GoodsVO> goodsInfo = (List<GoodsVO>) sqlSession.selectList("mapper.goods.selectBestGoodsN");
		return goodsInfo;
	}
	// 6 - 16 2
	@Override
	public void changeBestGoodsN(int g_id) throws DataAccessException {
		sqlSession.update("mapper.goods.changeBestGoodsN", g_id);
	}
	//6-16 3
	@Override
	public List<GoodsVO> selectAllBestGoods() throws DataAccessException {
		List<GoodsVO> goodsInfo = (List<GoodsVO>) sqlSession.selectList("mapper.goods.selectAllBestGoods");
		return goodsInfo;
	}
	//6-16 4
	@Override
	public void changeNomalGoods(int g_id) throws DataAccessException {
		sqlSession.update("mapper.goods.changeNomalGoods",g_id);
	}
	
	//6-16 5
	@Override
	public void changeBestGoods(int g_id) throws DataAccessException {
		sqlSession.update("mapper.goods.changeBestGoods",g_id); 
	}
	
	//관리자의  등록상품 조회 0620
		public List<GoodsVO> selectadminGPage(HashMap<String, Object> pgMap) throws DataAccessException {
			List<GoodsVO> GoodsInfo = (List<GoodsVO>) sqlSession.selectList("mapper.goods.adminGPage", pgMap);
			return GoodsInfo;
		}

}
