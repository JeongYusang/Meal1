package com.meal.board.gq.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.meal.board.gq.vo.BoardGqVO;

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

	public BoardGqVO gqdownload(int b_gq_id);

	public List<BoardGqVO> selectSellerBoardGqallList(String s_id);

	public List<BoardGqVO> selectSellerBoardGqList(HashMap<String, Object> pagingMap);

}