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
 * Servlet implementation class modifySuccessServlet
 */
@WebServlet("/modifySuccessServlet")
public class modifySuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifySuccessServlet() {
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
//		String[] ym = request.getParameterValues("yiming");
		String yiming=request.getParameter("yiming");
		String yaoxing = request.getParameter("yaoxing");
		String leibie = request.getParameter("leibie");
		String yuanzhiwujieshao = request.getParameter("yuanzhiwujieshao");
		String shengjingfenbu = request.getParameter("shengjingfenbu");
		String caijijiagong = request.getParameter("caijijiagong");
		String zhuyishixiang = request.getParameter("zhuyishixiang");
		String huaxuechengfen =request.getParameter("huaxuechengfen");
		String huaxuechengfencankaowenxian = request.getParameter("huaxuechengfencankaowenxian");
		String xiandailinchuangyanjiucankaowenxian =request.getParameter("xiandailinchuangyanjiucankaowenxian");
		String yaolicankaowenxian = request.getParameter("yaolicankaowenxian");
		String forSelect =request.getParameter("forSelect");
		String zhuzhiyongfa =request.getParameter("zhuzhiyongfa");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date =df.format(new Date());
		System.out.println(date);
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
	    
		System.out.println(yaoxing);
		System.out.println(leibie);
		System.out.println(forSelect);
		DataProcess data=new DataProcess();
		String sql ="select * from medizin where Medizin_name='"+zhengming+"'";
		Vector vector =data.getData(sql);
		Vector v=(Vector)vector.get(0);
		System.out.println(v);
		System.out.println(v.get(0));
		int id=Integer.parseInt((String)v.get(0));
		DataProcess data1=new DataProcess();
		String sql1="update medizin set Medizin_name='"+zhengming+"',Medizin_anotherName='"+yiming+"',Medizin_property='"+yaoxing+"',Medizin_introduce='"+yuanzhiwujieshao+"',Medizin_distribution='"+shengjingfenbu+"',Medizin_CollectionProcessing='"+caijijiagong+"',Medizin_precautions='"+zhuyishixiang+"',Medizin_ChemicalComponent='"+huaxuechengfen+"',Medizin_ReferencesChemical='"+huaxuechengfencankaowenxian+"',Medizin_ReferencesClinic='"+xiandailinchuangyanjiucankaowenxian+"',Medizin_ReferencesPharmacology='"+yaolicankaowenxian+"',Medizin_planCategory="+leibie+",Medizin_forSelect='"+forSelect+"',Medizin_date=now(),Medizin_mainUse='"+zhuzhiyongfa+"' where Medizin_ID="+id+"";
		int num=data1.update(sql1);
		if(num==1) {
			response.sendRedirect("modifysysuccess.jsp");
			System.out.println("修改成功");
		}
		
	}

}
