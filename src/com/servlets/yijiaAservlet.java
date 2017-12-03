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

import com.db.DataProcess;
import com.list.DataLList;
import com.list.DataList;

/**
 * Servlet implementation class yijiaAservlet
 */
@WebServlet("/yijiaAservlet")
public class yijiaAservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public yijiaAservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		String select_name = request.getParameter("select_yijia");
		//验证数据是否存在，不存在就返回主页面
		if(select_name==null||select_name.equals("")){
			response.sendRedirect("yijia.jsp");
			return;
		}
		//处理数据
				//先进性一次编码转译
				select_name = new String(select_name.getBytes("iso-8859-1"),"utf-8");
				//建立DataProcess类的对象，然后再新建一个Vector类，之后将dataprocess获取到的对象复制给vector对象
				DataProcess dataProcess  = new DataProcess();
				Vector yijia = new Vector();
				//System.out.println("select * from doctor where Doctor_name like '%"+select_name+"%' or Doctor_forSelect like '%"+select_name+"%'");
				yijia = dataProcess.getData("select * from doctor where Doctor_ID='"+select_name+"%'");
				Vector yijia_ziji = new Vector();//用来临时放置一个bingzheng的子类
				//System.out.println(yijia);
				//现在判断查询的结果有几个
				//当有多个的时候就将所有的名字都放到StringBuffer内，然后传参会主界面
				List<DataList> duogejieguo = new ArrayList<DataList>();
				if(yijia.size()>1){
					for(int i =0 ; i <yijia.size();i++){
						yijia_ziji = (Vector)yijia.get(i);
							String ss = yijia_ziji.get(0).toString();
							//System.out.println(ss);
							duogejieguo.add(new DataList(yijia_ziji.get(1).toString(),Integer.valueOf(ss)));
							//duogejieguo.append(yijia_ziji.get(1));
					}
					DataLList list = new DataLList(duogejieguo);
					request.setAttribute("yijia_name", list);
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("yijia.jsp");
					requestDispatcher.forward(request, response);			
					return;
				}
				//没有搜索到结果的时候
				if(yijia.size()==0){
					request.setAttribute("nothing", "nothing");
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("yijia.jsp");
					requestDispatcher.forward(request, response);
					return;
				}
	
				yijia_ziji = (Vector)yijia.get(0);
			//	System.out.println(yijia_ziji);
				String Doctor_name = (String)yijia_ziji.get(1);
				duogejieguo.add(new DataList(Doctor_name, Integer.valueOf((String)yijia_ziji.get(0))));
				//System.out.println(Doctor_name);
				DataLList list = new DataLList(duogejieguo);
				request.setAttribute("yijia_name", list);
				
				
				String department_id =(String)yijia_ziji.get(3);
			System.out.println(department_id);
				//	String[] dp_id = department_id.split(";");
//				StringBuffer dpinfo = new StringBuffer();
//				dpinfo.append("擅长：");
//				for(String str:dp_id) {
//				Vector dp_info = dataProcess.getData("select department_info from department where department_id = "+str);
//				dpinfo.append(dp_info.get(0).toString());
//				}
				request.setAttribute("yijia_dp", department_id);
				
				
				
				String doctor_in=(String)yijia_ziji.get(2);
				//System.out.println(doctor_in);
				request.setAttribute("yijia_in", doctor_in);
				
				String doctor_id = (String)yijia_ziji.get(0);
				Vector Pp_info_v = dataProcess.getData("SELECT Prescription_particulars from prescription WHERE Doctor_ID = "+doctor_id);
				StringBuffer Ppinfo = new StringBuffer();
				int max = Pp_info_v.size();
				for(int i= 0;i<max;i++) {
					int num = i+1;
					Ppinfo.append(num+".");
					Ppinfo.append(Pp_info_v.get(i).toString().replaceAll("[\\[\\]]", ""));
					Ppinfo.append("\r\n");
				}
				//System.out.println(Ppinfo);
				request.setAttribute("yijia_Pp", Ppinfo);
				
				
				String Doctor_title = (String)yijia_ziji.get(5);
				request.setAttribute("yijia_title", Doctor_title);
				
				
				
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("yijia.jsp");
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
