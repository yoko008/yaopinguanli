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

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.qdu.model.Gongyingshang;
import com.qdu.model.Jinhuo;
import com.qdu.model.Page;
import com.qdu.model.Xiaoshou;
import com.qdu.model.Yaopinkucun;
import com.qdu.model.Yaopininfo;
import com.qdu.model.Yaopinchuli;
import com.qdu.model.Zhigong;
import com.qdu.model.userInfo;
import com.qdu.service.gongyingshangService;
import com.qdu.service.userService;
import com.qdu.service.yaopinService;
import com.qdu.service.zhigongService;


/**!
 * //TODO 添加类/接口功能描述
 * @author Administrator
 */
@SuppressWarnings("serial")
public class yaopinAction extends ActionSupport{
	public yaopinService yaopinservice=null;
    public String state;
    public Page page;
    public Jinhuo jinhuo;
    public Xiaoshou xiaoshou;
    public Yaopinchuli yaopinchuli;
    public Yaopinkucun yaopinkucun;
    public Yaopininfo yaopininfo;
    public List<Jinhuo> jinhuoList;
    public List<Xiaoshou> xiaoshouList;
    public List<Yaopinchuli> yaopinchuliList;
    public List<Yaopinkucun> yaopinkucunList;
    public List<Yaopininfo> yaopininfoList;
    public Gongyingshang gongyingshang;
    public List<Gongyingshang> gongyingshangList;
    
    
    public String jinhuo(){
    	state = "";
    	page=null;
    	yaopininfoList = yaopinservice.searchYaopinInfo(page);
    	gongyingshangList = yaopinservice.searchGongyingshang(page);
    	return "jinhuo";
    }
    public String addJinhuo(){
    	Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		jinhuo.setJinhuodate(time);
    	int i = yaopinservice.addJinhuo(jinhuo);
    	yaopinkucun = yaopinservice.searchKucun(jinhuo);
    	if(yaopinkucun==null){
    		int j = yaopinservice.addYaopinKucun(jinhuo);
    	}
    	else{
    		int j = yaopinservice.updateYaopinKucun(jinhuo);
    	}
    	yaopininfoList = yaopinservice.searchYaopinInfo(page);
    	gongyingshangList = yaopinservice.searchGongyingshang(page);
    	if(i>0){
    		state = "成功进货<br>药品名："+jinhuo.getYaopinname()+"<br>数量："+jinhuo.getShuliang()+"<br>总价："+jinhuo.getZongjia();
    	}
    	else{
    		state = "";
    	}
    	return "jinhuo";
    }
    //进货时查找选中的药品信息并加到页面
    public String jinhuoxinxi(){
    	yaopininfo = yaopinservice.jinhuoxinxi(yaopininfo);
    	JSONArray json = JSONArray.fromObject(yaopininfo);
		state = json.toString();
    	return "jinhuoxinxi";
    }
    //进货单
    public String jinhuodan(){
    	state = "";
    	page.setListnum(yaopinservice.jinhuodanListnum(page));
    	page=pageInfo(page);
    	jinhuoList = yaopinservice.jinhuodan(page);
    	return "jinhuodan";
    }
    public String yaopininfo(){
    	state="";
    	page.setListnum(yaopinservice.yaopininfoListnum(page));
    	page=pageInfo(page);
    	yaopininfoList = yaopinservice.searchYaopinInfo(page);
    	yaopininfo = null;
    	return "yaopininfo";
    }
    //添加药品信息
    public String addyaopininfo(){
    	int i = yaopinservice.addyaopininfo(yaopininfo);
    	page.setListnum(yaopinservice.yaopininfoListnum(page));
    	page=pageInfo(page);
    	yaopininfoList = yaopinservice.searchYaopinInfo(page);
    	if(i>0){
    		state = "成功添加药品："+yaopininfo.getName();
    	}
    	else{
    		state = "";
    	}
    	yaopininfo = null;
    	return "yaopininfo";
    }
    //删除药品信息
    public String delinfo(){
    	int i = yaopinservice.delinfo(yaopininfo);
    	page.setListnum(yaopinservice.yaopininfoListnum(page));
    	page=pageInfo(page);
    	yaopininfoList = yaopinservice.searchYaopinInfo(page);
    	if(i>0){
    		state = "删除成功";
    	}
    	else{
    		state = "";
    	}
    	yaopininfo = null;
    	return "yaopininfo";
    }
    
    public String updateInfo(){
    	int i = yaopinservice.updateInfo(yaopininfo);
    	if(i>0){
    		state="success";
    	}
    	else{
    		state=null;
    	}
    	yaopininfo = null;
    	return "updateInfo";
    }
    public String xiaoshou(){
    	state = "";
    	page=null;
    	yaopininfoList = yaopinservice.searchYaopinInfo(page);
    	return "xiaoshou";
    }
    public String addXiaoshou(){
    	Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		xiaoshou.setDate(time);
    	int i = yaopinservice.addXiaoshou(xiaoshou);
    	int j = yaopinservice.jianYaopinKucun(xiaoshou);
    	yaopininfoList = yaopinservice.searchYaopinInfo(page);
    	if(i>0&&j>0){
    		state = "成功销售<br>药品名："+xiaoshou.getYaopinname()+"<br>数量："+xiaoshou.getShuliang()+"<br>总价："+xiaoshou.getZongjia();
    	}
    	else{
    		state = "";
    	}
    	return "xiaoshou";
    }
    public String yaopinjiamu(){
    	state="";
    	page.setListnum(yaopinservice.yaopininfoListnum(page));
    	page=pageInfo(page);
    	yaopininfoList = yaopinservice.searchYaopinInfo(page);
    	yaopininfo = null;
    	return "xiugaijiamu";
    }
    public String xiaoshoudan(){
    	state = "";
    	page.setListnum(yaopinservice.xiaoshouListnum(page));
    	page=pageInfo(page);
    	xiaoshouList = yaopinservice.xiaoshoudan(page);
    	return "xiaoshoudan";
    }
    public String guoqichuli(){
    	state = "";
    	yaopinkucunList = yaopinservice.searchYaopinKucun();
    	return "guoqichuli";
    }
    public String chuli(){
    	Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		yaopinchuli.setDate(time);
		int i = yaopinservice.chuli(yaopinchuli);
		int j = yaopinservice.jian(yaopinchuli);
		if(i>0){
    		state = "处理成功";
    	}
    	else{
    		state = "";
    	}
		return "guoqichuli";
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
	public yaopinService getYaopinservice() {
		return yaopinservice;
	}
	public void setYaopinservice(yaopinService yaopinservice) {
		this.yaopinservice = yaopinservice;
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
	public Jinhuo getJinhuo() {
		return jinhuo;
	}
	public void setJinhuo(Jinhuo jinhuo) {
		this.jinhuo = jinhuo;
	}
	public Xiaoshou getXiaoshou() {
		return xiaoshou;
	}
	public void setXiaoshou(Xiaoshou xiaoshou) {
		this.xiaoshou = xiaoshou;
	}
	
	public Yaopininfo getYaopininfo() {
		return yaopininfo;
	}
	public void setYaopininfo(Yaopininfo yaopininfo) {
		this.yaopininfo = yaopininfo;
	}
	public List<Jinhuo> getJinhuoList() {
		return jinhuoList;
	}
	public void setJinhuoList(List<Jinhuo> jinhuoList) {
		this.jinhuoList = jinhuoList;
	}
	
	public List<Xiaoshou> getXiaoshouList() {
		return xiaoshouList;
	}
	public void setXiaoshouList(List<Xiaoshou> xiaoshouList) {
		this.xiaoshouList = xiaoshouList;
	}
	public Yaopinchuli getYaopinchuli() {
		return yaopinchuli;
	}
	public void setYaopinchuli(Yaopinchuli yaopinchuli) {
		this.yaopinchuli = yaopinchuli;
	}
	public Yaopinkucun getYaopinkucun() {
		return yaopinkucun;
	}
	public void setYaopinkucun(Yaopinkucun yaopinkucun) {
		this.yaopinkucun = yaopinkucun;
	}
	public List<Yaopinchuli> getYaopinchuliList() {
		return yaopinchuliList;
	}
	public void setYaopinchuliList(List<Yaopinchuli> yaopinchuliList) {
		this.yaopinchuliList = yaopinchuliList;
	}
	public List<Yaopinkucun> getYaopinkucunList() {
		return yaopinkucunList;
	}
	public void setYaopinkucunList(List<Yaopinkucun> yaopinkucunList) {
		this.yaopinkucunList = yaopinkucunList;
	}
	public List<Yaopininfo> getYaopininfoList() {
		return yaopininfoList;
	}
	public void setYaopininfoList(List<Yaopininfo> yaopininfoList) {
		this.yaopininfoList = yaopininfoList;
	}
    
    

}
