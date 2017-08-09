package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import bean.BillForm;
import dao.DBConnection;

public class BalanceModel {

	public BillForm update(long bill) {
		BillForm billForm = new BillForm();
		int artNum, qty;
		double grosstotal = 0;

		try {
			Connection con = DBConnection.dbConnection();

			String query = "select * from temp";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {

				artNum = rs.getInt("articleno");
					
		 query = " insert into stockdata (articleno,quantity,type,price,date,discount,trantype,bill,net) values ("
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
						+",'Sale Return',"+bill+","+rs.getDouble("net")+")";
		 				
				PreparedStatement ps = con.prepareStatement(query);
				ps.executeUpdate();
				query = "select quantity from stock where articleno=" + artNum;
				Statement stmt = con.createStatement();
				ResultSet rst = stmt.executeQuery(query);

				if (rst.next()) {
					System.out.println("aa gaya");
					System.out.println(rst.getInt("quantity"));
					System.out.println(rs.getInt("quantity"));
					System.out.println(artNum);
					qty = rst.getInt("quantity") - rs.getInt("quantity");
					System.out.println(qty);
					query = "update stock set quantity=" + qty
							+ " where articleno=" + artNum;
					st = con.createStatement();
					st.executeUpdate(query);
				}
			}

			query = "select net from temp";
			st = con.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				
				grosstotal = grosstotal + rs.getInt("net");

			}
			
			System.out.println(grosstotal);
			
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
	public double balance(double bal,double rate,int qty,double dis)
	{
		
		double s=rate*qty;
		double d=s*(dis/100);
		bal=bal-(s-d);
		return bal;
	}
}
