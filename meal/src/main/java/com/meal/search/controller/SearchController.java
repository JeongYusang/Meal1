package com.meal.search.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class SearchController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Autowired
	private SearchService searchService;
	@Autowired
	private GoodsVO goodsVO;

	@RequestMapping(value = "/SearchGoods.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView searchGoods(@RequestParam Map<String, String> map,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
		pagingInfo.put("section", section);
		pagingInfo.put("pageNum", pageNum);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);

		String text = map.get("text");
		String g_allergy_M = map.get("g_allergy_M");
		pagingMap.put("g_allergy_M", g_allergy_M);
		logger.debug("========================");
		logger.debug("allergyM : " + g_allergy_M);
		System.out.println("allergy : " + g_allergy_M);
		logger.debug("========================");
		if (g_allergy_M != null) {
			logger.debug("========================");
			logger.debug("allergy 포함구문 ");
			System.out.println("allergy 포함구문 ");
			logger.debug("========================");
			List<String> allergyList = new ArrayList<String>();
			String[] allergyL = g_allergy_M.split("/");
			int length = g_allergy_M.split("/").length;
			for (int i = 0; i < length; i++) {
				String allergy = allergyL[i];
				logger.debug("========================");
				logger.debug("allergy : " + allergy);
				System.out.println("allergy : " + allergy);

				logger.debug("========================");

				allergyList.add(allergy);

			}
			pagingMap.put("allergyList", allergyList);
		}
		if (pageNum != null) {
			if (Integer.parseInt((String) pageNum) >= 1) {
				pagingMap.put("start", 8 * (Integer.parseInt((String) pageNum)-1));
			}
		} else {
			pagingMap.put("start", 0);
		}
		pagingMap.put("text", text);
		pagingMap.put("end", 8);
		

		// 메인창에 띄워줄 상품 정보를 저장 추후 쿼리를 바꿔줄 예정이긴함
		// HashMap<String,Object> map = new HashMap<String,Object> ();
		// map.put("text", text);
		List<GoodsVO> searchList = (List<GoodsVO>) searchService.SearchGoods(pagingMap);
		System.out.println("베이스컨트롤러 메인 메소드");
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchList", searchList);
		mav.addObject("text", text);
		mav.addObject("g_allergy_M", g_allergy_M);
		
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/CateSearchGoods.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView CatesearchGoods(@RequestParam Map<String, String> map, @RequestParam("cate") String cate,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
		pagingInfo.put("section", section);
		pagingInfo.put("pageNum", pageNum);
		HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(pagingInfo);

		String text = map.get("text");
		String g_allergy_M = map.get("g_allergy_M");
		pagingMap.put("g_allergy_M", g_allergy_M);
		logger.debug("========================");
		logger.debug("allergyM : " + g_allergy_M);
		System.out.println("allergy : " + g_allergy_M);
		logger.debug("========================");
		if (g_allergy_M != null) {
			logger.debug("========================");
			logger.debug("allergy 포함구문 ");
			System.out.println("allergy 포함구문 ");
			logger.debug("========================");
			List<String> allergyList = new ArrayList<String>();
			String[] allergyL = g_allergy_M.split("/");
			int length = g_allergy_M.split("/").length;
			for (int i = 0; i < length; i++) {
				String allergy = allergyL[i];
				logger.debug("========================");
				logger.debug("allergy : " + allergy);
				System.out.println("allergy : " + allergy);

				logger.debug("========================");

				allergyList.add(allergy);

			}
			pagingMap.put("allergyList", allergyList);
		}
		pagingMap.put("text", text);
		if (pageNum != null) {
			if (Integer.parseInt((String) pageNum) >= 1) {
				pagingMap.put("start", 8 * (Integer.parseInt((String) pageNum)-1));
			}
		} else {
			pagingMap.put("start", 0);
		}
		pagingMap.put("end", 8);
		pagingMap.put("cate", cate);

		// 메인창에 띄워줄 상품 정보를 저장 추후 쿼리를 바꿔줄 예정이긴함
		// HashMap<String,Object> map = new HashMap<String,Object> ();
		// map.put("text", text);
		List<GoodsVO> goodsList = (List<GoodsVO>) searchService.CateSearchGoods(pagingMap);
		System.out.println("베이스컨트롤러 메인 메소드");
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsList", goodsList);
		mav.addObject("text", text);
		mav.addObject("cate", cate);
		mav.addObject("g_allergy_M", g_allergy_M);
		mav.setViewName(viewName);
		return mav;
	}

}
