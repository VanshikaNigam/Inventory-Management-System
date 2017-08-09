package model;

import dao.DBConnection;
import bean.SalesForm;
import java.sql.*;
import java.util.ArrayList;

public class SalesFormModel {

	public ArrayList<SalesForm> generate(int artno, String type, double rate,
			double qty, double dis) {
		ArrayList<SalesForm> saleList = new ArrayList<SalesForm>();
		SalesForm salesForm = new SalesForm();
		double grosstotal = 0.0;
		try {

			Connection con = DBConnection.dbConnection();
			double discount = (qty * rate * dis) / 100;
			System.out.println(discount);
			double net = (qty * rate) - discount;
			System.out.println(net);
			
			
			String query = "select * from stock where articleno=" + artno;
			PreparedStatement stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				query = "update stock set quantity="
						+ (rs.getInt("quantity") - qty) + " where articleno="
						+ artno;
				Statement st = con.createStatement();
				st.executeUpdate(query);

			}

			query = "select * from temp where articleno=" + artno;
			 stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			if (rs.next()) {

				query = "update temp set quantity="
						+ (rs.getInt("quantity") + qty) + ",net="
						+ (rs.getDouble("net") + net) + " where articleno="
						+ artno;

				Statement st = con.createStatement();
				st.executeUpdate(query);

			} else {
				
					query = " insert into temp (articleno,type,price,date,quantity,discount,net) values ("
						+ artno
						+ ",'"
						+ type
						+ "',"
						+ rate
						+ ",now(),"
						+ qty
						+ "," + dis + "," + net + ")";

				PreparedStatement ps = con.prepareStatement(query);
				int y = ps.executeUpdate();
				System.out.println(y);
				if (y == 1) {
					salesForm = null;
				}
			}

			stmt = con.prepareStatement("select * from temp");
			rs = stmt.executeQuery();
			while (rs.next()) {

				SalesForm us = new SalesForm(rs.getInt("articleno"),
						rs.getString("type"), rs.getDouble("price"),
						rs.getDate("date"), rs.getInt("quantity"),
						rs.getDouble("discount"), rs.getDouble("net"));
				saleList.add(us);
			}
		} catch (Exception e) {
			e.printStackTrace();
			saleList = null;
		}
		return saleList;
	}

	public ArrayList<SalesForm> generate() {

		ArrayList<SalesForm> saleList = new ArrayList<SalesForm>();
		try {
			int i = 1;
			Connection con = DBConnection.dbConnection();
			PreparedStatement stmt = con.prepareStatement("select * from temp");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				SalesForm us = new SalesForm(rs.getInt("articleno"),
						rs.getString("type"), rs.getDouble("price"),
						rs.getDate("date"), rs.getInt("quantity"),
						rs.getDouble("discount"), rs.getDouble("net"));
				saleList.add(us);
				i++;
			}
			if (i == 1) {
				saleList = null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			saleList = null;
		}
		return saleList;

	}

}
