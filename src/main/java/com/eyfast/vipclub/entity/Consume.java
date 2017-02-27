package com.eyfast.vipclub.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Consume {
	private Integer id;

	private Integer customerId;

	private BigDecimal money;

	private String remark;

	private Date buytime;

	public Consume() {
	}

	public Consume(Integer customerId, BigDecimal money, String remark, Date buytime) {
		this.customerId = customerId;
		this.money = money;
		this.remark = remark;
		this.buytime = buytime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public Date getBuytime() {
		return buytime;
	}

	public void setBuytime(Date buytime) {
		this.buytime = buytime;
	}
}