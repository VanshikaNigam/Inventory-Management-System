package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.*;

import bean.EntryForm;



import model.StrByDateModel;


import java.text.*;
import java.sql.*;


public class StrByDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StrByDateServlet() {
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
		
		System.out.println("list");
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		
		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-mm-dd");
		SimpleDateFormat dateformat2 = new SimpleDateFormat("yyyy-mm-dd");
		java.util.Date convertedDate1 = null;
		java.util.Date convertedDate2 = null;
		try {
			System.out.println("try");
			convertedDate1 = dateformat1.parse(date1);
			convertedDate2 = dateformat2.parse(date2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String str1 = dateformat1.format(convertedDate1);
		String dt1 = new String(str1);
		String str2 = dateformat2.format(convertedDate2);
		String dt2 = new String(str2);
		java.sql.Date sqlDate1 = java.sql.Date.valueOf(dt1);
		java.sql.Date sqlDate2 = java.sql.Date.valueOf(dt2);

	
		
		
			StrByDateModel strByDateModel = new StrByDateModel();
			
			ArrayList<EntryForm> list = strByDateModel.getUserList(sqlDate1,sqlDate2);
			request.setAttribute("list", list);
			RequestDispatcher rd = request
					.getRequestDispatcher("StrByDate.jsp");
			rd.forward(request, response);
		// TODO Auto-generated method stub
	}

}
