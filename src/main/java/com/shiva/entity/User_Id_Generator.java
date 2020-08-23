package com.shiva.entity;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class User_Id_Generator implements IdentifierGenerator {

	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		
		Integer seqval=null;
		
		Connection con=null;
		con=session.connection();
		try {
			Statement st=con.createStatement();
		
			ResultSet rs=st.executeQuery("select USER_SEQ.NEXTVAL from DUAL");
			if(rs.next()) {
				seqval=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String uid="UID"+"-"+seqval;
		return uid;
	}

}
