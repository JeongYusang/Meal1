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

}
