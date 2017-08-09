package model;

import dao.DBConnection;

import bean.EntryForm;

import java.sql.*;
import java.util.ArrayList;

public class SaleArtModel

{

	public ArrayList<EntryForm> getAList(int artno) {
		ArrayList<EntryForm> list = new ArrayList<EntryForm>();
		try {
			double earning=0.0;
			Connection con = DBConnection.dbConnection();
			String query = "select * from stockdata where articleno=" + artno+" AND (trantype='Sold' or trantype='Sale Return')";

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			System.out.println("Check");
			while (rs.next())

			{
				System.out.println("insert");

				if(rs.getString("trantype").equalsIgnoreCase("Sold"))
				{
					earning=earning+rs.getDouble("net");
				}
				else if (rs.getString("trantype").equalsIgnoreCase("Sale Return"))
				{
					earning=earning-rs.getDouble("net");
				}
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