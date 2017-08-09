package model;

import java.text.SimpleDateFormat;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.ArrayList;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;

import bean.EntryForm;

import java.util.Date;
import java.util.concurrent.Callable;

import dao.DBConnection;
import java.sql.ResultSet;
import java.sql.Statement;

public class StrByDateModel {
	


	public ArrayList<EntryForm> getUserList(Date d1,Date d2) {
		ArrayList<EntryForm> userList = new ArrayList<EntryForm>();
		try {
			Connection con = DBConnection.dbConnection();
			    //initialize
			
		
		  
			
			String query="select * from stockdata where date BETWEEN '"+d1+"' AND '"+d2+"' AND (trantype='Entry' or trantype='Update' or trantype='Return')";	
			
			    Statement st=con.createStatement();
			    ResultSet rs=st.executeQuery(query);   
			    while(rs.next())
			    {
			    	System.out.println("result andar aa gaya");
					
					EntryForm us = new EntryForm(rs.getInt("articleno"),
							rs.getDouble("price"), rs.getInt("quantity"),             //get data here
							rs.getString("name"), rs.getDate("date"),rs.getString("trantype"),rs.getString("type"));
					userList.add(us); 
			    }


			
		}
			

		catch (Exception e)
		{
			userList = null;
		}
		return userList;
	}
	

}