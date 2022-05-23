package com.meal.board.gr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.meal.board.gr.vo.BoardGrVO;

public interface BoardGrService {

	/* public void boardGrWrite(BoardGrVO boardGrVO) throws Exception; */

	public List<BoardGrVO> selectBoardGrList(HashMap<String, Object> map) throws Exception;

	public Map boardGrView(int b_gr_id) throws Exception;

	public List<BoardGrVO> selectBoardGrallList() throws Exception;

	public List<BoardGrVO> boardGrViewReview(int b_gr_id) throws Exception;

	public void boardGrUpdate(BoardGrVO boardGrVO) throws Exception;

	public void boardGrDelete(int b_gr_id) throws Exception;

	public void boardGrWrite(HashMap<String, Object> newboardGrMap) throws Exception;

	public void addImg(HashMap<String, Object> item) throws Exception;

	public BoardGrVO findb_gr_id()throws Exception;
	
	public List<BoardGrVO> selectMyBoardGrallList(String u_id) throws Exception;

	public List<BoardGrVO> selectMyBoardGrList(HashMap<String, Object> Map) throws Exception;

	public BoardGrVO grdownload(int b_gr_id);

	public List<BoardGrVO> selectSellerBoardGrallList(String s_id);

	public List<BoardGrVO> selectSellerBoardGrList(HashMap<String, Object> pagingMap);

}
