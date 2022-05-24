package com.meal.board.gq.vo;

import org.springframework.stereotype.Component;

@Component("BoardGqVO")
public class BoardGqVO {
	public int b_gq_id;
	public String reg_id;
	public String title;
	public String content;
	public String creDate;
	public int parentNo;
	public String secret;
	public String u_id;
	public String s_id;
	public int g_id;
	public String o_fileName;
	public String compare;
	public String g_name;
	public int ib_gq_id;
	public String fileName;
	
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public int getB_gq_id() {
		return b_gq_id;
	}
	public void setB_gq_id(int b_gq_id) {
		this.b_gq_id = b_gq_id;
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
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	public String getO_fileName() {
		return o_fileName;
	}
	public void setO_fileName(String o_fileName) {
		this.o_fileName = o_fileName;
	}
	public String getCompare() {
		return compare;
	}
	public void setCompare(String compare) {
		this.compare = compare;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public int getIb_gq_id() {
		return ib_gq_id;
	}
	public void setIb_gq_id(int ib_gq_id) {
		this.ib_gq_id = ib_gq_id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
