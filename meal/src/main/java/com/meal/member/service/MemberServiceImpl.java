package com.meal.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.meal.admin.dao.AdminDAO;
import com.meal.member.dao.MemberDAO;
import com.meal.member.vo.MemberVO;
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
	public MemberVO decode(String u_id) throws Exception{
		MemberVO mem =(MemberVO)memberDAO.decode(u_id);
		return mem;
	}

	@Override
	public void addMember(MemberVO memberVO) throws Exception {
		memberDAO.insertNewMember(memberVO);
	}

	@Override
	public String overlapped(String id) throws Exception {
		String result = memberDAO.selectOverlappedID(id);

		if (result.equals("true") || result =="true") {
			return result;


		} else if (result !="true") {
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

}
