package controller;

import java.util.*;


import java.text.*;
import java.sql.*;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import bean.ReturnForm;
import model.GetModel;
import model.UpdateModel;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class StockRServlet
 */
public class StockRServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public StockRServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ReturnForm returnForm = new ReturnForm();
		
		int articleno;
		String button=request.getParameter("btn");
		System.out.println(request.getParameter("salerate"));
		
		System.out.println(button);
		
		
		if (button.equalsIgnoreCase("check")) {
			articleno = Integer.parseInt(request.getParameter("articleno"));

			GetModel getmodel = new GetModel();
			returnForm = getmodel.getArt(articleno);

			RequestDispatcher rd = request
					.getRequestDispatcher("StockReturn.jsp");
			request.setAttribute("articleno", articleno);
			request.setAttribute("returnForm", returnForm);
			rd.forward(request, response);
		}

		else if (button.equalsIgnoreCase("update")) {

			articleno = Integer.parseInt(request.getParameter("articleno"));
			double salerate = Double.parseDouble(request.getParameter("salerate"));

			String date = request.getParameter("Date2");

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

			int quantity = Integer.parseInt(request.getParameter("quanty"));
			String Name = request.getParameter("Name");
			String saleperson = request.getParameter("saleperson");
			UpdateModel updateModel = new UpdateModel();
			updateModel.update(articleno,quantity, salerate,sqlDate, saleperson,
				 Name);

			RequestDispatcher rd = request
					.getRequestDispatcher("StockReturn.jsp");
			request.setAttribute("articleno", articleno);
			request.setAttribute("returnForm", null);
			rd.forward(request, response);
		}
	}
}