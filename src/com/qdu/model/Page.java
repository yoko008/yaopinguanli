package com.qdu.model;

public class Page {
    private int currpage;
    private int newpage;
    private int oldpage;
    private int pagenum;
    private int listnum;
    private int pagelistnum;
    private int startnum;
    private String keyword;
    
    
    
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getStartnum() {
		return startnum;
	}
	public void setStartnum(int startnum) {
		this.startnum = startnum;
	}
	public int getCurrpage() {
		return currpage;
	}
	public void setCurrpage(int currpage) {
		this.currpage = currpage;
	}
	public int getNewpage() {
		return newpage;
	}
	public void setNewpage(int newpage) {
		this.newpage = newpage;
	}
	public int getOldpage() {
		return oldpage;
	}
	public void setOldpage(int oldpage) {
		this.oldpage = oldpage;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getListnum() {
		return listnum;
	}
	public void setListnum(int listnum) {
		this.listnum = listnum;
	}
	public int getPagelistnum() {
		return pagelistnum;
	}
	public void setPagelistnum(int pagelistnum) {
		this.pagelistnum = pagelistnum;
	}
    
    
}
