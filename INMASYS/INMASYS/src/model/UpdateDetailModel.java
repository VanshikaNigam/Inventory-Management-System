package model;

import dao.DBConnection;
import bean.EntryForm;
import java.sql.*;

public class UpdateDetailModel {
	public EntryForm update(int artNum, double rate, Date date, int qty,
			String name, String type) {
		System.out.println("aa gaya");
		System.out.println(artNum + " " + rate + " " + date + " " + qty + " ");
		EntryForm entryForm = new EntryForm();
		try {
			Connection con = DBConnection.dbConnection();
			System.out.println(artNum + " " + rate + " " + date + " " + qty
					+ " ");
			String query = "select quantity from stock where articleno="
					+ artNum;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

			if (rs.next()) {
				qty = rs.getInt("quantity") + qty;
			}

			query = "update stock set price=" + rate + ",date='" + date
					+ "',quantity=" + qty + " where articleno=" + artNum;

			st = con.createStatement();
			int y = st.executeUpdate(query);
			System.out.println(y);

			if (y == 1) {
				entryForm = null;
			}

			System.out.println(artNum + " " + rate + " " + date + " " + qty
					+ " " + name + " " + type);
			String qry = " INSERT INTO `inventory`.`stockdata` (articleno,quantity, price, date, name,type,trantype) VALUES ( "
					+ artNum
					+ ", "
					+ qty
					+ ", "
					+ rate
					+ ", '"
					+ date
					+ "', '"
					+ name + "', '" + type + "','Update')";

			PreparedStatement ps = con.prepareStatement(qry);
			System.out.println("after prepare");
			y = ps.executeUpdate();
			System.out.println(query + y);
			return entryForm;

		} catch (Exception e) {
			System.out.println("catch me he");
			e.printStackTrace();
			return null;

		}

	}

}
