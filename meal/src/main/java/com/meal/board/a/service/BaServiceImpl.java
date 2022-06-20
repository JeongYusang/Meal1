package com.meal.board.a.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meal.board.a.DAO.BaDAO;
import com.meal.board.a.vo.BaVO;
import com.meal.board.a.vo.Img_aVO;
import com.meal.board.gq.vo.BoardGqVO;
import com.meal.board.gq.vo.Img_gqVO;

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
	public List<BaVO> selectBAlist(HashMap<String, Object> pagingMap) throws Exception {
		List<BaVO> selectBAlist = (List<BaVO>) baDAO.selectBAlist(pagingMap);
		return selectBAlist;
	}

	@Override
	public List<Img_aVO> selectImgList(int b_a_id) throws Exception {
		List<Img_aVO> list = (List<Img_aVO>) baDAO.selectImgList(b_a_id);
		return list;
	}

	@Override
	public BaVO selectBaDetail(int b_a_id) throws Exception {
		BaVO baVO = (BaVO) baDAO.selectBaDetail(b_a_id);
		return baVO;
	}

	@Override
	public void deleteBA(BaVO boardAInfo) throws Exception {
		baDAO.deleteBA(boardAInfo);
	}

}
