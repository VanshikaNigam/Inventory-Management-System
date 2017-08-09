package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.EntryForm;



import model.StockReportArtmodel;

import java.util.*;



public class StockReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StockReportServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param artno
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response, Object artno)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		//EntryForm a = new EntryForm();
		int artno = Integer.parseInt(request.getParameter("artno"));
		
			System.out.println("artno:"+ artno );
			StockReportArtmodel stockReportArtModel = new StockReportArtmodel();
			ArrayList<EntryForm> list = stockReportArtModel.getUserList(artno);
			System.out.println(artno);
			request.setAttribute("list", list);
			RequestDispatcher rd = request
					.getRequestDispatcher("StrByArticle.jsp");
			rd.forward(request, response);
			// TODO Auto-generated method stub

		

		// TODO Auto-generated method stub
	}

}
