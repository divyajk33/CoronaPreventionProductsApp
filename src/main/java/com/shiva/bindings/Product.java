package com.shiva.bindings;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private String pid;
	private String pname;
	private double pcost;
	private String pdesc;
	private byte[] image;
	
	

}
