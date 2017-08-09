package model;

import dao.DBConnection;
import bean.EntryForm;
import java.sql.*;
import bean.SalesForm;
import bean.SaleReturnForm;

public class GetDetailModel {
	
	EntryForm entryForm = new EntryForm();
	public EntryForm getDetailByArtNum(int artNum) {

		try {
			
			Connection con = DBConnection.dbConnection();

			String query = "select * from stock where articleno=" + artNum;

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

			if (rs.next()) {
				entryForm.setArtno(artNum);
				entryForm.setQty(rs.getInt(2));
				entryForm.setSalerate(rs.getDouble(3));

				entryForm.setDate(rs.getDate(4));
				entryForm.setSaler(rs.getString(5));
				entryForm.setType(rs.getString(6));
				System.out.println("rs.next");

			} else {
				entryForm = null;
			}

			return entryForm;

		} catch (Exception e) {
			return null;
		}

	}

	public EntryForm getDetail(int artNum) {

		try {
			Connection con = DBConnection.dbConnection();

			String query = "select * from stock where articleno=" + artNum;

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

			if (rs.next()) {
				entryForm.setArtno(artNum);
				entryForm.setSalerate(rs.getDouble("price"));
				entryForm.setDate(rs.getDate("date"));
				entryForm.setQty(rs.getInt("quantity"));
				entryForm.setType(rs.getString("type"));
				System.out.println("rs.next");

			} else {
				entryForm = null;
			}

			return entryForm;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public SaleReturnForm getDetail(int artNum, long billNum) {
		SaleReturnForm saleReturnForm = new SaleReturnForm();

		try {
			Connection con = DBConnection.dbConnection();

			String query = "select * from stockdata where articleno=" + artNum
					+ " and bill=" + billNum + "";

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

			if (rs.next()) {
				saleReturnForm.setArtno(artNum);
				saleReturnForm.setQty(rs.getInt("quantity"));
				saleReturnForm.setRate(rs.getDouble("price"));
				saleReturnForm.setType(rs.getString("type"));
				saleReturnForm.setDis(rs.getDouble("discount"));
				saleReturnForm.setType(rs.getString("type"));
				System.out.println("rs.next");

			} else {
				saleReturnForm = null;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return saleReturnForm;
	}
	



}
