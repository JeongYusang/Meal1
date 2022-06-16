package com.meal.board.one.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.meal.board.one.dao.Board1DAO;
import com.meal.board.one.vo.Board1VO;

@Service("board1Service")
@Transactional(propagation = Propagation.REQUIRED)
public class Board1ServiceImpl implements Board1Service {
	@Autowired
	private Board1DAO board1DAO;

	@Override
	public void board1Write(Board1VO board1VO) throws Exception {
		board1DAO.board1Write(board1VO);
	}

	@Override
	public List<Board1VO> selectBoard1List(HashMap<String, Object> map) throws Exception {
		List<Board1VO> listInfo = (List<Board1VO>) board1DAO.selectBoard1List(map);
		return listInfo;
	}

	@Override
	public Board1VO board1View(int b_1_id) throws Exception {
		return board1DAO.board1View(b_1_id);
	}

	@Override
	public List<Board1VO> selectBoard1allList() throws Exception {
		List<Board1VO> listInfo = (List<Board1VO>) board1DAO.selectBoard1allList();
		return listInfo;
	}

	@Override
	public List<Board1VO> board1ViewReview(int b_1_id) throws Exception {
		return (List<Board1VO>) board1DAO.board1ViewReview(b_1_id);
	}

	@Override
	public void board1Update(Board1VO board1VO) throws Exception {
		board1DAO.board1Update(board1VO);
	}

	@Override
	public void board1Delete(int b_1_id) throws Exception {
		board1DAO.board1Delete1(b_1_id);
		board1DAO.board1Delete2(b_1_id);
	}

	@Override
	public List<Board1VO> selectMyBoard1List(HashMap<String, Object> map) throws Exception {
		List<Board1VO> listInfo = (List<Board1VO>) board1DAO.selectMyBoard1List(map);
		return listInfo;
	}

}