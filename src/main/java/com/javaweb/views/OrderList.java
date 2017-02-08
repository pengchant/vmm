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
