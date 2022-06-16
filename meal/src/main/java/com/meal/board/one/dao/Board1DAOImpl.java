package com.meal.board.one.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.board.one.vo.Board1VO;

@Repository("board1DAO")
public class Board1DAOImpl implements Board1DAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void board1Write(Board1VO board1VO) throws DataAccessException {
		sqlSession.insert("mapper.board1.board1Write", board1VO);
	}

	@Override
	public List<Board1VO> selectBoard1List(HashMap<String, Object> map) throws DataAccessException {
		List<Board1VO> boardInfo = (List<Board1VO>) sqlSession.selectList("mapper.board1.board1Page", map);
		return boardInfo;
	}

	@Override
	public Board1VO board1View(int b_1_id) throws DataAccessException {
		return (Board1VO) sqlSession.selectOne("mapper.board1.board1View", b_1_id);
	}

	@Override
	public List<Board1VO> selectBoard1allList() throws DataAccessException {
		List<Board1VO> boardInfo = (List<Board1VO>) sqlSession.selectList("mapper.board1.selectBoard1allList");
		return boardInfo;
	}

	@Override
	public List<Board1VO> board1ViewReview(int b_1_id) throws DataAccessException {
		return sqlSession.selectList("mapper.board1.board1ViewReview", b_1_id);
	}

	@Override
	public void board1Update(Board1VO board1VO) throws DataAccessException {
		sqlSession.update("mapper.board1.board1Update", board1VO);
	}
	@Override
	public void board1Delete1(int b_1_id) throws DataAccessException {
		sqlSession.delete("mapper.board1.board1Delete1", b_1_id);
	}
	@Override
	public void board1Delete2(int b_1_id) throws DataAccessException {
		sqlSession.delete("mapper.board1.board1Delete2", b_1_id);
	}

	@Override
	public List<Board1VO> selectMyBoard1List(HashMap<String, Object> map) throws DataAccessException {
		List<Board1VO> boardInfo = (List<Board1VO>) sqlSession.selectList("mapper.board1.boardMy1Page", map);
		return boardInfo;
	}

}
