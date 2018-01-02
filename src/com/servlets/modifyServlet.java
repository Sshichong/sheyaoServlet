package com.servlets;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Medizin;
import com.db.DataProcess;

/**
 * Servlet implementation class modifyServlet
 */
@WebServlet("/modifyServlet")
public class modifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String selectName=request.getParameter("select");
		selectName = new String(selectName.getBytes("iso-8859-1"),"utf-8");
		System.out.println(selectName);
		
		DataProcess data=new DataProcess();
		String sql ="select * from medizin where Medizin_name='"+selectName+"'";
		Vector vector =data.getData(sql);
		Vector medizin =(Vector)vector.get(0);
		Medizin m =new Medizin();
		m.setMedizin_name((String)medizin.get(1));
		m.setMedizin_anotherName((String)medizin.get(2));
		m.setMedizin_property((String)medizin.get(3));
		m.setMedizin_introduce((String)medizin.get(4));
		m.setMedizin_distribution((String)medizin.get(5));
		m.setMedizin_collectionProcessing((String)medizin.get(6));
		m.setMedizin_planCategory((String)medizin.get(13));
		m.setMedizin_plantSeed((String)medizin.get(14));
		m.setMedizin_plantJuvenile((String)medizin.get(15));
		m.setMedizin_plantAdult((String)medizin.get(16));
		m.setMedizin_date((String)medizin.get(20));
		m.setMedizin_deleteTag((String)medizin.get(21));
		m.setMedizin_deleteReason((String)medizin.get(22));
		m.setMedizin_mainUse((String)medizin.get(23));
		request.setAttribute("medizin", m);
		String yaoxing="";
		/*if(medizin.get(3).equals("“ı“©")) {
			yaoxing="0";
		}else {
			yaoxing="1";
		}*/
		request.setAttribute("yaoxing", yaoxing);
		RequestDispatcher dispatcher =request.getRequestDispatcher("modifysheyao.jsp");
		dispatcher.forward(request, response);
	}

}
