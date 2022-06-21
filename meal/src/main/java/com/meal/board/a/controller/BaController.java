package com.meal.board.a.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
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
	
	public ModelAndView boardADetail(@RequestParam("b_a_id") String b_a_id, @RequestParam("cate") String cate, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView boardASPList(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
		      @RequestParam(value = "section1", required = false) String section,
		      @RequestParam(value = "pgNum", required = false) String pgNum,
		      @RequestParam(value = "cate", required = false) String cate,
		      @RequestParam(value = "b_a_id", required = false) String b_a_id,
		      HttpServletRequest request,
		      HttpServletResponse response) throws Exception;
	
	public ModelAndView boardAUpdateform(@RequestParam("b_a_id") String b_a_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ResponseEntity updateBA(@RequestParam("b_a_id") String b_a_id, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteBA(@RequestParam HashMap<String, Object> map, @RequestParam("b_a_id") String b_a_id,
			HttpServletRequest request, HttpServletResponse repsponse) throws Exception;
}
