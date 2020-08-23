package com.shiva.repository;

import java.io.Serializable;


import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.shiva.entity.ProductEntity;


@Repository
public interface ProductRepository extends  JpaRepository<ProductEntity,Serializable>{
	
}
