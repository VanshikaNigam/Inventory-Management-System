package dao;

import java.sql.*;

public class DBConnection {

	
	public static Connection dbConnection() {
		Connection connection = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("DriverOk");
			connection = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/inventory", "root", "root");
			System.out.println("Connected");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		// TODO: handle exception
		catch (SQLException e) {
			e.printStackTrace();

			// TODO: handle exception
		} catch (Exception e) {
			e.printStackTrace();

			// TODO: handle exception
		}
		return connection;
	}
}
