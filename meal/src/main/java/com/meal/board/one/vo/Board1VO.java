package com.meal.board.one.vo;

import org.springframework.stereotype.Component;

@Component("board1VO")
public class Board1VO {
	public int b_1_id;
	public String reg_id;
	public String title;
	public String content;
	public String creDate;
	public int parentNo;
	public String u_id;
	public String s_id;
	public String a_id;
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String o_fileName;
	public String compare;
	public String secret;
	
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getCompare() {
		return compare;
	}
	public void setCompare(String compare) {
		this.compare = compare;
	}
	public int getB_1_id() {
		return b_1_id;
	}
	public void setB_1_id(int b_1_id) {
		this.b_1_id = b_1_id;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreDate() {
		return creDate;
	}
	public void setCreDate(String creDate) {
		this.creDate = creDate;
	}
	public int getParentNo() {
		return parentNo;
	}
	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getO_fileName() {
		return o_fileName;
	}
	public void setO_fileName(String o_fileName) {
		this.o_fileName = o_fileName;
	}
	

}
