package com.meal.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.meal.admin.dao.AdminDAO;
import com.meal.member.dao.MemberDAO;
import com.meal.member.vo.MemberVO;
import com.meal.member.vo.MileageVO;
import com.meal.seller.dao.SellerDAO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private SellerDAO sellerDAO;
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public MemberVO decode(String u_id) throws Exception {
		MemberVO mem = (MemberVO) memberDAO.decode(u_id);
		return mem;
	}

	@Override
	public void addMember(MemberVO memberVO) throws Exception {
		memberDAO.insertNewMember(memberVO);
	}

	@Override
	public String overlapped(String id) throws Exception {
		String result = memberDAO.selectOverlappedID(id);

		if (result.equals("true") || result == "true") {
			return result;

		} else if (result != "true") {
			result = sellerDAO.selectOverlappedID(id);
			return result;
		} else {
			result = adminDAO.selectOverlappedId(id);
			return result;
		}
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		memberDAO.updateMember(memberVO);
	}

	@Override
	public void delMember(MemberVO memberVO) throws Exception {
		memberDAO.delMember(memberVO);
	}

	@Override
	public void lastLog(String u_id) throws Exception {
		memberDAO.lastLog(u_id);
	}

	@Override
	public String FindId(HashMap<String, Object> map) throws Exception {
		return (String) memberDAO.FindId(map);
	}

	@Override
	public MemberVO FindPW(HashMap<String, Object> map) throws Exception {
		return (MemberVO) memberDAO.FindPW(map);
	}

	@Override
	public List<MileageVO> myMileageList(HashMap<String, Object> pagingMap) throws Exception {
		List<MileageVO> listInfo = (List<MileageVO>) memberDAO.myMileageList(pagingMap);
		return listInfo;
	}

	@Override
	public List<MileageVO> myMileageMinus(HashMap<String, Object> pagingMap) throws Exception {
		List<MileageVO> listInfo = (List<MileageVO>) memberDAO.myMileageMinus(pagingMap);
		return listInfo;
	}

	@Override
	public List<MileageVO> myMileagePlus(HashMap<String, Object> pagingMap) throws Exception {
		List<MileageVO> listInfo = (List<MileageVO>) memberDAO.myMileagePlus(pagingMap);
		return listInfo;
	}

	@Override
	public MemberVO FindID2(HashMap<String, Object> map) throws Exception {
		return (MemberVO) memberDAO.FindID2(map);
	}

}
