package com.meal.board.gr.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meal.board.gr.vo.BoardGrVO;

public interface BoardGrController {
	
	public ModelAndView boardGrUpdate(@ModelAttribute BoardGrVO boardGrVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView writeBoardGr(@RequestParam(value = "o_id", required = false) String o_id, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView boardGrUpdateform(@ModelAttribute("b_gr_id") Integer b_gr_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView selectBoardGrList(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	

	public ModelAndView selectMyBoardGrList(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView selectSMyBoardGrList(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView boardGrView(@RequestParam("b_gr_id") int b_gr_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;


	public ModelAndView boardGrReviewForm(@RequestParam(value = "b_gr_id", required = false) Integer b_gr_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView boardGrDelete(@RequestParam(value = "b_gr_id", required = false) Integer b_gr_id,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception;

	public ModelAndView boardGrWrite(@RequestParam("g_id")int g_id,@RequestParam("o_id")int o_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView boardGrReviewUpdateForm(@RequestParam(value = "b_gr_id", required = false) Integer b_gr_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}
