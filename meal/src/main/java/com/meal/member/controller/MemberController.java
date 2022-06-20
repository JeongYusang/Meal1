package com.meal.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meal.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView addMember1(@ModelAttribute("memberVO") MemberVO _memberVO, @RequestParam("u_id") String u_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity overlapped(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity updateMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity deleteMember(@RequestParam(value="u_id", required = false)String u_id,@RequestParam HashMap<String, Object> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView myMileage(@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView memberDetail(@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum,
			@RequestParam(value = "u_id", required = false)String u_id,HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView UpdateForm(@RequestParam(value = "u_id", required = false) String u_id,@RequestParam HashMap<String, Object> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
