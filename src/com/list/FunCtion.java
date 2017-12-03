package com.list;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class FunCtion {
com.db.DataProcess dp = null;
	public List<DataList> getList(String sq){
		List<DataList> num = new ArrayList<DataList>();
		dp = new com.db.DataProcess();
		String sql = "select * from "+sq;
		Vector result = dp.getData(sql);
		for(int i=0;i<result.size();i++) {
			String[] sf = result.get(i).toString().replaceAll("[\\[\\]]", "").split(",");
			DataList dl = new DataList(sf[1], Integer.valueOf(sf[0]));
			num.add(dl);
		}
//		for(DataList str : num)
//		System.out.println(str.getId()+str.getData());
		return num;
		
	}
	
	
	public List<DataList> getName(char sql) {
		List<DataList> num = new ArrayList<DataList>();
		dp = new com.db.DataProcess();
		Vector fh = dp.getData("select Doctor_ID,Doctor_name from doctor WHERE Doctor_forSelect like  '"+sql+"%'");
		for(int i = 0;i<fh.size();i++) {
			String[] str=fh.get(i).toString().replaceAll("[\\[\\]]", "").replaceAll(" ", "").split(",");
			if(str!=null) {
			DataList da = new DataList(str[1],Integer.valueOf(str[0]));
			num.add(da);}
		}
		//if(!ff.equals("")) {
		//sk = ff.replaceAll(" ", "").split(",");
			//}
		if(num.size()==0) {return null;}
		return num;
	}
	
	
	
	public static void main(String[] args) {
		FunCtion fc = new FunCtion();
		for(DataList str:fc.getName('a'))
		System.out.println(str.getData());
	}
	
}
