package com.meal.board.a.service;

import java.util.HashMap;
import java.util.List;

import com.meal.board.a.vo.BaVO;
import com.meal.board.a.vo.Img_aVO;

public interface BaService {

	public void boardAWrite(HashMap<String, Object> newboardAMap) throws Exception;

	public BaVO findb_a_id() throws Exception;

	public void addImg(HashMap<String, Object> item) throws Exception;

	public List<BaVO> BaAllList(HashMap<String, Object> map) throws Exception;
	
	public List<Img_aVO> selectImgList(int b_a_id) throws Exception;
	
	public BaVO selectBaDetail(int b_a_id) throws Exception;

}
