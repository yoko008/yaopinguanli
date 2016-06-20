/*
 * 源代码，版权归taoyao所有。
 * 
 * 项目名称 : Drug management system
 * 创建日期 : 2016年2月28日
 * 修改历史 : 
 *     1. [2016年2月28日]创建文件 by Administrator
 */
package com.qdu.action;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.qdu.model.Page;
import com.qdu.model.Zhigong;
import com.qdu.model.userInfo;
import com.qdu.service.userService;
import com.qdu.service.zhigongService;


/**!
 * //TODO 添加类/接口功能描述
 * @author Administrator
 */
@SuppressWarnings("serial")
public class zhigongAction extends ActionSupport{
    public zhigongService zhigongservice=null;
    public String state=null;
    public Page page;
    public Zhigong zhigong;
    public List<Zhigong> zhigongList;
    
    public String searchZhigong(){
    	page.setListnum(zhigongservice.listnum(page));
    	page=pageInfo(page);
    	zhigongList = zhigongservice.zhigongList(page);
    	state="";
    	zhigong=null;
    	return "zhigong";
    }
    public String lizhi() {
    	Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		zhigong.setLizhidate(time);
  		int i  = zhigongservice.lizhi(zhigong);
  		page.setListnum(zhigongservice.listnum(page));
    	page=pageInfo(page);
    	zhigongList = zhigongservice.zhigongList(page);
    	if(i>0){
    		state="离职成功";
    	}
    	else{
    		state="";
    	}
  		zhigong=null;
  		return "zhigong";
  	}
    public String xiugai(){
    	int i = zhigongservice.xiugai(zhigong);
    	if(i>0){
    		state="success";
    	}
    	else{
    		state=null;
    	}
    	zhigong = null;
    	return "xiugai";
    }
    
    public String addzhigong(){
    	Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		zhigong.setRuzhidate(time);
    	int i = zhigongservice.addzhigong(zhigong);
    	page.setListnum(zhigongservice.listnum(page));
    	page=pageInfo(page);
    	zhigongList = zhigongservice.zhigongList(page);
    	if(i>0){
    		state="添加职工 "+zhigong.getName()+" 成功";
    	}
    	else{
    		state=null;
    	}
    	zhigong=null;
    	return "zhigong";
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
    
    public zhigongAction() {
        // TODO Auto-generated constructor stub
    }


	public zhigongService getZhigongservice() {
		return zhigongservice;
	}


	public void setZhigongservice(zhigongService zhigongservice) {
		this.zhigongservice = zhigongservice;
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


	public Zhigong getZhigong() {
		return zhigong;
	}


	public void setZhigong(Zhigong zhigong) {
		this.zhigong = zhigong;
	}


	public List<Zhigong> getZhigongList() {
		return zhigongList;
	}


	public void setZhigongList(List<Zhigong> zhigongList) {
		this.zhigongList = zhigongList;
	}

    
    

}
