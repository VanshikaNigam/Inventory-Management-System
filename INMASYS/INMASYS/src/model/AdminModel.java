package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import dao.DBConnection;

public class AdminModel
{
			public boolean admin(String userid,String username,String password,String ques,String ans)
			{
                
			try {
				
				Connection con = DBConnection.dbConnection();
				String query=" insert into login (username,password,userid,ques,ans) values ('"
						+ username
						+ "','"
						+ password
						+ "','"
						+ userid
						+ "','"+ques+"','"+ans+"')";
				PreparedStatement ps = con.prepareStatement(query);
				
				System.out.println("yahan tak aaya");			
				ps.executeUpdate();
				System.out.println("ho gaya");
				
				return true;
				
			} catch (Exception e) {
				return false;
			}

		}

}
