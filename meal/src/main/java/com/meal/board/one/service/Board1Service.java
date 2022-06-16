package com.meal.board.one.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.meal.board.one.vo.Board1VO;

public interface Board1Service{
	public void board1Write(Board1VO board1VO) throws Exception;
	public List<Board1VO> selectBoard1List(HashMap<String,Object> map) throws Exception;
	public List<Board1VO> selectBoard1allList () throws Exception;
	public Board1VO board1View(int b_1_id) throws Exception;
	public List<Board1VO> board1ViewReview(int b_1_id) throws Exception;
	public void board1Update(Board1VO board1VO) throws Exception;
	public void board1Delete(int b_1_id) throws Exception;
	public List<Board1VO> selectMyBoard1List(HashMap<String, Object> pagingMap)throws Exception;

}