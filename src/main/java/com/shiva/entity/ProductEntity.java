package com.shiva.entity;


import javax.persistence.*;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="Prevention_Products")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductEntity {
	@Id
	@GenericGenerator(name="product_id_gen",strategy="com.shiva.entity.Product_Id_Generator")
	@GeneratedValue(generator="product_id_gen")
	private String pid;
	private String pname;
	private double pcost;
	private String pdesc;
	@Column(name="image")
	@Lob
	private byte[] image;
}
