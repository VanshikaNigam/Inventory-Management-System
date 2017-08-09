package model;

import dao.DBConnection;

import bean.EntryForm;

import java.sql.*;
import java.util.ArrayList;

public class SaleDateModel

{

	public ArrayList<EntryForm> getDList(Date d1, Date d2) {
		ArrayList<EntryForm> list = new ArrayList<EntryForm>();
		try {
			double earning=0.0;
			Connection con = DBConnection.dbConnection();
			String query = "select * from stockdata where date BETWEEN '" + d1
					+ "' AND '" + d2
					+ "' AND (trantype='Sold' or trantype='Sale Return')";

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			System.out.println("Check");
			while (rs.next())

			{
				System.out.println("insertion");
				if(rs.getString("trantype").equalsIgnoreCase("Sold"))
				{	System.out.println(rs.getDouble("net"));
					
				
					earning=earning+rs.getDouble("net");
				}
				else if (rs.getString("trantype").equalsIgnoreCase("Sale Return"))
				{
					earning=earning-rs.getDouble("net");
				}
				System.out.println(earning);
				EntryForm ef = new EntryForm(rs.getInt("articleno"),
						rs.getDouble("price"), rs.getInt("quantity"),
						rs.getLong("bill"), rs.getDate("date"),
						rs.getString("trantype"),rs.getDouble("discount"),rs.getDouble("net"),earning);
				list.add(ef);
			}

		} catch (Exception e) {
			System.out.println("catch");
			list = null;
		}
		return list;
	}

}