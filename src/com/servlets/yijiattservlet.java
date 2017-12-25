package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DataProcess;

/**
 * Servlet implementation class yijiattservlet
 */
@WebServlet("/yijiattservlet")
public class yijiattservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public yijiattservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
        response.setContentType("text/html");  
        request.setCharacterEncoding("utf-8");  
		
		String name = (String)request.getParameter("name");
//		String quanpin = (String)request.getParameter("quanpin").trim();
//		String jianpin = (String)request.getParameter("jianpin").trim();
		String title = (String)request.getParameter("zhicheng");
		String PY = (String)request.getParameter("PY");
		String shanchang = request.getParameter("shanchang");
//		String zhuzhi = (String) request.getParameter("zhuzhi");
		String doct_info = (String)request.getParameter("grjj");
		if(name==null||name.equals("")) {
			response.sendRedirect("yijiatianjia.jsp");
			return;
		}
//		PY.append(jianpin);
//		PY.append(quanpin);
//		StringBuffer sx = new StringBuffer();
//		if(shanchang!=null) {
//			DataProcess sp = new DataProcess();
//			for(String st : shanchang) {
//				//System.out.println(st);
//			String str = sp.getData("select department_info from department where department_id = " + st).toString().replaceAll("[\\[\\]]", "");
//			//System.out.println(str);
//			sx.append(str);
//			sx.append(";");
//			}
//		}
//		if(zhuzhi!=null&&!zhuzhi.equals(""))
//		sx.append(zhuzhi+";");
		String sql="INSERT into doctor(Doctor_name,Doctor_forSelect,Doctor_introduce,Doctor_title,department_info)VALUES('"+name+"','"+PY+"','"+doct_info+"','"+title+"','"+shanchang+"');";
		DataProcess dp = new DataProcess();
		int num =  dp.update(sql);
		if(num==0) {
			System.out.println("error");
			response.sendRedirect("yijiatianjia.jsp");
			return;
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Seccessful.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
