package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Medizin;
import com.beans.pinyinTool;

/**
 * Servlet implementation class medicineCheckServlet
 */
@WebServlet("/medicineCheckServlet")
public class medicineCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public medicineCheckServlet() {
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
		//接收数据
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String zhengming = request.getParameter("zhengming");
		String[] ym = request.getParameterValues("yiming");
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
		String zhuzhiyongfa =request.getParameter("zhuzhiyongfa");
		
		System.out.println(leibie);
		//处理数据
		pinyinTool py =new pinyinTool();
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

		}
		
		//类别处理
		String lb="";
		if(leibie.equals("2")) {
			lb="菌类植物";
		}else if(leibie.equals("3")) {
			lb="地衣苔藓类植物";
		}else if(leibie.equals("5")) {
			lb="蕨类植物";
		}else if(leibie.equals("6")) {
			lb="裸子植物";
		}else if(leibie.equals("7")) {
			lb="双子叶植物";
		}
		/*switch(leibie){
		case "2":
			lb="蕨类植物";
			break;
		case "3":
			lb="地衣苔藓类植物";
			break;
		case "5":
			lb="蕨类植物";
			break;
		case "6":
			lb="裸子植物";
			break;
		case "7":
			lb="双子叶植物";
			break;
		default:
				break;
		}*/
		System.out.println(lb);
		
		
		Medizin medizin=new Medizin();
		medizin.setMedizin_name(zhengming);
		medizin.setMedizin_anotherName(yiming);
		medizin.setMedizin_property(yaoxing);
		medizin.setMedizin_planCategory(leibie);
		medizin.setMedizin_introduce(yuanzhiwujieshao);
		medizin.setMedizin_collectionProcessing(caijijiagong);
		medizin.setMedizin_distribution(shengjingfenbu);
		medizin.setMedizin_precautions(zhuyishixiang);
		medizin.setMedizin_chemicalComponent(huaxuechengfen);
		medizin.setMedizin_referencesChemical(huaxuechengfencankaowenxian);
		medizin.setMedizin_referencesClinic(xiandailinchuangyanjiucankaowenxian);
		medizin.setMedizin_referencesPharmacology(yaolicankaowenxian);
		medizin.setMedizin_forSelect(forSelect.toString());
		medizin.setMedizin_mainUse(zhuzhiyongfa);
		
		request.setAttribute("medizin", medizin);
		request.setAttribute("lb",lb );
		RequestDispatcher dispatcher =request.getRequestDispatcher("medizinCheck.jsp");
		dispatcher.forward(request, response);
		
		
		
	}

}
