package com.DAO;

import java.util.List;

import com.entity.Req_productentity;
import com.entity.User;

public interface UserDAO {
	
	public boolean userRegister(User us);
	public User login(String email, String password);
	public boolean add_reqProducts(Req_productentity pro);
	public List<Req_productentity> get_reqProducts();
	public List<User> get_users();
}
