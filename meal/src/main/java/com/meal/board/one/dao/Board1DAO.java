package com.meal.board.one.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.meal.board.one.vo.Board1VO;

public interface Board1DAO {

	public void board1Write(Board1VO board1VO) throws DataAccessException;

	public List<Board1VO> selectBoard1List(HashMap<String, Object> map) throws DataAccessException;

	public List<Board1VO> selectBoard1allList() throws DataAccessException;

	public Board1VO board1View(int b_1_id) throws DataAccessException;

	public List<Board1VO> board1ViewReview(int b_1_id) throws DataAccessException;

	public void board1Update(Board1VO board1VO) throws DataAccessException;

	public void board1Delete1(int b_1_id) throws DataAccessException;

	public void board1Delete2(int b_1_id) throws DataAccessException;

	public List<Board1VO> selectMyBoard1List(HashMap<String, Object> map) throws DataAccessException;

	

}
