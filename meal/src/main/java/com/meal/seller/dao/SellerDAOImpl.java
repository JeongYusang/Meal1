

package com.meal.seller.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.meal.seller.vo.Img_sVO;
import com.meal.seller.vo.SellerVO;

@Repository("sellerDAO")
public class SellerDAOImpl implements SellerDAO {


		@Autowired
		private SqlSession sqlSession;	
		
		@Override
		public SellerVO login(Map loginMap) throws DataAccessException{
			SellerVO member=(SellerVO)sqlSession.selectOne("mapper.seller.login",loginMap);
		   return member;
		}
		
		@Override
		public String insertNewSeller(HashMap<String, Object> newSellerMap) throws DataAccessException{
			sqlSession.insert("mapper.seller.insertNewSeller",newSellerMap);
			 String s_id =(String) newSellerMap.get("s_id");
			 return s_id;
		}

		@Override
		public String selectOverlappedID(String id) throws DataAccessException {
			String result =  (String)sqlSession.selectOne("mapper.seller.selectOverlappedID",id);
			return result;
		}
		
		@Override
		public void updateSeller(HashMap<String, Object> newSellerMap) throws DataAccessException{
		sqlSession.update("mapper.seller.updateSeller",newSellerMap);

		}
		
		@Override
		public void addSellerImg(HashMap<String, Object> map) throws DataAccessException{
			sqlSession.insert("mapper.seller.insertNewSellerImg",map);
			 
		}
		@Override
		public SellerVO decode(String s_id) throws DataAccessException{
			 SellerVO sellerVO= (SellerVO) sqlSession.selectOne("mapper.seller.decode",s_id);
			 return sellerVO;
		}

		@Override
		public void deleteSeller(SellerVO sellerVO) throws DataAccessException{
			sqlSession.delete("mapper.seller.deleteSeller", sellerVO);
			
		}
		@Override
		public List<Img_sVO> selectSellerImg(String s_id) throws DataAccessException{
			List<Img_sVO> listImg= (List<Img_sVO>) sqlSession.selectList("mapper.seller.selectSellerImg", s_id);
			return listImg;
		}

		@Override
		public void updateSellerImg(HashMap<String,Object> map) throws DataAccessException{
			sqlSession.update("mapper.seller.updateSellerImg", map);
			
		}
		@Override
		public void lastLog(String s_id) throws DataAccessException{
			sqlSession.update("mapper.seller.lastLog",s_id);
		}
		@Override
		public String FindId(HashMap<String,Object> map) throws DataAccessException{
			return (String) sqlSession.selectOne("mapper.seller.FindId",map);
		}

		@Override
		public SellerVO FindPW(HashMap<String,Object> map) throws DataAccessException{
			return (SellerVO)sqlSession.selectOne("mapper.seller.FindPW", map);
			
		}
}
