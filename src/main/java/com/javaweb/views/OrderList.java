package com.javaweb.views;

import java.util.List;

import com.javaweb.entity.Orders;
import com.javaweb.entity.Personallocate;

/**
 * 订单实体类
 * 
 * @author cp
 *
 */
public class OrderList {
	// 订单
	private Orders orders;

	// 维修人员分配
	private List<Personallocate> personallocates;

	// 客户姓名
	private String customername;

	// 客户联系方式
	private String customerphone;

	// 是否新用户
	private Integer isNew;

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getCustomerphone() {
		return customerphone;
	}

	public void setCustomerphone(String customerphone) {
		this.customerphone = customerphone;
	}

	public Integer getIsNew() {
		return isNew;
	}

	public void setIsNew(Integer isNew) {
		this.isNew = isNew;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public List<Personallocate> getPersonallocates() {
		return personallocates;
	}

	public void setPersonallocates(List<Personallocate> personallocates) {
		this.personallocates = personallocates;
	}

}
