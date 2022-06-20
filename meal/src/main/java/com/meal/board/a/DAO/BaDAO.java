package com.meal.board.a.DAO;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.meal.board.a.vo.BaVO;
import com.meal.board.a.vo.Img_aVO;
import com.meal.goods.vo.Img_gVO;

public interface BaDAO {

	public void boardAWrite(HashMap<String, Object> newboardAMap) throws DataAccessException;

	public BaVO findb_a_id() throws DataAccessException;

	public void addImg(HashMap<String, Object> item) throws DataAccessException;

	public List<BaVO> selectBAlist(HashMap<String, Object> pagingMap) throws DataAccessException;
	
	public List<Img_aVO> selectImgList(int b_a_id) throws DataAccessException;
	
	public BaVO selectBaDetail(int b_a_id) throws DataAccessException;

	public void deleteBA(BaVO boardAInfo) throws DataAccessException;
}
