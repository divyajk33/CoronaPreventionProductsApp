package com.shiva.entity;



import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


import org.hibernate.annotations.GenericGenerator;

//import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Entity
@Table(name="User_Data")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GenericGenerator(name="user_id_gen",strategy="com.shiva.entity.User_Id_Generator")
	@GeneratedValue(generator="user_id_gen")
	private String pid;
	private String pname;
	private String pemail;
	private String pcontact;
	private String username;
	private String password;
}
