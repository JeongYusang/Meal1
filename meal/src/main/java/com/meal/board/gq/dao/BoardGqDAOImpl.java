package com.meal.board.gq.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.board.gq.vo.BoardGqVO;
import com.meal.board.gq.vo.Img_gqVO;

@Repository("boardGqDAO")
public class BoardGqDAOImpl implements BoardGqDAO {

	@Autowired
	private SqlSession sqlSession;

	/* 페이징 */
	@Override
	public List<BoardGqVO> selectBoardGqList(HashMap<String, Object> map) throws DataAccessException {
		
		List<BoardGqVO> boardInfo = (List<BoardGqVO>) sqlSession.selectList("mapper.boardGq.boardGqPage", map);
		return boardInfo;
	}
	
	@Override
	public List<BoardGqVO> selectMyBoardGqList(HashMap<String, Object> map) throws DataAccessException {
		List<BoardGqVO> boardInfo = (List<BoardGqVO>) sqlSession.selectList("mapper.boardGq.MyboardGqPage", map);
		return boardInfo;
	}
	@Override
	public List<BoardGqVO> selectSellerBoardGqList(HashMap<String, Object> map) {
		List<BoardGqVO> boardInfo = (List<BoardGqVO>) sqlSession.selectList("mapper.boardGq.SellerboardGqPage", map);
		return boardInfo;
	}
	
	@Override
	public List<BoardGqVO> selectGoodsBoardGqList(HashMap<String, Object> map) throws DataAccessException {
		List<BoardGqVO> boardInfo = (List<BoardGqVO>) sqlSession.selectList("mapper.boardGq.GoodsboardGqPage", map);
		return boardInfo;
	}


	/* 목록 조회 */
	@Override
	public List<BoardGqVO> selectBoardGqallList() throws DataAccessException {
		List<BoardGqVO> boardInfo = (List<BoardGqVO>) sqlSession.selectList("mapper.boardGq.selectBoardGqallList");
		return boardInfo;
	}
	
	@Override
	public List<BoardGqVO> selectMyBoardGqallList(String u_id) throws DataAccessException {
		List<BoardGqVO> boardInfo = (List<BoardGqVO>) sqlSession.selectList("mapper.boardGq.selectMyBoardGqallList",u_id);
		return boardInfo;
	}
	
	@Override
	public List<BoardGqVO> selectSellerBoardGqallList(String s_id) {
		List<BoardGqVO> boardInfo = (List<BoardGqVO>) sqlSession.selectList("mapper.boardGq.selectSellerBoardGqallList",s_id);
		return boardInfo;
	}
	
	@Override
	public List<BoardGqVO> selectGoodsBoardGqallList(int g_id) throws DataAccessException {
		List<BoardGqVO> boardInfo = (List<BoardGqVO>) sqlSession.selectList("mapper.boardGq.selectGoodsBoardGqallList",g_id);
		return boardInfo;
	}
	
	@Override
	public void boardGqWrite(HashMap<String, Object> newboardGqMap) throws DataAccessException {
		sqlSession.insert("mapper.boardGq.boardGqWrite",newboardGqMap);		
	}
	
	@Override
	public BoardGqVO selectBoardGqDetail(int b_gq_id) throws DataAccessException{
		BoardGqVO goodsVO=(BoardGqVO)sqlSession.selectOne("mapper.boardGq.selectBoardGqDetail",b_gq_id);
		return goodsVO;
	}
	
	@Override
	public List<Img_gqVO> selectBoardGqDetailImage(int b_gq_id) throws DataAccessException{
		List<Img_gqVO> imageList=(List<Img_gqVO>)sqlSession.selectList("mapper.boardGq.selectBoardGqDetailImage",b_gq_id);
		return imageList;
	}
	

	@Override
	public void addImg(HashMap<String, Object> item) throws DataAccessException {
		sqlSession.insert("mapper.boardGq.addImg",item);	
	}
	
	@Override
	public void boardGqUpdate(BoardGqVO boardGqVO) throws DataAccessException {
		sqlSession.update("mapper.boardGq.boardGqUpdate", boardGqVO);
	}

	@Override
	public void boardGqDelete1(int b_gq_id) throws DataAccessException {
		sqlSession.delete("mapper.boardGq.boardGqDelete1", b_gq_id);
	}

	@Override
	public void boardGqDelete2(int b_gq_id) throws DataAccessException {
		sqlSession.delete("mapper.boardGq.boardGqDelete2", b_gq_id);
	}
	
	/* 답글쓰기 */
	@Override
	public List<BoardGqVO> boardGqViewReview(int b_gq_id) throws DataAccessException {
		return sqlSession.selectList("mapper.boardGq.boardGqViewReview", b_gq_id);
	}
	
	@Override
	public BoardGqVO findb_gq_id() throws DataAccessException {
		return (BoardGqVO) sqlSession.selectOne("mapper.boardGq.findb_gq_id");
	}

	@Override
	public BoardGqVO gqdownload(int b_gq_id) {
		return (BoardGqVO) sqlSession.selectOne("mapper.boardGq.boardgq_download",b_gq_id);
	}

	//판매자 상품문의 내역 확인 0615
	@Override
	public List<BoardGqVO> boardGqSellerList(HashMap<String, Object> map) throws DataAccessException {
		List<BoardGqVO> boardGqList = (List<BoardGqVO>) sqlSession.selectList("mapper.boardGq.boardGqList", map);
		return boardGqList;
	}
	// 굿즈 디테일 상품 문의 답글 조회기능 0617
	@Override
	public List<BoardGqVO> SelectReview(int g_id) throws DataAccessException {
		List<BoardGqVO> SelectReview = (List<BoardGqVO>) sqlSession.selectList("mapper.boardGq.SelectReview", g_id);
		return SelectReview;
	}

	

}
