package model;

import dao.DBConnection;
import bean.ReturnForm;
import java.sql.*;

public class UpdateModel {
	public ReturnForm update(int artNum,int qty,double salerate,Date date,String Name,String Type) {
		System.out.println("aa gaya");

		ReturnForm returnForm = new ReturnForm();
		try {
			Connection con = DBConnection.dbConnection();
			
			String quer="select quantity from inventory.stock where articleNo="+artNum;
		
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(quer);
			System.out.println(rs);
			while(rs.next())
			{
				System.out.println("hellhho");
				System.out.println(rs.getInt("quantity"));
			returnForm.setQuantity(rs.getInt("quantity"));
				
			// returnForm.setQuantity(rs.getInt(3));
			 
			}
			
			int data=returnForm.getQuantity();
			System.out.println(" mhkhk"+data);
			int uqty=data-qty;
			System.out.println("date="+date);

			String query = "UPDATE `inventory`.`stock` SET `quantity`="+uqty+", `date`='"+date+"' WHERE `articleNo`="+artNum;


			
		System.out.println("update ho gaya");
			PreparedStatement ps1= con.prepareStatement(query);
			int a=ps1.executeUpdate();
			if (a==1) {
				System.out.println("yupiee");

			}
         int stid=1;
			
			String query4="select * from inventory.stockdata where articleNo="+artNum+"";
		
			Statement st3=con.createStatement();
			ResultSet rs2=st3.executeQuery(query4);
			System.out.println(rs2);
			while(rs2.next())
			{
				stid++;
				System.out.println("id="+stid);
				
			// returnForm.setQuantity(rs.getInt(3));
			 
			}
			String query1="insert into stockdata(articleno,quantity,price,date,name,type,trantype) values("+artNum+","+uqty+","+salerate+",'"+date+"','"+Name+"','"+Type+"','Return');";
			System.out.println("yahan tak aaya");
			PreparedStatement ps2= con.prepareStatement(query1);
			int a1=ps2.executeUpdate();
			System.out.println("yahanbhi aaya");
			if(a1==1)
			{
				System.out.println("yeyeyeye");
			}
			else {
				returnForm=null;
			
			}
			
			return returnForm;
			
		} catch (Exception e) {
			return null;
		}

	}
}
