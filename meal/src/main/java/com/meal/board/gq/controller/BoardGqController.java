package com.meal.board.gq.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meal.board.gq.vo.BoardGqVO;

public interface BoardGqController {
	
	public ModelAndView boardGqUpdate(@ModelAttribute BoardGqVO boardGqVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView writeBoardGq(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ModelAndView boardGqUpdateform(@ModelAttribute("b_gq_id") Integer b_gq_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView selectBoardGqList(@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum,HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	

	public ModelAndView selectMyBoardGqList(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			@RequestParam(value = "message", required = false) String message,HttpServletResponse response) throws Exception;
	
	public ModelAndView selectSMyBoardGqList(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum,
			@RequestParam(value = "message", required = false) String message,HttpServletRequest request,
			HttpServletResponse response) throws Exception;


	public ModelAndView boardGqView(@RequestParam("b_gq_id") int b_gq_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;


	public ModelAndView boardGqReviewForm(@RequestParam(value = "b_gq_id", required = false) Integer b_gq_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView boardGqDelete(@RequestParam(value = "b_gq_id", required = false) Integer b_gq_id,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception;

	public ModelAndView writeCheck(@RequestParam ("g_id") int g_id,HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView boardGqReviewUpdateForm(@RequestParam(value = "b_gq_id", required = false) Integer b_gq_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}
