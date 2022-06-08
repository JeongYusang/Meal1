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
