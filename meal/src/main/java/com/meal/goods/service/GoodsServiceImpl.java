package com.meal.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.meal.goods.dao.GoodsDAO;
import com.meal.goods.vo.GoodsVO;
import com.meal.goods.vo.Img_gVO;

@Service("GoodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;

	@Override
	public void addNewGoods(HashMap<String, Object> newGoodsMap) throws Exception {
		goodsDAO.addNewGoods(newGoodsMap);

	}

	@Override
	public void addGoodsImg(HashMap<String, Object> map) throws Exception {
		goodsDAO.addGoodsImg(map);

	}

	@Override
	public GoodsVO findg_id(String g_name) throws Exception {
		return goodsDAO.findg_id(g_name);
	}

	@Override
	public String goodsoverlapped(String g_name) throws Exception {
		String result = goodsDAO.selectOverlappedG_NAME(g_name);
		return result;
	}

	@Override
	public List<Img_gVO> selectImgList(int g_id) throws Exception {
		List<Img_gVO> list = (List<Img_gVO>) goodsDAO.selectImgList(g_id);
		return list;
	}

	public Map<String, List<GoodsVO>> selectAllGoods() throws Exception {
		Map<String, List<GoodsVO>> goodsCateMap = new HashMap<String, List<GoodsVO>>();
		String cate1 = "NEW_GOODS";
		List<GoodsVO> NewG = (List<GoodsVO>) goodsDAO.selectAllGoods(cate1);
		goodsCateMap.put("NewG", NewG);
		cate1 = "Normal";
		List<GoodsVO> NomalG = (List<GoodsVO>) goodsDAO.selectAllGoods(cate1);
		goodsCateMap.put("NomalG", NomalG);
		cate1 = "Best";
		List<GoodsVO> bestG = (List<GoodsVO>) goodsDAO.selectAllGoods(cate1);
		goodsCateMap.put("bestG", bestG);

		return goodsCateMap;
	}

	public Img_gVO selectOneImg(HashMap<String, Object> map) throws Exception {
		Img_gVO vo = (Img_gVO) goodsDAO.selectOneImg(map);
		return vo;
	}

	public GoodsVO selectGoodsDetail(int g_id) throws Exception {
		GoodsVO goodsInfo = (GoodsVO) goodsDAO.selectGoodsDetail(g_id);
		return goodsInfo;
	}

	@Override
	public List<GoodsVO> selectGoodsPage(HashMap<String, Object> pgMap) throws Exception {
		List<GoodsVO> listInfo = (List<GoodsVO>) goodsDAO.selectGoodsPage(pgMap);
		return listInfo;
	}

	@Override
	public GoodsVO goodsG_Info(int g_id) throws Exception {
		return goodsDAO.goodsG_Info(g_id);
	}

	@Override
	public void updateGoods(HashMap<String, Object> newGoodsMap) throws Exception {
		goodsDAO.updateGoods(newGoodsMap);

	}

	@Override
	public void updateGoodsImg(HashMap<String, Object> newi) throws Exception {
		goodsDAO.updateGoodsImg(newi);
	}

	@Override
	public void deleteGoods(GoodsVO goodsInfo) throws Exception {
		goodsDAO.deleteGoods(goodsInfo);
	}

	@Override
	public void goodsSaleEnd(int g_id) throws Exception {
		goodsDAO.goodsSaleEnd(g_id);
	}

	@Override
	public void updateNomalGoods(GoodsVO newGoods) throws Exception {
		goodsDAO.updateNomalGoods(newGoods);
	}

	@Override
	public List<GoodsVO> selectNew_Goods() throws Exception {
		return (List<GoodsVO>) goodsDAO.selectNew_Goods();
	}

	@Override
	public Img_gVO selectImgOne(int ig_id) throws Exception {
		Img_gVO goodsImg = (Img_gVO) goodsDAO.selectImgOne(ig_id);
		return goodsImg;

	}

	@Override
	public List<GoodsVO> GoodsCateList(String cate) throws Exception {
		return (List<GoodsVO>) goodsDAO.GoodsCateList(cate);
	}

	// 스케줄러 인기상품변경 6-16 1 
	@Override
	public List<GoodsVO> selectBestGoodsN() throws Exception {
		return (List<GoodsVO>) goodsDAO.selectBestGoodsN();
	}

	// 스케줄러 인기상품변경 6-16 2
	@Override
	public void changeBestGoodsN(int g_id) throws Exception {
		goodsDAO.changeBestGoodsN(g_id);
	}
	
	// 6-16 3
	@Override
	public List<GoodsVO> selectAllBestGoods() throws Exception{
		return (List<GoodsVO>) goodsDAO.selectAllBestGoods();
	}
	//6-16 4
	@Override
	public void changeNomalGoods(int g_id) throws Exception{
		goodsDAO.changeNomalGoods(g_id);
	}
	//6-16 5
	@Override
	public void changeBestGoods(int g_id) throws Exception{
		goodsDAO.changeBestGoods(g_id);
	}

	//관리자의  등록상품 조회 0620
	@Override
	public List<GoodsVO> selectadminGPage(HashMap<String, Object> pgMap) throws Exception {
		List<GoodsVO> listInfo = (List<GoodsVO>) goodsDAO.selectadminGPage(pgMap);
		return listInfo;
	}
}
