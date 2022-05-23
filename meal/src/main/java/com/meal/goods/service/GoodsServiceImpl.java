package com.meal.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.meal.goods.dao.GoodsDAO;
import com.meal.goods.vo.GoodsVO;
import com.meal.goods.vo.Img_gVO;
import com.meal.seller.vo.SellerVO;

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
	public GoodsVO findg_id (String g_name) throws Exception{
		return goodsDAO.findg_id(g_name);
	}

	@Override
	public String goodsoverlapped(String g_name) throws Exception {
		String result = goodsDAO.selectOverlappedG_NAME(g_name);
		return result;
	}
	@Override
	public List<Img_gVO> selectImgList(int g_id)throws Exception{
		List<Img_gVO> list = (List<Img_gVO>)goodsDAO.selectImgList(g_id);
		return list;
	}
	public Map<String, List<GoodsVO>> selectAllGoods() throws Exception{
		Map <String, List<GoodsVO>> goodsCateMap = new HashMap<String, List<GoodsVO>>();
		String cate1 = "NEW_GOODS";
		List<GoodsVO> NewG = (List<GoodsVO>) goodsDAO.selectAllGoods(cate1);
		goodsCateMap.put("NewG", NewG);
		cate1 = "Nomal";
		List<GoodsVO> NomalG = (List<GoodsVO>) goodsDAO.selectAllGoods(cate1);
		goodsCateMap.put("NomalG", NomalG);
		cate1 = "Best";
		List<GoodsVO> bestG = (List<GoodsVO>) goodsDAO.selectAllGoods(cate1);
		goodsCateMap.put("bestG", bestG);
		
		
		
		return goodsCateMap;
	}
	public Img_gVO selectOneImg(HashMap<String,Object> map) throws Exception{
		Img_gVO vo = (Img_gVO)goodsDAO.selectOneImg(map);
		return vo;
	}
	
	
	public GoodsVO selectGoodsDetail(int g_id) throws Exception{
		GoodsVO goodsInfo = (GoodsVO)goodsDAO.selectGoodsDetail(g_id);
		return goodsInfo;
	}
}
