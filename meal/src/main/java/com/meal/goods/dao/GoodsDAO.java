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
	public void addNewGoods(HashMap<String, Object> newGoodsMap) throws DataAccessException;

	public void addGoodsImg(HashMap<String, Object> map) throws DataAccessException;

	public GoodsVO findg_id(String g_name) throws DataAccessException;

	public String selectOverlappedG_NAME(String g_name) throws DataAccessException;

	public List<Img_gVO> selectImgList(int g_id) throws DataAccessException;

	public List<GoodsVO> selectAllGoods(String cate) throws DataAccessException;

	public Img_gVO selectOneImg(HashMap<String, Object> map) throws DataAccessException;

	public List<GoodsVO> selectNew_Goods() throws DataAccessException;

	public void updateNomalGoods(GoodsVO item) throws DataAccessException;

	public GoodsVO selectGoodsDetail(int g_id) throws DataAccessException;

	public List<GoodsVO> selectGoodsPage(HashMap<String, Object> pgMap) throws DataAccessException;

	public List<GoodsVO> searchGoodsSale() throws DataAccessException;

	public void goodsSaleBegin(GoodsVO goodsVO) throws DataAccessException;

	public List<GoodsVO> searchGoodsSaleE() throws DataAccessException;

	public void goodsSaleEnd(int g_id) throws DataAccessException;

	public GoodsVO goodsG_Info(int g_id) throws DataAccessException;

	public void updateGoodsImg(HashMap<String, Object> newi) throws DataAccessException;

	public void updateGoods(HashMap<String, Object> newGoodsMap) throws DataAccessException;

	public void deleteGoods(GoodsVO goodsInfo) throws DataAccessException;
	
	public Img_gVO selectImgOne(int ig_id) throws DataAccessException;

	public List<GoodsVO> GoodsCateList(String cate) throws DataAccessException;
	
	// 스케줄러 인기상품변경 6-16 1
	public List<GoodsVO> selectBestGoodsN() throws DataAccessException;
	// 스케줄러 인기상품변경 6-16 2
	public void changeBestGoodsN(int g_id) throws DataAccessException;
	// 6-16 3
	public List<GoodsVO> selectAllBestGoods() throws DataAccessException;
	//6-16 4
	public void changeNomalGoods(int g_id) throws DataAccessException; 
	//6-16 5
	public void changeBestGoods(int g_id) throws DataAccessException;

	//관리자의  등록상품 조회 0620
	public List<GoodsVO> selectadminGPage(HashMap<String, Object> pgMap) throws DataAccessException;
 }
