package model;

import dao.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bean.LoginForm;

public class LoginModel {
	public LoginForm login(String userid, String password) {
		LoginForm loginForm = new LoginForm();
		try {
			Connection con = DBConnection.dbConnection();
			PreparedStatement stmt = con
					.prepareStatement("select * from login where userid='"
							+ userid + "' and password='" + password + "'");

			ResultSet rs = stmt.executeQuery();
			System.out.println("ho gaya");
			if(rs.next())
			{
			loginForm.setCheck(true);
			loginForm.setUsername(rs.getString("username"));

			}else
loginForm.setCheck(false);				
		
		} catch (Exception e) {
			return null;
		}
		return loginForm;

	}

}
