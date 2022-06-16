package com.meal.board.a.DAO;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.board.a.vo.BaVO;

@Repository("baDAO")
public class BaDAOImpl implements BaDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void boardAWrite(HashMap<String, Object> newboardAMap) throws DataAccessException {
		sqlSession.insert("mapper.boardA.boardAWrite", newboardAMap);
	}

	@Override
	public BaVO findb_a_id() throws DataAccessException {
		return (BaVO) sqlSession.selectOne("mapper.boardA.findb_a_id");
	}

	@Override
	public void addImg(HashMap<String, Object> item) throws DataAccessException {
		sqlSession.insert("mapper.boardA.addImg", item);
	}

}
