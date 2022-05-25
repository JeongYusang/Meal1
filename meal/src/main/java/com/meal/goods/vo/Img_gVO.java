package com.meal.goods.vo;



import java.util.Date;

import org.springframework.stereotype.Component;

@Component("img_gVO")
public class Img_gVO {
	
	private int ig_id;
	private String fileName;
	private int g_id;
	private String cate;
	private Date creDate;
	
	
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public int getIg_id() {
		return ig_id;
	}
	public void setIg_id(int ig_id) {
		this.ig_id = ig_id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}

	
}
