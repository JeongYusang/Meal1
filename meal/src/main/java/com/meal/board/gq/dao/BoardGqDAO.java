package com.meal.board.gq.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.board.gq.vo.BoardGqVO;
import com.meal.board.gq.vo.Img_gqVO;

public interface BoardGqDAO {

	public void boardGqWrite(HashMap<String, Object> newboardGqMap) throws DataAccessException;

	public List<BoardGqVO> selectBoardGqList(HashMap<String, Object> map) throws DataAccessException;
	
	public List<Img_gqVO> selectBoardGqDetailImage(int b_gq_id) throws DataAccessException;

	public List<BoardGqVO> selectBoardGqallList() throws DataAccessException;
	
	public BoardGqVO selectBoardGqDetail(int b_gq_id) throws DataAccessException;

	public List<BoardGqVO> boardGqViewReview(int b_gq_id) throws DataAccessException;

	public void boardGqUpdate(BoardGqVO boardGqVO) throws DataAccessException;

	public void boardGqDelete1(int b_gq_id) throws DataAccessException;

	public void boardGqDelete2(int b_gq_id) throws DataAccessException;

	public void addImg(HashMap<String, Object> item)throws DataAccessException;

	public BoardGqVO findb_gq_id()throws DataAccessException;
	
	public List<BoardGqVO> selectMyBoardGqallList(String u_id)throws DataAccessException;

	public List<BoardGqVO> selectMyBoardGqList(HashMap<String, Object> Map)throws DataAccessException;

	public BoardGqVO gqdownload(int b_gq_id)throws DataAccessException;

	public List<BoardGqVO> selectSellerBoardGqallList(String s_id)throws DataAccessException;

	public List<BoardGqVO> selectSellerBoardGqList(HashMap<String, Object> map)throws DataAccessException;

}
