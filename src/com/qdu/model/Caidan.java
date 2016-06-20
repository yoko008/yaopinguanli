package com.qdu.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Caidan implements Serializable {
    private int id;
    private String juese;
    private String caidan;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJuese() {
		return juese;
	}
	public void setJuese(String juese) {
		this.juese = juese;
	}
	public String getCaidan() {
		return caidan;
	}
	public void setCaidan(String caidan) {
		this.caidan = caidan;
	}
   
    
    
}
