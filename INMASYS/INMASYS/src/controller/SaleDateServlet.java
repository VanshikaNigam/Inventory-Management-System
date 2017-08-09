package controller;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SaleDateModel;
import bean.EntryForm;

/**
 * Servlet implementation class SaleDateServlet
 */
public class SaleDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleDateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		System.out.println("list");
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-mm-dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-mm-dd");
		java.util.Date convertedDate1 = null;
		java.util.Date convertedDate2 = null;

		try {
			System.out.println("try");
			convertedDate1 = dateFormat1.parse(date1);
			convertedDate2 = dateFormat2.parse(date2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String str1 = dateFormat1.format(convertedDate1);
		String dt1 = new String(str1);
		String str2 = dateFormat2.format(convertedDate2);
		String dt2 = new String(str2);
		java.sql.Date sqlDate1 = java.sql.Date.valueOf(dt1);
		java.sql.Date sqlDate2 = java.sql.Date.valueOf(dt2);

		SaleDateModel saledate=new SaleDateModel();
		 ArrayList<EntryForm> list= saledate.getDList(sqlDate1,sqlDate2);
		 request.setAttribute("list", list);
		 RequestDispatcher rd=request.getRequestDispatcher("SlByDate.jsp");
		 rd.forward(request, response);

	}

}
