package com.ikang.service;

import java.util.List;

import com.ikang.bean.Order;

public interface OrderService {

	
	public List<Order> selectAllOrder();
	
	public void addOrder(Order Order);
	
	/*public Order getOrderById(int id) {
		return this.orderMapper .getOrderById(id);
	}
	
	public int getCount(){
		return this.orderMapper .getCount();
	}
	
	public void addOrder(Order Order) {
		this.orderMapper .insertOrder(Order);
	}
	
	public void updateOrder(Order Order) {
		this.orderMapper .updateOrder(Order);
	}
	
	public void deleteOrder(int id) {
		this.orderMapper .deleteOrder(id);
	}
	*/
}
