package com.meal.board.gq.vo;

import org.springframework.stereotype.Component;

@Component("Img_gqVO")
public class Img_gqVO {
	public int ib_gq_id;
	public String reg_id;
	public String fileName;
	public String creDate;
	public int b_gq_id;
	public int g_id;
	
	public int getIb_gq_id() {
		return ib_gq_id;
	}
	public void setIb_gq_id(int ib_gq_id) {
		this.ib_gq_id = ib_gq_id;
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
	public int getB_gq_id() {
		return b_gq_id;
	}
	public void setB_gq_id(int b_gq_id) {
		this.b_gq_id = b_gq_id;
	}
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	
	
}
