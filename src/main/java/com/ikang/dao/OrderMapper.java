package com.ikang.dao;

import java.util.List;

import com.ikang.bean.Order;

public interface OrderMapper {
	public List<Order> selectAllOrder();
	public void insertOrder(Order Order);
/*	public Order getOrderById(int id);
	public int getCount() ;
	public void deleteOrder(int id) ;
	public void updateOrder(Order Order) ;*/
}
