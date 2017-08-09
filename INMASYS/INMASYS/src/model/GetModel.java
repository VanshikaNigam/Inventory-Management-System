package model;

import java.sql.*;




import bean.ReturnForm;

import dao.DBConnection;

public class GetModel {
	public ReturnForm getArt(int artnum) {
		
	ReturnForm returnForm = new ReturnForm();
		try {
         
			System.out.println("In db");
			Connection con = DBConnection.dbConnection();
			System.out.println("connection");
			Statement st = con.createStatement();
			System.out.println(artnum);
			ResultSet rs=st.executeQuery("select * from stock where articleno="+artnum);
			 if(rs.next())
		        {
				 System.out.println("HERE");
		          returnForm.setArticleno(artnum);
		          returnForm.setName(rs.getString("type"));
		          returnForm.setQuantity(rs.getInt("quantity"));
		          returnForm.setSalerate(rs.getDouble("price"));
		          returnForm.setSaleperson(rs.getString("name"));
		          returnForm.setDate(rs.getDate("date"));
		          
		        }
			 else
			 {
				 returnForm=null;
				 
		     }
			 return returnForm;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

}
