package controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AdminModel;


/**
 * Servlet implementation class AddServlet
 */
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		System.out.println("hello");
	  
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String userid=request.getParameter("userid");
		String ques=request.getParameter("ques");
		String ans=request.getParameter("ans");
		AdminModel userModel=new AdminModel();
		boolean rs=userModel.admin(userid, username, password,ques,ans);
		System.out.println(rs);
		
		RequestDispatcher rdr = request
		.getRequestDispatcher("First.jsp");
rdr.forward(request, response);
		}
	}


