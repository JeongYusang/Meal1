package com.meal.board.gq.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.meal.board.gq.vo.BoardGqVO;
import com.meal.board.gq.vo.Img_gqVO;

public interface BoardGqService {

	public List<BoardGqVO> selectBoardGqList(HashMap<String, Object> map) throws Exception;

	public Map boardGqView(int b_gq_id) throws Exception;

	public List<BoardGqVO> selectBoardGqallList() throws Exception;

	public List<BoardGqVO> boardGqViewReview(int b_gq_id) throws Exception;

	public void boardGqUpdate(BoardGqVO boardGqVO) throws Exception;

	public void boardGqDelete(int b_gq_id) throws Exception;

	public void boardGqWrite(HashMap<String, Object> newboardGqMap) throws Exception;

	public void addImg(HashMap<String, Object> item) throws Exception;

	public BoardGqVO findb_gq_id()throws Exception;
	
	public List<BoardGqVO> selectMyBoardGqallList(String u_id) throws Exception;

	public List<BoardGqVO> selectMyBoardGqList(HashMap<String, Object> Map) throws Exception;

	public BoardGqVO gqdownload(int b_gq_id)throws Exception;

	public List<BoardGqVO> selectSellerBoardGqallList(String s_id)throws Exception;

	public List<BoardGqVO> selectSellerBoardGqList(HashMap<String, Object> pagingMap)throws Exception;

	public List<BoardGqVO> selectGoodsBoardGqallList(int g_id)throws Exception;

	public List<BoardGqVO> selectGoodsBoardGqList(HashMap<String, Object> pagingMap)throws Exception;
	
	//판매자 상품문의 내역 확인 0615
	public List<BoardGqVO> boardGqSellerList(HashMap<String, Object> map) throws Exception;

	public List<BoardGqVO> SelectReview(int g_id) throws Exception;
	
	public List<Img_gqVO> imageList(int b_gq_id) throws Exception;

}
