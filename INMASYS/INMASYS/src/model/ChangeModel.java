package model;

import java.sql.*;

import dao.DBConnection;
import bean.ChangeForm;

public class ChangeModel {
	public ChangeForm changeit(String currentpassword, String newpassword,
			String cnpassword, String ques, String ans, String userid) {
		System.out.println("aa gaya");

		ChangeForm changeForm = new ChangeForm();
		try {
			Connection con = DBConnection.dbConnection();
			String query = "UPDATE `inventory`.`login` SET `password`='"
					+ cnpassword + "',ques='" + ques + "', ans='" + ans
					+ "' WHERE `userid`='" + userid + "'";
			PreparedStatement ps = con.prepareStatement(query);
			int a = ps.executeUpdate();
			System.out.println("yahan tak aaya");
			if (a == 1) {
				System.out.println("yupieee");
			} else {
				changeForm = null;
			}
			return changeForm;
		} catch (Exception ef) {
			ef.printStackTrace();
			return null;
		}
	}

	public boolean checkit(String currentpassword) {
		System.out.println("hello");

		try {
			Connection con = DBConnection.dbConnection();
			String query = "select * from login where password='"
					+ currentpassword + "'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			return rs.next();

		} catch (Exception e) {
			return false;
		}

	}
}