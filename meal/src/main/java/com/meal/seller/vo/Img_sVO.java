package com.meal.seller.vo;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository("img_sVO")
public class Img_sVO {

	private String is_id;
	private String fileName;
	private Date creDate;
	private String s_id;
	private String cate;
	public String getIs_id() {
		return is_id;
	}
	public void setIs_id(String is_id) {
		this.is_id = is_id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
}
