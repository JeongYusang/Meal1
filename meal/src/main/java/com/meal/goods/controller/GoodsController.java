package com.meal.goods.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.meal.goods.vo.GoodsVO;

public interface GoodsController {
	public ModelAndView addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ResponseEntity goodsoverlapped(@RequestParam("g_name") String g_name, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView updateGoodsForm(@RequestParam("g_id") int g_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity updateGoods(int g_id, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;

	public ModelAndView deleteGoods(@RequestParam HashMap<String, Object> map, @RequestParam("g_id") int g_id,
			HttpServletRequest request, HttpServletResponse repsponse) throws Exception;

	public ModelAndView goodsDetail(@RequestParam("g_id") int g_id,
			@RequestParam(value="message", required = false) String message,
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception ;
	
	@RequestMapping(value = "/selectGoodsPage.do", method = { RequestMethod.POST, RequestMethod.GET })
	   public ModelAndView selectAllGoods(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
	         @RequestParam(value = "section1", required = false) String section,
	         @RequestParam(value = "pgNum", required = false) String pgNum, HttpServletRequest request,
	         HttpServletResponse response) throws Exception;
	
	public void addGoodsInQuick(int g_id,GoodsVO goodsInfo,HttpSession session)throws Exception;
}
