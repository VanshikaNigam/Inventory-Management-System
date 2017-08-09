package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BillModel;
import model.GetDetailModel;
import model.SaleReturnModel;
import model.SalesFormModel;
import model.BalanceModel;
import bean.BillForm;
import bean.SalesForm;
import bean.SaleReturnForm;

public class SaleReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaleReturnServlet() {
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
		int artno;long billno;
		String button = request.getParameter("btn");
		artno = Integer.parseInt(request.getParameter("artno"));
		billno=Long.parseLong(request.getParameter("billno"));
		
		System.out.println(artno);
		System.out.println(billno);

		SaleReturnForm saleReturnForm=new SaleReturnForm();
		if (button.equalsIgnoreCase("Check")) {
			
			System.out.println(artno);
			System.out.println(billno);

			GetDetailModel getDetailModel = new GetDetailModel();
			saleReturnForm = getDetailModel.getDetail(artno,billno);

			RequestDispatcher rd = request
				.getRequestDispatcher("SalesReturn.jsp");
			
			
			
			SaleReturnModel salesModel = new SaleReturnModel();
			ArrayList<SaleReturnForm> list = salesModel.generate();
			request.setAttribute("list", list);
			request.setAttribute("artno", artno);
			request.setAttribute("billno", billno);
			request.setAttribute("salesForm", saleReturnForm);
			rd.forward(request, response);
			
			
			

		} else if (button.equalsIgnoreCase("add")) {
			String type= request.getParameter("type");
			double rate=Double.parseDouble(request.getParameter("prate"));
			
			int qty=Integer.parseInt(request.getParameter("qty"));
			double dis=Double.parseDouble(request.getParameter("dis"));
			System.out.println(type+""+rate+qty+dis);
			SaleReturnModel saleModel = new SaleReturnModel();
			System.out.println("All well");
			ArrayList<SaleReturnForm> list = saleModel.generate(artno,billno,type,rate,qty,dis);
			request.setAttribute("list", list);
			request.setAttribute("artno", artno);
			request.setAttribute("billno", billno);
			request.setAttribute("salesForm", null);
			RequestDispatcher rd = request.getRequestDispatcher("SalesReturn.jsp");
			rd.forward(request, response);


		} else if (button.equalsIgnoreCase("Generate balance")) {
			BalanceModel billModel=new BalanceModel();
			
			BillForm billForm=new BillForm();
			SaleReturnModel saleModel = new SaleReturnModel();
			ArrayList<SaleReturnForm> list = saleModel.generate();
			billForm=billModel.update(billno);
			double bal=billForm.getGrosstotal();
			
						
			request.setAttribute("list", null);
			request.setAttribute("billno", billno);
			request.setAttribute("bal",bal );
			request.setAttribute("entryForm", null);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("SaleBalance.jsp");
			rd.forward(request, response);

			
			
			
			
			

		} else if (button.equalsIgnoreCase("Details")) {

		}

		else if (button.equalsIgnoreCase("next")) {

		} else if (button.equalsIgnoreCase("Generate bILL")) {

		}

		// TODO Auto-generated method stub
	}

}
