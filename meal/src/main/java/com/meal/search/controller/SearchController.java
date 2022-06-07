package com.meal.search.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meal.common.controller.BaseController;
import com.meal.goods.vo.GoodsVO;
import com.meal.search.service.SearchService;

@Controller("SearchController")
@RequestMapping("/search")
public class SearchController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Autowired
	private SearchService searchService;
	@Autowired
	private GoodsVO goodsVO;


	
	
	@RequestMapping(value = "/SearchGoods.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView searchGoods(@RequestParam String text,@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
		pagingInfo.put("section", section);
		pagingInfo.put("pageNum", pageNum);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);
		pagingMap.put("text", text);
		// 메인창에 띄워줄 상품 정보를 저장 추후 쿼리를 바꿔줄 예정이긴함
		//HashMap<String,Object> map = new HashMap<String,Object> ();
		//map.put("text", text);
	List<GoodsVO> searchList = (List<GoodsVO>) searchService.SearchGoods(pagingMap);
		System.out.println("베이스컨트롤러 메인 메소드");
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchList", searchList);
		mav.addObject("text",text);
		mav.setViewName(viewName);
		return mav;
	}

	
}