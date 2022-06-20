package com.meal.board.gr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.meal.board.gr.vo.BoardGrVO;
import com.meal.board.gr.vo.Img_grVO;

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

	public BoardGrVO grdownload(int b_gr_id)throws Exception;

	public List<BoardGrVO> selectSellerBoardGrallList(String s_id)throws Exception;

	public List<BoardGrVO> selectSellerBoardGrList(HashMap<String, Object> pagingMap)throws Exception;

	public List<BoardGrVO> selectGoodsBoardGrList(HashMap<String, Object> pagingMap)throws Exception;

	public List<BoardGrVO> selectGoodsBoardGrallList(int g_id)throws Exception;

	//상품후기 내역 조회를 위해 사용 0616
	public List<BoardGrVO> selectBoardGrSList(HashMap<String, Object> map) throws Exception;

	public List<BoardGrVO> SelectReview(int g_id) throws Exception;

	public int selectGoodAvg(int g_id) throws Exception;
	
	public List<Img_grVO> imageList(int b_gr_id) throws Exception;

	public BoardGrVO o_idSearch(int o_id) throws Exception;
	
}
