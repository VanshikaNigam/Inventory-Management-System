package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BillModel;
import model.GenerateBill;
import model.GetDetailModel;
import model.SalesFormModel;
import model.BalanceModel;
import bean.BillForm;
import bean.EntryForm;
import bean.SalesForm;

public class CompansateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CompansateServlet() {
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
		// TODO Auto-generated method stub
		EntryForm entryForm = new EntryForm();
		int artno;
		String button = request.getParameter("btn");
		double bal = Double.parseDouble(request.getParameter("bal"));

		System.out.println(button);

		if (button.equalsIgnoreCase("Details")) {
			artno = Integer.parseInt(request.getParameter("artno"));
			System.out.println(artno);

			GetDetailModel getDetailModel = new GetDetailModel();
			entryForm = getDetailModel.getDetail(artno);

			RequestDispatcher rd = request
					.getRequestDispatcher("SaleBalance.jsp");

			SalesFormModel salesModel = new SalesFormModel();
			ArrayList<SalesForm> list = salesModel.generate();
			request.setAttribute("list", list);
			request.setAttribute("bal", bal);
			request.setAttribute("artno", artno);
			request.setAttribute("entryForm", entryForm);
			rd.forward(request, response);

		} else if (button.equalsIgnoreCase("Next")) {
			artno = Integer.parseInt(request.getParameter("artno"));
			String type = request.getParameter("type");
			double rate = Double.parseDouble(request.getParameter("rate"));

			int qty = Integer.parseInt(request.getParameter("qty"));
			double dis = Double.parseDouble(request.getParameter("dis"));
			SalesFormModel salesModel = new SalesFormModel();
			ArrayList<SalesForm> list = salesModel.generate(artno, type, rate,
					qty, dis);
			bal = new BalanceModel().balance(bal, rate, qty, dis);
			request.setAttribute("list", list);
			request.setAttribute("artno", artno);
			request.setAttribute("bal", bal);
			request.setAttribute("entryForm", null);
			RequestDispatcher rd = request
					.getRequestDispatcher("SaleBalance.jsp");
			rd.forward(request, response);

		} else if (button.equalsIgnoreCase("Generate bill")) {

			String name = request.getParameter("name");
			BillModel billModel = new BillModel();

			BillForm billForm = new BillForm();
			SalesFormModel salesModel = new SalesFormModel();
			ArrayList<SalesForm> list = salesModel.generate();
			GenerateBill genBill= new GenerateBill();
			long billno=genBill.generate();
			billForm=billModel.update(name,billno);
			double grosstotal = billForm.getGrosstotal();
			int grossqty = billForm.getGrossqty();
			System.out.println(grosstotal + " " + grossqty);
			request.setAttribute("bal", bal);
			request.setAttribute("name", name);
			request.setAttribute("billno", billno);
			request.setAttribute("list", list);
			request.setAttribute("gqty", grossqty);
			RequestDispatcher rd = request
					.getRequestDispatcher("ReturnBill.jsp");
			rd.forward(request, response);

		}

	}
}