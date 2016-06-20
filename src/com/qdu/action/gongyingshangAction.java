/*
 * 源代码，版权归taoyao所有。
 * 
 * 项目名称 : Drug management system
 * 创建日期 : 2016年2月28日
 * 修改历史 : 
 *     1. [2016年2月28日]创建文件 by Administrator
 */
package com.qdu.action;


import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.qdu.model.Gongyingshang;
import com.qdu.model.Page;
import com.qdu.model.Zhigong;
import com.qdu.model.userInfo;
import com.qdu.service.gongyingshangService;
import com.qdu.service.userService;
import com.qdu.service.zhigongService;


/**!
 * //TODO 添加类/接口功能描述
 * @author Administrator
 */
@SuppressWarnings("serial")
public class gongyingshangAction extends ActionSupport{
    public gongyingshangService gongyingshangservice=null;
    public String state=null;
    public Page page;
    public Gongyingshang gongyingshang;
    public List<Gongyingshang> gongyingshangList;
    
    public String searchGYS(){
    	state = "";
    	page.setListnum(gongyingshangservice.listnum(page));
    	page=pageInfo(page);
    	gongyingshangList = gongyingshangservice.gongyingshangList(page);
    	gongyingshang = null;
    	return "gongyingshang";
    }
    public String addGYS(){
    	int i = gongyingshangservice.addGYS(gongyingshang);
    	page.setListnum(gongyingshangservice.listnum(page));
    	page=pageInfo(page);
    	gongyingshangList = gongyingshangservice.gongyingshangList(page);
    	if(i>0){
    		state = "添加供应商 "+gongyingshang.getName()+" 成功";
    	}
    	else{
    		state = "";
    	}
    	gongyingshang = null;
    	return "gongyingshang";
    	
    }
    public String delGYS(){
    	int i = gongyingshangservice.delGYS(gongyingshang);
    	page.setListnum(gongyingshangservice.listnum(page));
    	page=pageInfo(page);
    	gongyingshangList = gongyingshangservice.gongyingshangList(page);
    	if(i>0){
    		state = "删除成功";
    	}
    	else{
    		state = "";
    	}
    	gongyingshang = null;
    	return "gongyingshang";
    }
    public String updateGYS(){
    	int i = gongyingshangservice.updateGYS(gongyingshang);
    	if(i>0){
    		state="success";
    	}
    	else{
    		state=null;
    	}
    	gongyingshang = null;
    	return "updateGYS";
    }
    //页面的方法
    public Page pageInfo(Page page){
    	if(page.getNewpage()!=0){
			page.setCurrpage(page.getNewpage());
		}
    	if(page.getPagelistnum()==0){
    		page.setPagelistnum(10);
    	}
		page.setStartnum((page.getCurrpage()-1)*page.getPagelistnum());
		if(page.getListnum()%page.getPagelistnum()!=0){
			page.setPagenum(page.getListnum()/page.getPagelistnum()+1);
		}
		else{
			page.setPagenum(page.getListnum()/page.getPagelistnum());
		}
		return page;
    }
    /**!
     * 
     */
    
    public gongyingshangAction() {
        // TODO Auto-generated constructor stub
    }
	
	public gongyingshangService getGongyingshangservice() {
		return gongyingshangservice;
	}


	public void setGongyingshangservice(gongyingshangService gongyingshangservice) {
		this.gongyingshangservice = gongyingshangservice;
	}


	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public Gongyingshang getGongyingshang() {
		return gongyingshang;
	}
	public void setGongyingshang(Gongyingshang gongyingshang) {
		this.gongyingshang = gongyingshang;
	}
	public List<Gongyingshang> getGongyingshangList() {
		return gongyingshangList;
	}
	public void setGongyingshangList(List<Gongyingshang> gongyingshangList) {
		this.gongyingshangList = gongyingshangList;
	}


	

    
    

}
