package com.meal.seller.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.meal.seller.vo.SellerVO;

public interface SellerController {


	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;


	public ResponseEntity updateSeller(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

	public ModelAndView addSeller( MultipartHttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView deleteSeller(@RequestParam HashMap<String,Object> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception ;
	public ModelAndView sellerDetail(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception ;
	public ModelAndView sellerMypage(@RequestParam(value = "s_id", required = false) String s_id, @RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
	         @RequestParam(value = "section", required = false) String section,
	         @RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
	         HttpServletResponse response) throws Exception;
	//판매자기준 게시판 전체조회 0615
	public ModelAndView sellerBoardMypage(@RequestParam(value = "s_id", required = false) String s_id,
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum,
			@RequestParam(value = "message", required = false) String message,HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
