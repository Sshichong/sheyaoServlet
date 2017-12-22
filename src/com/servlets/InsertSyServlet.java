package com.servlets;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Medizin;
import com.beans.MyTools;
import com.db.DataProcess;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.test.pinyinTestDuozi;

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
		
		SmartUpload smartupload = new SmartUpload();
		pinyinTestDuozi py=new pinyinTestDuozi();
		DataProcess db=new DataProcess();
		//设置编码方式
		//request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String yuanzhiwujiesha=request.getParameter("yuanzhiwujieshao");
		//接受图片信息
		try{
			smartupload.setTotalMaxFileSize(4000*1024);       // 设置上传的文件大小
			smartupload.setMaxFileSize(4000*1024);
 
			smartupload.initialize(this.getServletConfig(),request,response);	// 初始化上传
			smartupload.upload();					// 准备上传
				
			String new_image=""; // 设置完整的图片名称

			String lj="";
	
		if(smartupload.getFiles().getSize()>0){
			//定义图片名称为随机数+后缀
			String image = UUID.randomUUID() + "." + smartupload.getFiles().getFile(0).getFileExt() ;
			lj=image;
			//获取当前日历
			Calendar date=Calendar.getInstance();	
			
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
 
			String name=format.format(date.getTime());
			
			String[] s = name.split("-");
			//定义文件，将文件按日历分层
			File file=new File("d:/"+s[0]+"/"+s[1]+"/"+s[2]);
			
			if(!file.exists()){
			
				file.mkdirs();
			}else{
				
				file.delete();
				file.mkdirs();
			}
			
			new_image =  file.getPath() + "\\" + image;
			
			//保存文件
			smartupload.getFiles().getFile(0).saveAs(new_image) ;
			System.out.println(image);
			
			System.out.println(new_image);
		}
		//接收数据
		String zhengming = new String(smartupload.getRequest().getParameter("zhengming").trim().getBytes(),"utf-8");
		String yiming = new String(smartupload.getRequest().getParameter("yiming").trim().getBytes(),"utf-8");
		String yaoxing = new String(smartupload.getRequest().getParameter("yaoxing").trim().getBytes(),"utf-8");
		String leibie = new String(smartupload.getRequest().getParameter("leibie").trim().getBytes(),"utf-8");
		String yuanzhiwujieshao = new String(smartupload.getRequest().getParameter("yuanzhiwujieshao").trim().getBytes(),"utf-8");
		String shengjingfenbu = new String(smartupload.getRequest().getParameter("shengjingfenbu").trim().getBytes(),"utf-8");
		String caijijiagong = new String(smartupload.getRequest().getParameter("caijijiagong").trim().getBytes(),"utf-8");
		String zhuyishixiang = new String(smartupload.getRequest().getParameter("zhuyishixiang").trim().getBytes(),"utf-8");
		String huaxuechengfen = new String(smartupload.getRequest().getParameter("huaxuechengfen").trim().getBytes(),"utf-8");
		String huaxuechengfencankaowenxian = new String(smartupload.getRequest().getParameter("huaxuechengfencankaowenxian").trim().getBytes(),"utf-8");
		String xiandailinchuangyanjiucankaowenxian = new String(smartupload.getRequest().getParameter("xiandailinchuangyanjiucankaowenxian").trim().getBytes(),"utf-8");
		String yaolicankaowenxian = new String(smartupload.getRequest().getParameter("yaolicankaowenxian").trim().getBytes(),"utf-8");
		
		
		System.out.println(zhengming);
		System.out.println(yiming);
		//处理数据
		String zmqp=py.ToFirstChar(zhengming);
		String zmjp=py.ToPinyin(zhengming);
		String ymqp=py.ToFirstChar(yiming);
		String ymjp=py.ToPinyin(yiming);
		String [] a ={zmqp,zmjp,ymqp,ymjp};
		String forSelect="";
		for(int i=0;i<a.length;i++){
			if(!forSelect.equals("")){
				forSelect+=";";
			}
			forSelect+=a[i];
		}
		
		if(yaoxing.equals("yinyao")){
			yaoxing="阴药";
		}else{
			yaoxing="阳药";
		}
		
		String sql ="insert into medizin (Medizin_name,Medizin_anotherName,Medizin_property,Medizin_introduce,Medizin_distribution,Medizin_CollectionProcessing,Medizin_disease,Medizin_precautions,Medizin_ChemicalComponent,Medizin_ReferencesChemical,Medizin_ReferencesClinic,Medizin_ReferencesPharmacology,Medizin_planCategory,Medizin_plantSeed,Medizin_plantJuvenile,Medizin_plantAdult,Medizin_plantWilting,Medizin_plantImg,Medizin_forSelect) values('"+zhengming+"','"+yiming+"','"+yaoxing+"','"+yuanzhiwujieshao+"','"+shengjingfenbu+"','"+caijijiagong+"','1','"+zhuyishixiang+"','"+huaxuechengfen+"','"+huaxuechengfencankaowenxian+"','"+xiandailinchuangyanjiucankaowenxian+"','"+yaolicankaowenxian+"','"+leibie+"','"+lj+"','"+lj+"','"+lj+"','"+lj+"','"+lj+"','"+forSelect+"')";
		
		System.out.println(zhengming+yiming+yaoxing+leibie+yuanzhiwujieshao+shengjingfenbu+caijijiagong+forSelect+lj);
		int num=db.update(sql);
		System.out.println(num);
		if(num == 1){
			//成功则返回查询页面
			request.getRequestDispatcher("sheyao_tianjia.jsp").forward(request, response);
		}
		
		/*String sheyaoyaofang=request.getParameter("sheyaoyaofang");
		String []yaofang =request.getParameterValues("yaofang");
		
	    
	    
		for(int j=0;j<yaofang.length;j++){
			System.out.println(yaofang[j]);
		}
		*/
		
		
		
		
		
		
/*		response.setCharacterEncoding("utf-8");
		PrintWriter out= response.getWriter();
		out.print("用户名:"+zhengming+"<br/>");
		out.print("密码:"+yiming+"<br/>");
		out.print("性别:"+quanpin+"<br/>");
		out.print("爱好:"+yaoxing+"<br/>");*/
		
		
		}catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
}
}
