package model;

import java.util.ArrayList;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;

import bean.EntryForm;

import dao.DBConnection;

public class StockReportArtmodel {

	

	public ArrayList<EntryForm> getUserList(int artno) {
		ArrayList<EntryForm> userList = new ArrayList<EntryForm>();
		try {
			Connection con = DBConnection.dbConnection();

			String query = "select * from stockdata where articleno=" +artno+" AND (trantype='Entry' or trantype='Update' or trantype='Return')";

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				System.out.println("result andar aa gaya");
				
				EntryForm us = new EntryForm(rs.getInt("articleno"),
						rs.getDouble("price"), rs.getInt("quantity"),
						rs.getString("name"), rs.getDate("date"),rs.getString("trantype"),rs.getString("type"));
				userList.add(us);
			}

		} catch (Exception e) {
			e.printStackTrace();
			userList = null;
		}
		return userList;
	}

	// TODO Auto-generated method stub

}
