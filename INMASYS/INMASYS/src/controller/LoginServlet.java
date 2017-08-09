package controller;

import bean.LoginForm;
import bean.ForgotForm;
import model.LoginModel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ForgotModel;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		if (request.getParameter("btn").equalsIgnoreCase("Login")) {

			LoginForm loginForm = new LoginForm();
			HttpSession session = null;
			System.out.println("hello");

			String userid = request.getParameter("userid");
			String password = request.getParameter("password");
			LoginModel userModel = new LoginModel();
			loginForm = userModel.login(userid, password);
			if (loginForm.isCheck()) {
				session = request.getSession();
				session.setAttribute("username", loginForm.getUsername());
				session.setAttribute("userid",userid);
				response.sendRedirect("StockEntryFirst.jsp");
			} else {

				response.sendRedirect("First.jsp");
			}

		} else if (request.getParameter("btn").equalsIgnoreCase(
				"Forgot Password")) {
			String userid = request.getParameter("userid");
			System.out.println(userid);
			ForgotModel forgotModel = new ForgotModel();
			ForgotForm forgotForm = new ForgotForm();
			forgotForm = forgotModel.getQuestion(userid);
			RequestDispatcher rd = request
					.getRequestDispatcher("GetPassword.jsp");
			request.setAttribute("forgotForm", forgotForm);
			request.setAttribute("userid", userid);
			rd.forward(request, response);
		} else if (request.getParameter("btn").equalsIgnoreCase("Get Password")) {
			String userid = request.getParameter("userid");
			String ans = request.getParameter("ans");
			System.out.println(userid);
			ForgotModel forgotModel = new ForgotModel();
			ForgotForm forgotForm = new ForgotForm();
			forgotForm = forgotModel.getPassword(userid, ans);
			if (forgotForm == null) {
				RequestDispatcher rd = request
						.getRequestDispatcher("Error.jsp");
				rd.forward(request, response);
			} else {

				RequestDispatcher rd = request
						.getRequestDispatcher("GetPassword.jsp");
				request.setAttribute("forgotForm", forgotForm);
				request.setAttribute("userid", userid);
				rd.forward(request, response);
			}
		}
	}

}
