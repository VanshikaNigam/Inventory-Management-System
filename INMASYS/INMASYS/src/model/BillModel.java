package model;

import dao.DBConnection;
import bean.BillForm;
import java.sql.*;

public class BillModel {
	public BillForm update(String name,long billno) {
		BillForm billForm = new BillForm();
		int artNum, qty, grossqty = 0;
		double grosstotal = 0;

		try {
			Connection con = DBConnection.dbConnection();
			

			
			String query = "select * from temp";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {

				artNum = rs.getInt("articleno");
					
		 query = " insert into stockdata (articleno,quantity,type,price,date,discount,bill,trantype,name,net) values ("
						+ rs.getInt("articleno")
						+ ","
						+ rs.getInt("quantity")
						+ ",'"
						+ rs.getString("type")
						+ "',"
						+ rs.getDouble("price")
						+ ",'"
						+ rs.getDate("date")
						+ "',"
						+ rs.getDouble("discount")
						+ ",'" + billno + "','Sold','"+name+"',"+rs.getDouble("net")+")";

				PreparedStatement ps = con.prepareStatement(query);
				ps.executeUpdate();
				
			}

			query = "select quantity,net from temp";
			st = con.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				grossqty = grossqty + rs.getInt("quantity");
				grosstotal = grosstotal + rs.getInt("net");

			}
			System.out.println(grossqty);
			System.out.println(grosstotal);
			billForm.setGrossqty(grossqty);
			billForm.setGrosstotal(grosstotal);
			query = "TRUNCATE TABLE inventory.temp;";
			st = con.createStatement();
			st.executeUpdate(query);

		} catch (Exception e) {
			System.out.println("catch me he");
			e.printStackTrace();

		}
		return billForm;
	}
}
