package com.meal.board.a.service;

import java.util.HashMap;

import com.meal.board.a.vo.BaVO;

public interface BaService {

	public void boardAWrite(HashMap<String, Object> newboardAMap) throws Exception;

	public BaVO findb_a_id() throws Exception;

	public void addImg(HashMap<String, Object> item) throws Exception;

}
