package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SaleArtModel;
import bean.EntryForm;


/**
 * Servlet implementation class SaleArtServlet
 */
public class SaleArtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleArtServlet() {
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
		//EntryForm entr=new EntryForm();
		int artno =Integer.parseInt(request.getParameter("artno"));
		System.out.println("list");
		SaleArtModel saleart=new SaleArtModel();
		 ArrayList<EntryForm> list= saleart.getAList(artno);
		 request.setAttribute("list", list);
		 RequestDispatcher rd=request.getRequestDispatcher("SlByArticle.jsp");
		 rd.forward(request, response);
	}

}
