package com.list;

public class DataList {
 private String Data;
 private int id;
 public DataList(String data, int id) {
		super();
		Data = data;
		this.id = id;
	}
	public DataList() {
		super();
	}
	 
public DataList(String data) {
		super();
		Data = data;
	}
public String getData() {
	return Data;
}
public void setData(String data) {
	Data = data;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

}
