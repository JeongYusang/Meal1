package com.meal.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	public int o_id;
	public String u_name;
	public String g_name;
	public String ig_id;
	public int o_goods_qty;
	public int o_goods_price;
	public String receiver_name;
	public String receiver_hp;
	public String receiver_addr1;
	public String receiver_addr2;
	public String receiver_addr3;
	public String deliver_method;
	public String deliver_message;
	public String delivery_state;
	public String pay_method;
	public String card_com_name;
	public String card_pay_month;
	public String good_cancel;
	public Date pay_order_time;
	public int g_id;
	public String u_id;
	public String s_id;
	public int n_id;
	public int o_useMile;
	public int parentNo;
	public String review;
	public int b_gr_id;
	public int sum;
	public int d_price;
	public int count;
	public int o_goods_saleprice;
	
	public int getO_goods_saleprice() {
		return o_goods_saleprice;
	}
	public void setO_goods_saleprice(int o_goods_saleprice) {
		this.o_goods_saleprice = o_goods_saleprice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getD_price() {
		return d_price;
	}
	public void setD_price(int d_price) {
		this.d_price = d_price;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getB_gr_id() {
		return b_gr_id;
	}
	public void setB_gr_id(int b_gr_id) {
		this.b_gr_id = b_gr_id;
	}
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getIg_id() {
		return ig_id;
	}
	public void setIg_id(String ig_id) {
		this.ig_id = ig_id;
	}
	public int getO_goods_qty() {
		return o_goods_qty;
	}
	public void setO_goods_qty(int o_goods_qty) {
		this.o_goods_qty = o_goods_qty;
	}
	public int getO_goods_price() {
		return o_goods_price;
	}
	public void setO_goods_price(int o_goods_price) {
		this.o_goods_price = o_goods_price;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public String getReceiver_hp() {
		return receiver_hp;
	}
	public void setReceiver_hp(String receiver_hp) {
		this.receiver_hp = receiver_hp;
	}
	public String getReceiver_addr1() {
		return receiver_addr1;
	}
	public void setReceiver_addr1(String receiver_addr1) {
		this.receiver_addr1 = receiver_addr1;
	}
	public String getReceiver_addr2() {
		return receiver_addr2;
	}
	public void setReceiver_addr2(String receiver_addr2) {
		this.receiver_addr2 = receiver_addr2;
	}
	public String getReceiver_addr3() {
		return receiver_addr3;
	}
	public void setReceiver_addr3(String receiver_addr3) {
		this.receiver_addr3 = receiver_addr3;
	}
	public String getDeliver_method() {
		return deliver_method;
	}
	public void setDeliver_method(String deliver_method) {
		this.deliver_method = deliver_method;
	}
	public String getDeliver_message() {
		return deliver_message;
	}
	public void setDeliver_message(String deliver_message) {
		this.deliver_message = deliver_message;
	}
	public String getDelivery_state() {
		return delivery_state;
	}
	public void setDelivery_state(String delivery_state) {
		this.delivery_state = delivery_state;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getCard_com_name() {
		return card_com_name;
	}
	public void setCard_com_name(String card_com_name) {
		this.card_com_name = card_com_name;
	}
	public String getCard_pay_month() {
		return card_pay_month;
	}
	public void setCard_pay_month(String card_pay_month) {
		this.card_pay_month = card_pay_month;
	}
	public String getGood_cancel() {
		return good_cancel;
	}
	public void setGood_cancel(String good_cancel) {
		this.good_cancel = good_cancel;
	}
	public Date getPay_order_time() {
		return pay_order_time;
	}
	public void setPay_order_time(Date pay_order_time) {
		this.pay_order_time = pay_order_time;
	}
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
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
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public int getO_useMile() {
		return o_useMile;
	}
	public void setO_useMile(int o_useMile) {
		this.o_useMile = o_useMile;
	}
	public int getParentNo() {
		return parentNo;
	}
	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	
	

}