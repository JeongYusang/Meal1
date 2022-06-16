package com.meal.board.a.vo;

import org.springframework.stereotype.Component;

@Component("BaVO")
public class BaVO {
	public int b_a_id;
	public String reg_id;
	public String title;
	public String content;
	public String cate;
	public String creDate;
	public int parentNo;
	public String a_id;
	public String secret;
	
	public int getB_a_id() {
		return b_a_id;
	}
	public void setB_a_id(int b_a_id) {
		this.b_a_id = b_a_id;
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
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
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
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	

}
