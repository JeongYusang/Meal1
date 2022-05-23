package com.meal.goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;

import com.meal.goods.vo.GoodsVO;
import com.meal.goods.vo.Img_gVO;

public interface GoodsDAO {
	public void addNewGoods(HashMap<String,Object> newGoodsMap) throws DataAccessException;
	public void addGoodsImg(HashMap<String, Object> map) throws DataAccessException;
	public GoodsVO findg_id (String g_name) throws DataAccessException;
	public String selectOverlappedG_NAME(String g_name) throws DataAccessException;
	public List<Img_gVO> selectImgList(int g_id)throws DataAccessException;
	public List<GoodsVO> selectAllGoods(String cate) throws DataAccessException ;
	public Img_gVO selectOneImg(HashMap<String, Object> map) throws DataAccessException;
	public List<GoodsVO> selectNew_Goods() throws DataAccessException;
	public void updateNomalGoods(GoodsVO item) throws DataAccessException;
	public GoodsVO selectGoodsDetail(int g_id) throws DataAccessException;
}
