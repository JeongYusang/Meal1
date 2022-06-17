package com.meal.board.gq.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.board.gq.vo.BoardGqVO;
import com.meal.board.gq.vo.Img_gqVO;

public interface BoardGqDAO {

	/* 페이징 */
	
	public List<BoardGqVO> selectBoardGqList(HashMap<String, Object> map) throws DataAccessException;
	
	public List<BoardGqVO> selectSellerBoardGqList(HashMap<String, Object> map)throws DataAccessException;

	public List<BoardGqVO> selectGoodsBoardGqList(HashMap<String, Object> map)throws DataAccessException;

	public List<BoardGqVO> selectMyBoardGqList(HashMap<String, Object> Map)throws DataAccessException;
	
	/* 리스트 조회 */
	
	public List<BoardGqVO> selectBoardGqallList() throws DataAccessException;

	public List<BoardGqVO> selectMyBoardGqallList(String u_id)throws DataAccessException;

	public List<BoardGqVO> selectGoodsBoardGqallList(int g_id)throws DataAccessException;
	
	public List<BoardGqVO> selectSellerBoardGqallList(String s_id) throws DataAccessException;
	
	public List<Img_gqVO> selectBoardGqDetailImage(int b_gq_id) throws DataAccessException;

	/* 게시글 쓰기/ 상세 / 답글쓰기 / 수정 / 삭제 1,2 / 이미지추가 */
	
	public void boardGqWrite(HashMap<String, Object> newboardGqMap) throws DataAccessException;
	
	public BoardGqVO selectBoardGqDetail(int b_gq_id) throws DataAccessException;

	public List<BoardGqVO> boardGqViewReview(int b_gq_id) throws DataAccessException;

	public void boardGqUpdate(BoardGqVO boardGqVO) throws DataAccessException;

	public void boardGqDelete1(int b_gq_id) throws DataAccessException;

	public void boardGqDelete2(int b_gq_id) throws DataAccessException;

	public void addImg(HashMap<String, Object> item)throws DataAccessException;

	public BoardGqVO findb_gq_id()throws DataAccessException;
	
	

	public BoardGqVO gqdownload(int b_gq_id)throws DataAccessException;

	//판매자 상품문의 내역 확인 0615
	public List<BoardGqVO> boardGqSellerList(HashMap<String, Object> map) throws DataAccessException;

	public List<BoardGqVO> SelectReview(int g_id)throws DataAccessException;

	

	
	
	

	

}
