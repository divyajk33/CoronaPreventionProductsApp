package com.shiva.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.shiva.bindings.Product;
import com.shiva.entity.ProductEntity;
import com.shiva.exception.ProductException;
import com.shiva.repository.ProductRepository;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	ProductRepository repo;

	@Override
	public boolean addProduct(Product pb) {
		// TODO Auto-generated method stub
		 boolean isSaved=false;
			
		 try {
				ProductEntity entity=new ProductEntity();
				BeanUtils.copyProperties(pb, entity);
				ProductEntity addedEntity=repo.save(entity);
				if( addedEntity.getPid()!=null) {
					isSaved=true;
				}
				
			}
			catch(Exception e){
				throw new ProductException("The product is not added successfully please try again!!!");
			}
			
		
		
		
		return isSaved;
	}

	@Override
	public List<Product> getProducts() {
		// TODO Auto-generated method stub
List<Product>products=new ArrayList<Product>();
		
		List<ProductEntity>entitylist=repo.findAll();
		entitylist.forEach (entity->{
			Product product=new Product();
			product.setPid(entity.getPid());
			product.setPname(entity.getPname());
			product.setPcost(entity.getPcost());
			product.setPdesc(entity.getPdesc());
			product.setImage(entity.getImage());
			products.add(product);
		});
		
		
		
		
		return products;
	}

	@Override
	public Product getProductById(String id) {
		Product pb=null;
		// TODO Auto-generated method stub
		Optional<ProductEntity> pt=repo.findById(id);
		if(pt.isPresent()) { 
			 ProductEntity entity=pt.get();
			  pb=new Product();
		pb.setPid(entity.getPid());
		pb.setPname(entity.getPname());
		pb.setPcost(entity.getPcost());
		pb.setPdesc(entity.getPdesc());
		pb.setImage(entity.getImage());
		} 
		return pb;
	}

	@Override
	public boolean updateProduct(Product pb) {
		// TODO Auto-generated method stub
				 boolean isUpdated=false;
					
				 try {
						ProductEntity entity=new ProductEntity();
						BeanUtils.copyProperties(pb, entity);
						ProductEntity addedEntity=repo.save(entity);
						if( addedEntity.getPid()!=null) {
							isUpdated=true;
						}
						
					}
					catch(Exception e){
						throw new ProductException("The product is not added successfully please try again!!!");
					}
					
				
				
				
				return isUpdated;
	}

	@Override
	public void deleteProduct(String id) {
		// TODO Auto-generated method stub
		repo.deleteById(id);
		System.out.println("The product is deleted successfully");
		
	}

	@Override
	public boolean login(String uname, String pwd) {
		boolean isLogged=false;
		if(uname.equals("admin")&& pwd.equals("admin")) {
			isLogged=true;
		}
		return isLogged;
	}

	

	
	
}
