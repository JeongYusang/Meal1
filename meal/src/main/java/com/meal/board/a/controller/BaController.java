package com.meal.board.a.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BaController {
	
	public ModelAndView writeBoardA(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	
	public ModelAndView boardAWrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView boardAList(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section1", required = false) String section,
			@RequestParam(value = "pgNum", required = false) String pgNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
