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

	public BoardGrVO grdownload(int b_gr_id);

	public List<BoardGrVO> selectSellerBoardGrallList(String s_id);

	public List<BoardGrVO> selectSellerBoardGrList(HashMap<String, Object> map);

}
