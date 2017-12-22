package com.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Medizin;
import com.beans.MessInfo;
import com.db.DataProcess;

/**
 * Servlet implementation class QueryServlet
 */
@WebServlet("/QueryServlet")
public class QueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryServlet() {
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
		//request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String selectName=request.getParameter("select");
		
		MessInfo messInfo =new MessInfo();
		//验证数据
		//没有值
		if(selectName==null||selectName.equals("")){
			response.sendRedirect("sheyao.jsp");
			return ;
		}
		
		//转码
		selectName = new String(selectName.getBytes("iso-8859-1"),"utf-8");/*<!-- 此句一出，selectName与数据库匹配成乱码 -->*/
		System.out.println(selectName);
		DataProcess data=new DataProcess();
		String sql ="select * from medizin where Medizin_name like '%"+selectName+"%' or Medizin_forSelect like '%"+selectName+"%'or Medizin_anotherName like '%"+selectName+"%'";
		Vector medizin=new Vector();
		Vector medizin_ziji=new Vector();
		medizin =data.getData(sql);
		if(medizin.size()==0){
			messInfo.setMess("没有查询到结果！请核对后输入！");
			request.setAttribute("messInfo", messInfo);
			RequestDispatcher dispatcher =request.getRequestDispatcher("sheyao.jsp");
			dispatcher.forward(request, response);
			return;
		}
		else if(medizin.size()>1){
			List<Medizin> list =new ArrayList<Medizin>();
			for(int i=0;i<medizin.size();i++){
				Medizin m =new Medizin();
				
				medizin_ziji=(Vector)medizin.get(i);
				m.setMedizin_name((String)medizin_ziji.get(1));
				m.setMedizin_anotherName((String)medizin_ziji.get(2));
				m.setMedizin_property((String)medizin_ziji.get(3));
				m.setMedizin_introduce((String)medizin_ziji.get(4));
				m.setMedizin_distribution((String)medizin_ziji.get(5));
				m.setMedizin_collectionProcessing((String)medizin_ziji.get(6));
				m.setMedizin_plantSeed((String)medizin_ziji.get(14));
				m.setMedizin_plantJuvenile((String)medizin_ziji.get(15));
				m.setMedizin_plantAdult((String)medizin_ziji.get(16));
				list.add(m);
				//System.out.println(m.getMedizin_plantSeed());
			}
			messInfo.setMess("查到以下相关畲药！");
			request.setAttribute("messInfo", messInfo);
			request.setAttribute("duotiaojilu", list);
			RequestDispatcher dispatcher =request.getRequestDispatcher("sheyao_duoge.jsp");
			dispatcher.forward(request, response);
			
		}else {
			
			List<Medizin> list =new ArrayList<Medizin>();
			Medizin m=new Medizin();
			medizin_ziji =(Vector)medizin.get(0);
			m.setMedizin_name((String)medizin_ziji.get(1));
			m.setMedizin_anotherName((String)medizin_ziji.get(2));
			m.setMedizin_property((String)medizin_ziji.get(3));
			m.setMedizin_introduce((String)medizin_ziji.get(4));
			m.setMedizin_distribution((String)medizin_ziji.get(5));
			m.setMedizin_collectionProcessing((String)medizin_ziji.get(6));
			m.setMedizin_plantSeed((String)medizin_ziji.get(14));
			m.setMedizin_plantJuvenile((String)medizin_ziji.get(15));
			m.setMedizin_plantAdult((String)medizin_ziji.get(16));
			list.add(m);
			
			request.setAttribute("yitiaojilu", list);
			
			RequestDispatcher dispatcher =request.getRequestDispatcher("sheyao.jsp");
			dispatcher.forward(request, response);
		}
		/*System.out.println(medizin.toString());
		Vector medizin_ziji=new Vector();
		//System.out.println("1111");
		//System.out.println(m.size());
		//判断是否有值
		if(medizin.size()==1){
			count=0;
			System.out.println("1111");
			Medizin m =new Medizin();
			medizin_ziji=(Vector)medizin.get(0);
			
			m.setMedizin_name((String) medizin_ziji.get(1));
			m.setMedizin_anotherName((String) medizin_ziji.get(2));
			m.setMedizin_introduce((String) medizin_ziji.get(4));
			
			request.setAttribute("count", count);
			request.setAttribute("medizin", m);
			//System.out.println(medizin.getMedizin_name());
			RequestDispatcher dispatcher =request.getRequestDispatcher("sheyao.jsp");
			dispatcher.forward(request, response);
			return ;
			
		}
		if(medizin.size()>1){
			count=1;
			StringBuffer duogejieguo = new StringBuffer();
			for(int i=0;i<medizin.size();i++){
				medizin_ziji=(Vector)medizin.get(i);
				if(i==medizin.size()-1){
					duogejieguo.append(medizin_ziji.get(1));
					continue;
				}
				
				duogejieguo.append(medizin_ziji.get(1)+";");
			}
			request.setAttribute("count", count);
			request.setAttribute("medizin_names", duogejieguo.toString());
			System.out.println(duogejieguo.toString());
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("sheyao.jsp");
			requestDispatcher.forward(request, response);			
			return;
		}
		*/
		
		
	}

}




