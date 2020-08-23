package com.shiva.service;


import java.util.List;


import com.shiva.bindings.Product;

public interface AdminService {
	public boolean addProduct(Product pb);
	public List<Product>getProducts();
	public Product getProductById(String id);
	
	public boolean updateProduct(Product pb);

	public void deleteProduct(String id);
	public boolean login(String uname,String pwd);
	

}
