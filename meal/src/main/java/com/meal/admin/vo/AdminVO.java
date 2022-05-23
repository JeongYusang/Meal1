package com.meal.admin.vo;

import org.springframework.stereotype.Component;

@Component("adminVO")
public class AdminVO {
	public String a_id;
	public String a_pw;
	public String a_name;
	public String a_hp;
	public String a_email1;
	public String a_email2;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_hp1;
	private String u_email1;
	private String u_email2;
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_hp1() {
		return u_hp1;
	}
	public void setU_hp1(String u_hp1) {
		this.u_hp1 = u_hp1;
	}
	public String getU_email1() {
		return u_email1;
	}
	public void setU_email1(String u_email1) {
		this.u_email1 = u_email1;
	}
	public String getU_email2() {
		return u_email2;
	}
	public void setU_email2(String u_email2) {
		this.u_email2 = u_email2;
	}
	
	
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_pw() {
		return a_pw;
	}
	public void setA_pw(String a_pw) {
		this.a_pw = a_pw;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_hp() {
		return a_hp;
	}
	public void setA_hp(String a_hp) {
		this.a_hp = a_hp;
	}
	public String getA_email1() {
		return a_email1;
	}
	public void setA_email1(String a_email1) {
		this.a_email1 = a_email1;
	}
	public String getA_email2() {
		return a_email2;
	}
	public void setA_email2(String a_email2) {
		this.a_email2 = a_email2;
	}
}
