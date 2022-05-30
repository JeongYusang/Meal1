
package com.meal.seller.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.meal.seller.dao.SellerDAO;
import com.meal.seller.vo.Img_sVO;
import com.meal.seller.vo.SellerVO;

@Service("sellerService")
@Transactional(propagation = Propagation.REQUIRED)

public class SellerServiceImpl implements SellerService {
	@Autowired
	private SellerDAO SellerDAO;

	@Override
	public SellerVO decode(String s_id) throws Exception {
		return (SellerVO) SellerDAO.decode(s_id);
	}

	@Override
	public String addSeller(HashMap<String, Object> newSellerMap) throws Exception {
		return (String) SellerDAO.insertNewSeller(newSellerMap);
	}

	@Override
	public void updateSeller(HashMap<String, Object> newSellerMap) throws Exception {
		SellerDAO.updateSeller(newSellerMap);

	}

	@Override
	public void addSellerImg(HashMap<String, Object> map) throws Exception {
		SellerDAO.addSellerImg(map);
	}

	@Override
	public void deleteSeller(SellerVO sellerVO) throws Exception {
		// 셀러 정보 딜리트.
		SellerDAO.deleteSeller(sellerVO);
	}

	@Override
	public List<Img_sVO> selectSellerImg(String s_id) throws Exception {
		List<Img_sVO> listImg = SellerDAO.selectSellerImg(s_id);
		return listImg;
	}

	@Override
	public void updateSellerImg(HashMap<String, Object> map) throws Exception {
		SellerDAO.updateSellerImg(map);
	}

	@Override
	public void lastLog(String s_id) throws Exception {
		SellerDAO.lastLog(s_id);
	}

	@Override
	public String FindId(HashMap<String, Object> map) throws DataAccessException {
		return (String)SellerDAO.FindId(map);
	}

	@Override
	public SellerVO FindPW(HashMap<String, Object> map) throws Exception {

		return (SellerVO) SellerDAO.FindPW(map);
	}

}
