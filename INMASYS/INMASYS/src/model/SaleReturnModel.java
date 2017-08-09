package model;

import dao.DBConnection;
import bean.SalesForm;
import java.sql.*;
import java.util.ArrayList;
import bean.SaleReturnForm;
public class SaleReturnModel {
	public ArrayList<SaleReturnForm> generate(int artno, long bill, String type,double rate,  int qty, double dis) {
		ArrayList<SaleReturnForm> saleList = new ArrayList<SaleReturnForm>();
		SaleReturnForm salesForm = new SaleReturnForm();
		try {

			Connection con = DBConnection.dbConnection();
			
			double discount = (qty * rate * dis) / 100;
			System.out.println(discount);
			double net = (qty * rate) - discount;
			
			System.out.println(net);
			String query = "select * from temp where articleno=" + artno;
			 PreparedStatement stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
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
					+ ",now()," + qty + "," + dis + "," + net + ")";

			PreparedStatement ps = con.prepareStatement(query);
			int y = ps.executeUpdate();
			System.out.println(y);
			if (y == 1) {
				salesForm = null;
			}}

			stmt = con.prepareStatement("select * from temp");
			rs = stmt.executeQuery();
			while (rs.next()) {
				SaleReturnForm us = new SaleReturnForm(rs.getInt("articleno"),
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

	public ArrayList<SaleReturnForm> generate() {

		ArrayList<SaleReturnForm> saleList = new ArrayList<SaleReturnForm>();
		try {
			int i = 1;
			Connection con = DBConnection.dbConnection();
			PreparedStatement stmt = con.prepareStatement("select * from temp");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				SaleReturnForm us = new SaleReturnForm(rs.getInt("articleno"),
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
