package com.servlets;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Bingzheng;
import com.beans.MessInfo;
import com.beans.ZhuanyiChinese;
import com.db.DataProcess;

/**
 * Servlet implementation class bztianjia
 */
@WebServlet("/Bztianjia")
public class Bztianjia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bztianjia() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Bingzheng bz = new Bingzheng();
		MessInfo messInfo = new MessInfo();
		
		//接受数据
		String bzName = request.getParameter("name");
		String bzQP = request.getParameter("quanpin");
		String bzKs = request.getParameter("keshi");
		String bzJp = request.getParameter("jianpin");
		String bzJj = request.getParameter("gzjj");
		
		
		
		String bzFZ = request.getParameter("textForChuanshu");
		//没有写病症药方的获取（由于药方添加未完成）
		
		
		//验证数据
		if(bzName==null||bzName.equals("")||bzJp==null||bzJp.equals("")||bzJj==null||bzJj.equals("")||bzKs==null||bzKs.equals("")||bzQP==null||bzQP.equals("")){
			messInfo.setMess("请输入完整信息");
			request.setAttribute("messInfo", messInfo);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("bingzhengtianjia.jsp");
			requestDispatcher.forward(request, response);
			return;
		}
		
		System.out.println(bzQP+" "+bzJp);
		
		//处理数据
		//转译中文字符
		bzName = ZhuanyiChinese.changeChinese(bzName);
		bzQP = ZhuanyiChinese.changeChinese(bzQP);
		bzKs = ZhuanyiChinese.changeChinese(bzKs);
		bzJp = ZhuanyiChinese.changeChinese(bzJp);
		bzJj = ZhuanyiChinese.changeChinese(bzJj);
		bzQP = bzQP.replace(" ", "");
		bzJp = bzJp.replace(" ", "");
		
		
		DataProcess dataProcess  = new DataProcess();
		
		
		if(bzFZ!=null||!bzFZ.equals("")){
			
		bzFZ = ZhuanyiChinese.changeChinese(bzFZ);
		String[] aa = bzFZ.split(";");
		
		
		
		Vector x1 = new Vector();
		Vector x2 = new Vector();
		StringBuffer fangzis = new StringBuffer();
 		for(int i =0 ; i < aa.length;i++){
			x1 = dataProcess.getData("select Prescription_ID from prescription where Prescription_particulars like '"+aa[i].trim()+"'");
			if(x1.size()==0){
				continue;
			}
			x2 = (Vector)x1.get(0);
			fangzis = fangzis.append((String)x2.get(0)+";");
			System.out.println(fangzis);
		}
 		dataProcess.update("insert into disease(Disease_name,Disease_department,Disease_introduce,Disease_treatment,Disease_forSelect) values ('"+bzName+"' ,'"+bzKs+"' , '"+bzJj+"' ,'"+fangzis.toString()+"','"+bzQP+";"+bzJp+"')");
 		response.sendRedirect("bzsuccess.jsp");
 		return;
		
		}
		
		//向数据库写入数据
		
		dataProcess.update("insert into disease(Disease_name,Disease_department,Disease_introduce,Disease_forSelect) values ('"+bzName+"' ,'"+bzKs+"' , '"+bzJj+"' ,'"+bzQP+";"+bzJp+"')");
		
		response.sendRedirect("bingzheng.jsp");
		
	

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
