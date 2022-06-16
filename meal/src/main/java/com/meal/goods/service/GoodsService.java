package com.meal.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.RequestParam;

import com.meal.goods.vo.GoodsVO;
import com.meal.goods.vo.Img_gVO;

public interface GoodsService {
	public void addNewGoods(HashMap<String, Object> newGoodsMap) throws Exception;
	public void addGoodsImg(HashMap<String, Object> map) throws Exception;
	public GoodsVO findg_id (String g_name) throws Exception;
	public String goodsoverlapped(@RequestParam("g_name") String g_name) throws Exception;
	public List<Img_gVO> selectImgList(int g_id)throws Exception;
	public Map<String, List<GoodsVO>> selectAllGoods() throws Exception;
	public Img_gVO selectOneImg(HashMap<String, Object> map) throws Exception;
	public GoodsVO selectGoodsDetail(int g_id) throws Exception;
	public List<GoodsVO> selectGoodsPage(HashMap<String, Object> pgMap) throws Exception;
	public GoodsVO goodsG_Info(int g_id) throws Exception;
	public void updateGoods(HashMap<String, Object> newGoodsMap) throws Exception;
	public void updateGoodsImg(HashMap<String, Object> newi) throws Exception;
	public void deleteGoods(GoodsVO goodsInfo) throws Exception;
	public void goodsSaleEnd(int g_id) throws Exception;
	public void updateNomalGoods(GoodsVO newGoods) throws Exception;
	public List<GoodsVO> selectNew_Goods() throws Exception;
	public Img_gVO selectImgOne(int ig_id)throws Exception;
	public List<GoodsVO> GoodsCateList(String cate) throws Exception;
}
