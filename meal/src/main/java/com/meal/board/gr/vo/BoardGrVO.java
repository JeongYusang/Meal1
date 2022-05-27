package com.meal.board.gr.vo;

import org.springframework.stereotype.Component;

@Component("boardGrVO")
public class BoardGrVO {
	public int b_gr_id;
	public String reg_id;
	public String title;
	public String content;
	public String creDate;
	public int parentNo;
	public String u_id;
	public String s_id;
	public int g_id;
	public String star;
	public String o_fileName;
	public String compare;
	public String secret;
	public String g_name;
	public int ib_gr_id;
	public String fileName;
	public int o_id;
	
	
	
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public int getIb_gr_id() {
		return ib_gr_id;
	}
	public void setIb_gr_id(int ib_gr_id) {
		this.ib_gr_id = ib_gr_id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
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
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public int getB_gr_id() {
		return b_gr_id;
	}
	public void setB_gr_id(int b_gr_id) {
		this.b_gr_id = b_gr_id;
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

	

}
