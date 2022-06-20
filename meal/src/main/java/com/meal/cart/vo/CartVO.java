package com.meal.cart.vo;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {
	public int c_id;
	public String cate;
	public String g_name;
	public String fileName;
	public int g_id;
	public int c_qty;
	public String u_id;
	public int g_price;
	public int c_sum;
	public int c_deleP;
	public int g_saleprice;

	public int getG_saleprice() {
		return g_saleprice;
	}

	public void setG_saleprice(int g_saleprice) {
		this.g_saleprice = g_saleprice;
	}

	public int getC_deleP() {
		return c_deleP;
	}

	public void setC_deleP(int c_deleP) {
		this.c_deleP = c_deleP;
	}

	public int getC_sum() {
		return c_sum;
	}

	public void setC_sum(int c_sum) {
		this.c_sum = c_sum;
	}

	public int getG_price() {
		return g_price;
	}

	public void setG_price(int g_price) {
		this.g_price = g_price;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
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

	public int getC_qty() {
		return c_qty;
	}

	public void setC_qty(int c_qty) {
		this.c_qty = c_qty;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

}
