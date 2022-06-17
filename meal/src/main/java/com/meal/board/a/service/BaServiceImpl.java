package com.meal.board.a.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meal.board.a.DAO.BaDAO;
import com.meal.board.a.vo.BaVO;

@Service("baService")
public class BaServiceImpl implements BaService {

	@Autowired
	private BaDAO baDAO;
	
	@Override
	public void boardAWrite(HashMap<String, Object> newboardAMap) throws Exception {
		baDAO.boardAWrite(newboardAMap);
	}

	@Override
	public BaVO findb_a_id() throws Exception {
		return baDAO.findb_a_id();
	}

	@Override
	public void addImg(HashMap<String, Object> item) throws Exception {
		baDAO.addImg(item);
	}
	
	@Override
	public List<BaVO> BaAllList(HashMap<String, Object> map) throws Exception {
		List<BaVO> BaAllList = (List<BaVO>) baDAO.BaAllList(map);
		return BaAllList;
	}

}
