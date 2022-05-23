package com.meal.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.meal.admin.vo.AdminVO;

public interface AdminController {
	public ModelAndView addAdmin(@ModelAttribute("adminVO") AdminVO _adminVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

}
