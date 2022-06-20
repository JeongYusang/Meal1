package com.meal.board.one.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meal.board.one.vo.Board1VO;

public interface Board1Controller {
	public ModelAndView selectMyBoard1List(
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView selectBoard1List(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView writeBoard1(@ModelAttribute("Board1VO") Board1VO board1VO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView board1Update(@ModelAttribute Board1VO board1VO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView board1Updateform(@RequestParam("b_1_id") Integer b_1_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView board1View(@RequestParam("b_1_id") int b_1_id,@RequestParam(value = "message", required = false) String message, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView writeCheck(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView board1ReviewForm(@RequestParam(value = "b_1_id", required = false) Integer b_1_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView board1Delete(@RequestParam(value = "b_1_id", required = false) Integer b_1_id,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception;

}
