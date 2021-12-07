package com.DAO;

import java.util.List;

import com.entity.Orders;


public interface OrderDAO {

	public boolean saveOrder(List<Orders> olist);
	public List<Orders> getOrders();
	
}
