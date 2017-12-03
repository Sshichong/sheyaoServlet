package com.servlets;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.parser.diagnose.DiagnoseParser;

import com.beans.Bingzheng;
import com.beans.Message;
import com.db.DataProcess;

/**
 * Servlet implementation class select_bingzheng
 */
/**
 * @author s
 *
 */
@WebServlet("/Select_bingzheng")
public class Select_bingzheng extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Select_bingzheng() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//��ȡ��ѯֵ
		String select_name = request.getParameter("select_chaxunbingzheng");
		String select_id = request.getParameter("select_id");
		
		Message message = new Message();//����һ����ʾ��
		Bingzheng bz = new Bingzheng();//����һ����֢����
		
		
		
		
		
		
		//�����������������ID��ʱ��ִ�����²�����return��
				if(select_id!=null&&!select_id.equals("")){
					DataProcess dataProcess  = new DataProcess();
					Vector id_big_v = dataProcess.getData("select * from disease where Disease_ID like "+select_id+"");
					Vector id_small_v = (Vector)id_big_v.get(0);					
					
					
					bz.setBzID((String)id_small_v.get(0));
					bz.setBzName((String)id_small_v.get(1));
					bz.setBzKeshi((String)id_small_v.get(2));
					switch (bz.getBzKeshi()) {
					case "1":
						bz.setBzKeshi("�ڿ�");
						break;
					case "2":
						bz.setBzKeshi("���");
						break;
					case "3":
						bz.setBzKeshi("����");
						break;
					case "4":
						bz.setBzKeshi("����");
						break;
					case "5":
						bz.setBzKeshi("��ٿ�");
						break;
					case "6":
						bz.setBzKeshi("���˿�");
						break;
					default:
						break;
					}
					bz.setBzJieshao((String)id_small_v.get(3));
					
					
					
					
					String disease_treat = (String)id_small_v.get(4);
					
					StringBuffer fangzis = new StringBuffer();
					if(disease_treat!=null&&!disease_treat.equals("")){
						String[] fangzi = disease_treat.split(";");
						Vector big = new Vector();
						Vector small = new Vector();
						System.out.println(fangzi);
						for(int i = 0 ;  i <fangzi.length ; i++){
							big = dataProcess.getData("select Prescription_particulars from Prescription where Prescription_ID like '"+fangzi[i]+"'");
							small = (Vector)big.get(0);
							if(i==fangzi.length-1){
								fangzis.append(small.get(0).toString());
								continue;
							}
							fangzis.append(small.get(0).toString()+";");
							}
							bz.setBzZhiliao(fangzis.toString());
							System.out.println(bz.getBzZhiliao());
					}
					request.setAttribute("bingzheng", bz);
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("bingzheng.jsp");
					requestDispatcher.forward(request, response);
					return;
		 		}
		
				//��֤�����Ƿ���ڣ������ھͷ�����ҳ��
				if(select_name==null||select_name.equals("")){
					message.setMess("�����������������Ҫ��ѯ�Ĳ�֢��");
					//�������û���κ����ݶ������������ť��ʱ��     ����ʾ��Ϣ������֢ҳ��
					request.setAttribute("message", message);
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("bingzheng.jsp");
					requestDispatcher.forward(request, response);
					return;
				}
	
		
		
		
		
		
		
		
		
		
		
		//��������
		//�Ƚ���һ�α���ת��
		select_name = new String(select_name.getBytes("iso-8859-1"),"utf-8");
		//����DataProcess��Ķ���Ȼ�����½�һ��Vector�֮࣬��dataprocess��ȡ���Ķ����Ƹ�vector����
		DataProcess dataProcess  = new DataProcess();
		Vector bingzheng = new Vector();
		
		bingzheng = dataProcess.getData("select * from disease where Disease_name like '%"+select_name+"%' or Disease_forSelect like '%"+select_name+"%'");
		Vector bingzheng_ziji = new Vector();//������ʱ����һ��bingzheng������
		System.out.println(select_name);
		System.out.println(bingzheng);
		//�����жϲ�ѯ�Ľ���м���
		
		
		
		//���ж����ʱ��ͽ����е����ֶ��ŵ�StringBuffer�ڣ�Ȼ�󴫲ε������֢�Ľ���
		if(bingzheng.size()>1){
			StringBuffer duogejieguo = new StringBuffer();
			
			for(int i =0 ; i <bingzheng.size();i++){
				bingzheng_ziji = (Vector)bingzheng.get(i);
				if(i==bingzheng.size()-1){
					duogejieguo.append(bingzheng_ziji.get(1));
					continue;
				}
				
				duogejieguo.append(bingzheng_ziji.get(1)+";");
			}
			request.setAttribute("bingzheng_names", duogejieguo.toString());
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("bingzheng_duoge.jsp");
			requestDispatcher.forward(request, response);			
			return;
		}
		//û�������������ʱ��
		if(bingzheng.size()==0){
			message.setMess("û������ҵ����ݣ���˶Ժ����룡");
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("bingzheng.jsp");
			requestDispatcher.forward(request, response);
			return;
		}

		
		
		//��ֻ��Ψһ��֢��ʱ�򣬴�����Ӧ�Ĳ���
		bingzheng_ziji = (Vector)bingzheng.get(0);
		bz.setBzID((String)bingzheng_ziji.get(0));
		bz.setBzName((String)bingzheng_ziji.get(1));
		bz.setBzKeshi((String)bingzheng_ziji.get(2));
		switch (bz.getBzKeshi()) {
		case "1":
			bz.setBzKeshi("�ڿ�");
			break;
		case "2":
			bz.setBzKeshi("���");
			break;
		case "3":
			bz.setBzKeshi("����");
			break;
		case "4":
			bz.setBzKeshi("����");
			break;
		case "5":
			bz.setBzKeshi("��ٿ�");
			break;
		case "6":
			bz.setBzKeshi("���˿�");
			break;
		default:
			break;
		}
		bz.setBzJieshao((String)bingzheng_ziji.get(3));
		
		String disease_treat = (String)bingzheng_ziji.get(4);
		String[] fangzi = disease_treat.split(";");
		
		Vector big = new Vector();
		Vector small = new Vector();
		StringBuffer fangzis = new StringBuffer();
		for(int i = 0 ;  i <fangzi.length ; i++){
			big = dataProcess.getData("select Prescription_particulars from Prescription where Prescription_ID like '"+fangzi[i]+"'");
			small = (Vector)big.get(0);
			if(i!=fangzi.length-1){
				fangzis.append(small.get(0).toString()+";");
				continue;
			}
			fangzis.append(small.get(0).toString()+";");
			
		}
		bz.setBzZhiliao(fangzis.toString());
		
		request.setAttribute("bingzheng", bz);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("bingzheng.jsp");
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
