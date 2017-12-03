package com.beans;

import java.io.UnsupportedEncodingException;

public class ZhuanyiChinese {
	static public String changeChinese(String chineseCode){
		if(chineseCode==null)
			chineseCode="";
		
		try {
			chineseCode = new String(chineseCode.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return chineseCode;
	}

}
