package model;

import dao.DBConnection;
import bean.EntryForm;
import java.sql.*;

public class InsertDetailModel {
	public EntryForm insert(int artNum, double rate, Date date, int qty,
			String name, String type) {
		System.out.println("aa gaya");
		System.out.println(artNum + " " + rate + " " + date + " " + qty + " "
				+ name);
		EntryForm entryForm = new EntryForm();
		try {
			Connection con = DBConnection.dbConnection();
			System.out.println(artNum + " " + rate + " " + date + " " + qty
					+ " " + name);

			String query = " insert into stock (articleno,quantity,price,date,name,type) values ("
					+ artNum
					+ ","
					+ qty
					+ ",'"
					+ rate
					+ "','"
					+ date
					+ "','"
					+ name + "','" + type + "')";

			PreparedStatement ps = con.prepareStatement(query);
			int y = ps.executeUpdate();
			System.out.println(y);
			if (y == 1) {
				entryForm = null;
			}

			
			query = " INSERT INTO `inventory`.`stockdata` (`articleno`, `quantity`, `price`, `date`, `name`,`type`,`trantype`) VALUES ("
					+ artNum
					+ ", "
					+ qty
					+ ", "
					+ rate
					+ ", '"
					+ date + "', '" + name + "', '"+type+"','Entry');";

			ps = con.prepareStatement(query);
			y = ps.executeUpdate();
			System.out.println(query + y);
			return entryForm;

		} catch (Exception e) {
			System.out.println("catch");
			e.printStackTrace();
			return null;
		}

	}
}
