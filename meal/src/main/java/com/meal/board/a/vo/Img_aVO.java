package com.meal.board.a.vo;

import org.springframework.stereotype.Component;

@Component("Img_aVO")
public class Img_aVO {
	public int ib_a_id;
	public String reg_id;
	public String fileName;
	public String creDate;
	public String cate;
	public int b_a_id;
	
	
	public int getIb_a_id() {
		return ib_a_id;
	}
	public void setIb_a_id(int ib_a_id) {
		this.ib_a_id = ib_a_id;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getCreDate() {
		return creDate;
	}
	public void setCreDate(String creDate) {
		this.creDate = creDate;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public int getB_a_id() {
		return b_a_id;
	}
	public void setB_a_id(int b_a_id) {
		this.b_a_id = b_a_id;
	}
	
	
}
