package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Medizin;
import com.db.DataProcess;

/**
 * Servlet implementation class InsertSyServlet
 */
@WebServlet("/InsertSyServlet")
public class InsertSyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSyServlet() {
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
		
		Medizin medizin=new Medizin();
		
		//接收数据
		request.setCharacterEncoding("utf-8");
		String zhengming=request.getParameter("zhengming");
		String yiming =request.getParameter("yiming");
		String quanpin=request.getParameter("quanpin");
		String jianpin=request.getParameter("jianpin");
		String yimingquanpin=request.getParameter("yimingquanpin");
		String yimingjianpin=request.getParameter("yimingjianpin");
		String yaoxing=request.getParameter("yaoxing");
		String leibie=request.getParameter("leibie");
		String yuanzhiwujieshao=request.getParameter("yuanzhiwujieshao");
		String shengjingfenbu=request.getParameter("shengjingfenbu");
		String caijijiagong=request.getParameter("caijijiagong");
		String sheyaoyaofang=request.getParameter("sheyaoyaofang");
		String []yaofang =request.getParameterValues("yaofang");
		
		
		for(int j=0;j<yaofang.length;j++){
			System.out.println(yaofang[j]);
		}
		DataProcess db=new DataProcess();
		String[] listName={quanpin,jianpin,yimingquanpin,yimingjianpin};
/*		for(int j=0;j<listName.length;j++){
			System.out.println(listName[j]+";");
		}*/
		String forSelect="";
		for(int i=0;i<listName.length;i++){
			if(listName[i]!=null){
				forSelect=forSelect+listName[i];
			}
			forSelect=forSelect+";";
		}
		System.out.println(forSelect);
		
		if(yaoxing.equals("yinyao")){
			yaoxing="阴药";
		}else{
			yaoxing="阳药";
		}
		
		String sql ="insert into medizin (Medizin_name,Medizin_anotherName,Medizin_property,Medizin_introduce,Medizin_distribution,Medizin_planCategory,Medizin_CollectionProcessing,Medizin_forSelect) values('"+zhengming+"','"+yiming+"','"+yaoxing+"','"+yuanzhiwujieshao+"','"+"中国"+"','"+leibie+"','"+caijijiagong+"','"+forSelect+"')";
		
		int num=db.update(sql);
		System.out.println(num);
		
		
/*		response.setCharacterEncoding("utf-8");
		PrintWriter out= response.getWriter();
		out.print("用户名:"+zhengming+"<br/>");
		out.print("密码:"+yiming+"<br/>");
		out.print("性别:"+quanpin+"<br/>");
		out.print("爱好:"+yaoxing+"<br/>");*/
		
	}

}
