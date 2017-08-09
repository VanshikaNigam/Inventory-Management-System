package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import dao.DBConnection;

public class GenerateBill {
	public long generate() {
		long billno=0;
		try {
			Connection con = DBConnection.dbConnection();

			String query = "select bill from stockdata";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				long x = rs.getLong("bill");
				if (billno <= x) {
					System.out.println(billno);
					billno = x + 1;
					System.out.println(billno);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return billno;
	}
	
}
