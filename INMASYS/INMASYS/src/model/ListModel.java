package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.StockForm;
import dao.DBConnection;

public class ListModel {
	
	public ArrayList<StockForm> getSList() 
	{
		ArrayList<StockForm> list = new ArrayList<StockForm>();
		try {
			Connection con = DBConnection.dbConnection();
			String query = "select articleno,type,quantity from stock";

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			System.out.println("Check");
		while (rs.next())

			{
				System.out.println("insertion");

				StockForm sf = new StockForm(rs.getInt("articleno"),
					 rs.getInt("quantity"),rs.getString("type"));
				list.add(sf);
			}
		} catch (Exception e) {
			System.out.println("catch");
			list = null;
		}
		return list;

}}
