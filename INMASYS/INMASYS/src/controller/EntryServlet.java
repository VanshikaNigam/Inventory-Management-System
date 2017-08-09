package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import bean.EntryForm;

import model.GetDetailModel;
import model.InsertDetailModel;
import model.UpdateDetailModel;

/*import java.util.*;
 import java.text.*;
 import java.sql.*;*/

public class EntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EntryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		EntryForm entryForm = new EntryForm();
		int artno;
		String button = request.getParameter("btn");

		System.out.println(button);

		if (button.equalsIgnoreCase("check")) {
			
			artno = Integer.parseInt(request.getParameter("artno"));
			System.out.println(artno);

			GetDetailModel getDetailModel = new GetDetailModel();
			entryForm = getDetailModel.getDetailByArtNum(artno);

			RequestDispatcher rd = request
					.getRequestDispatcher("StockEntry.jsp");
			request.setAttribute("artno", artno);
			request.setAttribute("entryForm", entryForm);
			rd.forward(request, response);

		} else if (button.equalsIgnoreCase("Save")) {
			System.out.println("andar aa gaya");
			String type=request.getParameter("type");
			artno = Integer.parseInt(request.getParameter("artno"));
			double rate = Double.parseDouble(request.getParameter("rate"));

			String date = request.getParameter("dt");
			System.out.println(date);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
			java.util.Date convertedDate = null;

			try {
				System.out.println("try");
				convertedDate = dateFormat.parse(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String str = dateFormat.format(convertedDate);
			String dt = new String(str);
			java.sql.Date sqlDate = java.sql.Date.valueOf(dt);
			int qty = Integer.parseInt(request.getParameter("qty"));
			String name = request.getParameter("name");
			InsertDetailModel insertDetailModel = new InsertDetailModel();

			System.out.println(artno + "" + rate + sqlDate + qty + name);
			entryForm = insertDetailModel.insert(artno, rate, sqlDate, qty,
					name,type);
			System.out.println("return");

			RequestDispatcher rdr = request
					.getRequestDispatcher("StockEntry.jsp");
			request.setAttribute("entryForm", entryForm);
			request.setAttribute("artno", artno);
			rdr.forward(request, response);

		} else if (button.equalsIgnoreCase("new record")) {
			String type=request.getParameter("type");
			System.out.println("new me aa gaya");

			artno = Integer.parseInt(request.getParameter("artno"));
			String name = request.getParameter("name");
			double rate = Double.parseDouble(request.getParameter("newrate"));
			int qty = Integer.parseInt(request.getParameter("addqty"));
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
			java.util.Date convertedDate = null;
			String date = request.getParameter("new");
			System.out.println(artno + "" + rate + "" + qty + "" + date);
			try {
				System.out.println("try");
				convertedDate = dateFormat.parse(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String str = dateFormat.format(convertedDate);
			String dt = new String(str);
			java.sql.Date sqlDate = java.sql.Date.valueOf(dt);

			System.out.println(artno + "" + rate + sqlDate + qty);

			UpdateDetailModel updateDetailModel = new UpdateDetailModel();

			System.out.println(artno + "" + rate + sqlDate + qty+""+type);
			entryForm = updateDetailModel.update(artno, rate, sqlDate, qty,name,type);
			System.out.println("return");

			RequestDispatcher rdr = request
					.getRequestDispatcher("StockEntry.jsp");
			request.setAttribute("entryForm", entryForm);
			request.setAttribute("artno", artno);
			rdr.forward(request, response);

		}

	}

}
