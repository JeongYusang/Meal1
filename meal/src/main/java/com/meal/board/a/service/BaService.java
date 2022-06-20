package com.meal.board.a.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.meal.board.a.vo.BaVO;
import com.meal.board.a.vo.Img_aVO;

public interface BaService {

	public void boardAWrite(HashMap<String, Object> newboardAMap) throws Exception;

	public BaVO findb_a_id() throws Exception;

	public void addImg(HashMap<String, Object> item) throws Exception;

	public List<BaVO> selectBAlist(HashMap<String, Object> pagingMap) throws Exception;
	
	public List<Img_aVO> selectImgList(String b_a_id) throws Exception;
	
	public BaVO selectBaDetail(String b_a_id) throws Exception;

	public void updateBAImg(HashMap<String, Object> newImgList) throws Exception;

	public void deleteBA(BaVO boardAInfo) throws Exception;
}
