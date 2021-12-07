package com.DAO;

import java.util.List;

import com.entity.Brand;
import com.entity.Products;
import com.entity.Vmodel;

public interface ProductDAO {
	public boolean addBrand(Brand b);
	public boolean addVmodel(Vmodel vm);
	public List<Brand> getBrand();
	public List<Brand> getBrandall();
	public List<Vmodel> getVmodel(int BrandId);
	public List<Vmodel> getVmodelall();
	
	public boolean addProducts(Products pro);
	public List<Products> getProducts();
	public Products getProductsByid(int id);
	public boolean updateProducts(Products pro);
	public List<Products> UsergetProducts();
}
