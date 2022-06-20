package com.meal.board.gr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.meal.board.gr.dao.BoardGrDAO;
import com.meal.board.gr.vo.BoardGrVO;
import com.meal.board.gr.vo.Img_grVO;

@Service("boardGrService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardGrServiceImpl implements BoardGrService {

	@Autowired
	private BoardGrDAO boardGrDAO;

	/* 페이징 */
	/* 전체 */
	public List<BoardGrVO> selectBoardGrList(HashMap<String, Object> map) throws Exception {
		List<BoardGrVO> listInfo = (List<BoardGrVO>) boardGrDAO.selectBoardGrList(map);
		return listInfo;
	}

	/* 회원 */
	@Override
	public List<BoardGrVO> selectMyBoardGrList(HashMap<String, Object> Map) throws Exception {
		List<BoardGrVO> listInfo = (List<BoardGrVO>) boardGrDAO.selectMyBoardGrList(Map);
		return listInfo;
	}

	/* 판매자 */
	@Override
	public List<BoardGrVO> selectSellerBoardGrList(HashMap<String, Object> Map) {
		List<BoardGrVO> listInfo = (List<BoardGrVO>) boardGrDAO.selectSellerBoardGrList(Map);
		return listInfo;
	}

	/* 굿즈 페이지 */
	@Override
	public List<BoardGrVO> selectGoodsBoardGrList(HashMap<String, Object> pagingMap) throws Exception {
		List<BoardGrVO> listInfo = (List<BoardGrVO>) boardGrDAO.selectGoodsBoardGrList(pagingMap);
		return listInfo;
	}

	/* 리스트 불러오기 */
	@Override
	public List<BoardGrVO> selectBoardGrallList() throws Exception {
		List<BoardGrVO> listInfo = (List<BoardGrVO>) boardGrDAO.selectBoardGrallList();
		return listInfo;
	}

	@Override
	public List<BoardGrVO> selectMyBoardGrallList(String u_id) throws Exception {
		List<BoardGrVO> listInfo = (List<BoardGrVO>) boardGrDAO.selectMyBoardGrallList(u_id);
		return listInfo;
	}

	@Override
	public List<BoardGrVO> selectSellerBoardGrallList(String s_id) {
		List<BoardGrVO> listInfo = (List<BoardGrVO>) boardGrDAO.selectSellerBoardGrallList(s_id);
		return listInfo;
	}

	@Override
	public List<BoardGrVO> selectGoodsBoardGrallList(int g_id) throws Exception {
		List<BoardGrVO> listInfo = (List<BoardGrVO>) boardGrDAO.selectGoodsBoardGrallList(g_id);
		return listInfo;
	}

	/* 게시글 보기 */
	@Override
	public Map<String, Object> boardGrView(int b_gr_id) throws Exception {
		Map<String, Object> boardGrMap = new HashMap<String, Object>();
		BoardGrVO boardGrVO = boardGrDAO.selectBoardGrDetail(b_gr_id);
		boardGrMap.put("boardGrVO", boardGrVO);
		List<Img_grVO> imageList = boardGrDAO.selectBoardGrDetailImage(b_gr_id);
		boardGrMap.put("imageList", imageList);
		return boardGrMap;
	}
	
	@Override
	public List<Img_grVO> imageList(int b_gr_id) throws Exception {
		List<Img_grVO> imageList = boardGrDAO.selectBoardGrDetailImage(b_gr_id);
		return imageList;
				
	}

	/* 답변쓰기 */
	@Override
	public List<BoardGrVO> boardGrViewReview(int b_gr_id) throws Exception {
		return (List<BoardGrVO>) boardGrDAO.boardGrViewReview(b_gr_id);
	}

	@Override
	public void boardGrUpdate(BoardGrVO boardGrVO) throws Exception {
		boardGrDAO.boardGrUpdate(boardGrVO);
	}

	@Override
	public void boardGrDelete(int b_gr_id) throws Exception {
		boardGrDAO.boardGrDelete1(b_gr_id);
		boardGrDAO.boardGrDelete2(b_gr_id);
	}

	@Override
	public void boardGrWrite(HashMap<String, Object> newboardGrMap) throws Exception {
		boardGrDAO.boardGrWrite(newboardGrMap);
	}

	@Override
	public void addImg(HashMap<String, Object> item) throws Exception {
		boardGrDAO.addImg(item);
	}

	@Override
	public BoardGrVO findb_gr_id() throws Exception {
		return boardGrDAO.findb_gr_id();
	}

	@Override
	public BoardGrVO grdownload(int b_gr_id) {
		return boardGrDAO.grdownload(b_gr_id);
	}

	// 판매자 페이지 상품후기 내역 조회를 위해 사용 0616
	@Override
	public List<BoardGrVO> selectBoardGrSList(HashMap<String, Object> map) throws Exception {
		List<BoardGrVO> sGrListInfo = (List<BoardGrVO>) boardGrDAO.selectBoardGrSList(map);
		return sGrListInfo;
	}

	// 굿즈 디테일 상품 후기를 위해 답글 조회기능 0617
	@Override
	public List<BoardGrVO> SelectReview(int g_id) throws Exception {
		List<BoardGrVO> SelectReview = (List<BoardGrVO>) boardGrDAO.SelectReview(g_id);
		return SelectReview;
	}
	// 06/17 긋즈 디테일에 사용할 별점 평균 구하기
	@Override
	public int selectGoodAvg(int g_id) throws Exception {
		return boardGrDAO.selectGoodAvg(g_id);
	}

	@Override
	public BoardGrVO o_idSearch(int o_id) throws Exception {
		BoardGrVO o_idSearch = (BoardGrVO) boardGrDAO.o_idSearch(o_id);
		return o_idSearch;
	}

}
