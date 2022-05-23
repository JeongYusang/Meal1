package com.meal.seller.controller;

import java.util.HashMap;

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
	
	}
