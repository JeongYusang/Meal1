package com.meal.member.service;

import java.util.HashMap;
import java.util.List;

import com.meal.member.vo.MemberVO;
import com.meal.member.vo.MileageVO;

public interface MemberService {

	public void addMember(MemberVO memberVO) throws Exception;

	public String overlapped(String id) throws Exception;

	public void updateMember(MemberVO memberVO) throws Exception;

	public void delMember(MemberVO memberVO) throws Exception;

	public MemberVO decode(String u_id) throws Exception;

	public void lastLog(String u_id) throws Exception;

	public MemberVO FindPW(HashMap<String,Object> map) throws Exception;

	public String FindId(HashMap<String , Object> map) throws Exception;
	
	public List<MileageVO> myMileageList(HashMap<String, Object> pagingMap)throws Exception;

	public List<MileageVO> myMileageMinus(HashMap<String, Object> pagingMap)throws Exception;
	
	public List<MileageVO> myMileagePlus(HashMap<String, Object> pagingMap)throws Exception;

	public MemberVO FindID2(HashMap<String, Object> map)throws Exception;

}