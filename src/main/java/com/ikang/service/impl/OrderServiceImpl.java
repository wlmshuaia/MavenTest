package com.ikang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikang.bean.Order;
import com.ikang.dao.OrderMapper;
import com.ikang.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper ;
	
	public List<Order> selectAllOrder() {
		return this.orderMapper .selectAllOrder();
	}
	
	public void addOrder(Order Order) {
		this.orderMapper.insertOrder(Order);
	}
	
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
