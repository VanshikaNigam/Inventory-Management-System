package model;

import dao.DBConnection;
import bean.EntryForm;
import java.sql.*;

import bean.ForgotForm;

public class ForgotModel {

	public ForgotForm getQuestion(String userid) {
		ForgotForm forgotForm = new ForgotForm();
		try {

			Connection con = DBConnection.dbConnection();
			System.out.println(userid);
			String query = "select * from login where userid='" + userid + "'";

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

			if (rs.next()) {
				System.out.println("rs");
				forgotForm.setQues(rs.getString("ques"));

			} else
				forgotForm = null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return forgotForm;
	}

	public ForgotForm getPassword(String userid,String ans) {
		ForgotForm forgotForm = new ForgotForm();
		try {

			Connection con = DBConnection.dbConnection();
			System.out.println(userid);
			String query = "select * from login where userid='" + userid + "' AND ans='"+ans+"'" ;

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

			if (rs.next()) {
				System.out.println("rs");
				forgotForm.setUserid(rs.getString("userid"));
				forgotForm.setQues(rs.getString("ques"));
				forgotForm.setAns(rs.getString("ans"));
				forgotForm.setPassword(rs.getString("password"));

			} else
				forgotForm = null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return forgotForm;
	}
}