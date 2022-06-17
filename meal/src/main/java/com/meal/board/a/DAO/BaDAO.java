package com.meal.board.a.DAO;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.board.a.vo.BaVO;

public interface BaDAO {

	public void boardAWrite(HashMap<String, Object> newboardAMap) throws DataAccessException;

	public BaVO findb_a_id() throws DataAccessException;

	public void addImg(HashMap<String, Object> item) throws DataAccessException;

	public List<BaVO> BaAllList(HashMap<String, Object> map) throws DataAccessException;
}
