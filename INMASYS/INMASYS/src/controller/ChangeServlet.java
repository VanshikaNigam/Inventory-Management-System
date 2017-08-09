package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.ChangeForm;
import javax.servlet.RequestDispatcher;
import model.ChangeModel;

/**
 * Servlet implementation class ChangeServlet
 */

public class ChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeServlet() {
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
		ChangeForm changeform=new ChangeForm();
		
		String currentpassword=request.getParameter("password");
		String newpassword=request.getParameter("newpass");
		String cnpassword=request.getParameter("conpass");
		String ques=request.getParameter("ques");
		String ans=request.getParameter("ans");
		String userid=request.getParameter("userid");
		ChangeModel changemodel=new ChangeModel();
		boolean checked=changemodel.checkit(currentpassword);
		if(checked)
		{
			changemodel.changeit(currentpassword,newpassword,cnpassword,ques,ans,userid);
			RequestDispatcher rd = request
					.getRequestDispatcher("Redirect.jsp");
			rd.forward(request, response);
			
			
		}else {
			
			response.sendRedirect("Change.jsp");
		}
		
		}
		
		}


