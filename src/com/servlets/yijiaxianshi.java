package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.pinyinTool;
import com.db.DataProcess;

/**
 * Servlet implementation class yijiaxianshi
 */
@WebServlet("/yijiaxianshi")
public class yijiaxianshi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public yijiaxianshi() {
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
        pinyinTool py=new pinyinTool();
		String name = (String)request.getParameter("name").trim();
		String title = (String)request.getParameter("zhicheng").trim();
		String[] shanchang = request.getParameterValues("shanchang");
		//String zhuzhi = (String) request.getParameter("zhuzhi").trim();
		String doct_info = (String)request.getParameter("grjj").trim();
//		String qp = (String)request.getParameter("quanpin").replace(" ", "");
//		String jp = (String)request.getParameter("jianpin").replace(" ", "");
		StringBuffer sx = new StringBuffer();
		String qp=py.cn2Spell(name);
		String jp=py.cn2FirstSpell(name);
		String PY = qp+";"+jp+";";
		if(shanchang!=null) {
			DataProcess sp = new DataProcess();
			for(String st : shanchang) {
				//System.out.println(st);
//			String str = sp.getData("select department_info from department where department_id = " + st).toString().replaceAll("[\\[\\]]", "");
			//System.out.println(str);
			sx.append(st);
			sx.append(";");
			}
		}
//		if(zhuzhi!=null&&!zhuzhi.equals(""))
//			sx.append(zhuzhi+";");
		request.setAttribute("name", name);
		request.setAttribute("zhicheng", title);
		request.setAttribute("shanchang", sx);
		request.setAttribute("grjj", doct_info);
		request.setAttribute("PY", PY);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("yijiaxs.jsp");
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
