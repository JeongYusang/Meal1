package com.meal.board.gr.vo;

import org.springframework.stereotype.Component;

@Component("img_grVO")
public class Img_grVO {
	public int ib_gr_id;
	public String reg_id;
	public String fileName;
	public String creDate;
	public int b_gr_id;
	public int g_id;
	
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	public int getIb_gr_id() {
		return ib_gr_id;
	}
	public void setIb_gr_id(int ib_gr_id) {
		this.ib_gr_id = ib_gr_id;
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
	public int getB_gr_id() {
		return b_gr_id;
	}
	public void setB_gr_id(int b_gr_id) {
		this.b_gr_id = b_gr_id;
	}
	
	

}
