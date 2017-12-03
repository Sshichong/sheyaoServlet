package com.beans;

import java.io.UnsupportedEncodingException;

public class MyTools {
	public static String toChinese(String  str){
		if(str==null) str="";
		try {
			str =new String(str.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			str="";
			e.printStackTrace();
		}
		return str;
	}

}
