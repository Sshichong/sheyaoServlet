package com.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DataProcess;

/**
 * Servlet implementation class InsertSyServlet1
 */
@WebServlet("/InsertSyServlet1")
public class InsertSyServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSyServlet1() {
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
		/*pinyinTool py =new pinyinTool();
		StringBuffer forSelect=new StringBuffer();
		String zmqp=py.cn2Spell(zhengming);
		String zmjp=py.cn2FirstSpell(zhengming);
		forSelect.append(zmqp);
		forSelect.append(";");
		forSelect.append(zmjp);
		forSelect.append(";");
		if(yaoxing.equals("yinyao")){
			yaoxing="阴药";
		}else{
			yaoxing="阳药";
		}
		
		String yiming="";
		if(ym==null) {
			forSelect.append(yiming);
		}
		else {
		for(int j=0;j<ym.length;j++) {
			yiming+=ym[j];
			yiming+=";";
		}
		
		String ym1[]= yiming.split(";");

		for(int i=0;i<ym.length;i++) {
			ym[i]=py.cn2Spell(ym[i]);
			forSelect.append(ym[i]);
			forSelect.append(";");

			
		}
		for(int j=0;j<ym1.length;j++) {
			ym1[j]=py.cn2FirstSpell(ym1[j]);
			forSelect.append(ym1[j]);
			forSelect.append(";");
		}

		}*/
		
		DataProcess data=new DataProcess();
		String sql ="insert into medizin (Medizin_name,Medizin_anotherName,Medizin_property,Medizin_introduce,Medizin_distribution,Medizin_CollectionProcessing,Medizin_disease,Medizin_precautions,Medizin_ChemicalComponent,Medizin_ReferencesChemical,Medizin_ReferencesClinic,Medizin_ReferencesPharmacology,Medizin_planCategory,Medizin_forSelect,Medizin_date,Medizin_mainUse) values('"+zhengming+"','"+yiming+"','"+yaoxing+"','"+yuanzhiwujieshao+"','"+shengjingfenbu+"','"+caijijiagong+"','1','"+zhuyishixiang+"','"+huaxuechengfen+"','"+huaxuechengfencankaowenxian+"','"+xiandailinchuangyanjiucankaowenxian+"','"+yaolicankaowenxian+"',"+leibie+",'"+forSelect+"',now(),'"+zhuzhiyongfa+"')";
		int num=data.update(sql);
		if(num == 1){
			response.sendRedirect("insertsysuccess.jsp");
			//成功则返回查询页面
//			request.getRequestDispatcher("sheyao_tianjia.jsp").forward(request, response);
		}
		if(num==0) {
			System.out.println("error");
			response.sendRedirect("sheyao_tianjia.jsp");
			return;
		}
	}

}
