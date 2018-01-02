package com.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DataProcess;

/**
 * Servlet implementation class deletesyServlet
 */
@WebServlet("/deletesyServlet")
public class deletesyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletesyServlet() {
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
		request.setCharacterEncoding("utf-8");
		String zhengming = request.getParameter("zhengming");
		String reason =request.getParameter("reason");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date =df.format(new Date());
		System.out.println(date);
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
	    
		
		DataProcess data=new DataProcess();
		String sql ="select * from medizin where Medizin_name='"+zhengming+"'";
		Vector vector =data.getData(sql);
		Vector v=(Vector)vector.get(0);
		System.out.println(v);
		System.out.println(v.get(0));
		int id=Integer.parseInt((String)v.get(0));
		DataProcess data1=new DataProcess();
		String sql1="update medizin set Medizin_deleteReason ='"+reason +"',Medizin_deleteTag='不可用' where Medizin_ID="+id+"";
		int num=data1.update(sql1);
		if(num==1) {
			response.sendRedirect("deletesysuccess.jsp");
			System.out.println("修改成功");
		}
	}

}
