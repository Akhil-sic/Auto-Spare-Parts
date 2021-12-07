package com.DAO;

import java.util.List;

import com.entity.Cart;



public interface CartDAO {
	public boolean addtoCart(Cart c);
	public boolean updateCart(Cart c);
	public List<Cart> getCart(int uid);
	public boolean delCart(int pid,int uid);
	public boolean delCart(int uid);
}
