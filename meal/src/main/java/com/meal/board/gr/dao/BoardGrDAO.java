package com.meal.board.gr.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.board.gr.vo.BoardGrVO;
import com.meal.board.gr.vo.Img_grVO;

public interface BoardGrDAO {

	public void boardGrWrite(HashMap<String, Object> newboardGrMap) throws DataAccessException;

	public List<BoardGrVO> selectBoardGrList(HashMap<String, Object> map) throws DataAccessException;
	
	public List<Img_grVO> selectBoardGrDetailImage(int b_gr_id) throws DataAccessException;

	public List<BoardGrVO> selectBoardGrallList() throws DataAccessException;
	
	public BoardGrVO selectBoardGrDetail(int b_gr_id) throws DataAccessException;

	public List<BoardGrVO> boardGrViewReview(int b_gr_id) throws DataAccessException;

	public void boardGrUpdate(BoardGrVO boardGrVO) throws DataAccessException;

	public void boardGrDelete1(int b_gr_id) throws DataAccessException;

	public void boardGrDelete2(int b_gr_id) throws DataAccessException;

	public void addImg(HashMap<String, Object> item)throws DataAccessException;

	public BoardGrVO findb_gr_id()throws DataAccessException;
	
	public List<BoardGrVO> selectMyBoardGrallList(String u_id)throws DataAccessException;

	public List<BoardGrVO> selectMyBoardGrList(HashMap<String, Object> Map)throws DataAccessException;

	public BoardGrVO grdownload(int b_gr_id)throws DataAccessException;

	public List<BoardGrVO> selectSellerBoardGrallList(String s_id)throws DataAccessException;

	public List<BoardGrVO> selectSellerBoardGrList(HashMap<String, Object> map)throws DataAccessException;

	public List<BoardGrVO> selectGoodsBoardGrList(HashMap<String, Object> pagingMap)throws DataAccessException;

	public List<BoardGrVO> selectGoodsBoardGrallList(int g_id)throws DataAccessException;

	//판매자 페이지 상품후기 내역 조회를 위해 사용 0616
	public List<BoardGrVO> selectBoardGrSList(HashMap<String, Object> map) throws DataAccessException;
	
	public List<BoardGrVO> SelectReview(int g_id) throws DataAccessException;

	public int selectGoodAvg(int g_id) throws DataAccessException;

	public BoardGrVO o_idSearch(int o_id) throws DataAccessException;

}
