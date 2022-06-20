package com.meal.board.a.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.board.a.vo.BaVO;
import com.meal.board.a.vo.Img_aVO;

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

	@Override
	public List<BaVO> selectBAlist(HashMap<String, Object> pagingMap) throws DataAccessException {
		List<BaVO> selectBAlist = (List<BaVO>) sqlSession.selectList("mapper.boardA.selectBAlist", pagingMap);
		return selectBAlist;
	}

	@Override
	public List<Img_aVO> selectImgList(int b_a_id) throws DataAccessException {
		List<Img_aVO> list = (List<Img_aVO>) sqlSession.selectList("mapper.boardA.selectBAImg", b_a_id);
		return list;
	}

	@Override
	public BaVO selectBaDetail(int b_a_id) throws DataAccessException {
		BaVO baVO = (BaVO) sqlSession.selectOne("mapper.boardA.selectBaDetail", b_a_id);
		return baVO;
	}

	@Override
	public void deleteBA(BaVO boardAInfo) throws DataAccessException {
		sqlSession.delete("mapper.boardA.deleteBA", boardAInfo);
	}

}
