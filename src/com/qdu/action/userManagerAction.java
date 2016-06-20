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

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.qdu.model.Caidan;
import com.qdu.model.Juese;
import com.qdu.model.Page;
import com.qdu.model.userInfo;
import com.qdu.service.userService;


/**!
 * //TODO 添加类/接口功能描述
 * @author Administrator
 */
@SuppressWarnings("serial")
public class userManagerAction extends ActionSupport implements SessionAware{
    private Map<String, Object> session=null;
    public userInfo info=null;
    public List<userInfo>  userList;
    public userService userservice;
    public String state=null;
    public Page page;
    public userInfo user;
    public Juese juese;
    public List<Juese>  jueseList;
    public Caidan caidan;
    public List<Caidan>  caidanList;
    
    public String login(){
        info=userservice.login(info);
        if(info!=null){  
            session.put("user", info);
            caidanList = userservice.searchCaidan(info);
            session.put("caidan", caidanList);
            return "success";
        }else{
            state="用户名或密码错误！";
            return "loginError";
        }
    }
    public String searchUser(){
    	page.setListnum(userservice.listnum(page));
    	page=pageInfo(page);
    	userList = userservice.userList(page);
    	jueseList = userservice.jueseList();
    	state="";
    	return "userlist";
    }
  //用户列表重置密码操作+设置管理员操作
  	//若realname=admin，则为设置管理员操作，懒得再写一个方法了，反正是我自己维护
  	public String resetPass() {
  		int i  = userservice.resetPass(user);
  		user=null;
  		return null;
  	}
  	//用户列表禁用/解禁操作
  	public String caozuo(){
  		int i = userservice.caozuo(user);
  		page=pageInfo(page);
  		userList = userservice.userList(page);
  		if(i>0){
    		state="操作成功";
    	}
    	else{
    		state="";
    	}
  		return "userlist";
  	}
  	public String editjuese(){
  		int i = userservice.editjuese(user);
  		if(i>0){
  			state = "success";
  		}
  		else{
  			state = "";
  		}
  		user=null;
  		return "editjuese";
  	}
  	
  	public String searchJuese(){
  		state="";
  		jueseList = userservice.searchJuese();
  		return "searchJuese";
  	}
  	
  	public String editcaidan(){
  		String[] caidantiao = caidan.getCaidan().split(",");
  		int j = userservice.delcaidan(caidan);
  		int i = 0;
  		for(String x :caidantiao){
  			caidan.setCaidan(x.trim());
  			i = userservice.editcaidan(caidan);
  		}
  		jueseList = userservice.searchJuese();
  		if(i>0){
  			state="分配权限成功";
  		}
  		else{
  			state="";
  		}
  		return "searchJuese";
  	}
  	public String addjuese(){
  		int i = userservice.addjuese(caidan);
  		if(i>0){
  			state="添加角色成功";
  		}
  		else{
  			state="";
  		}
  		jueseList = userservice.searchJuese();
  		return "searchJuese";
  	}
  	public String deljuese(){
  		int i = userservice.deljuese(juese);
  		caidan.setJuese(juese.getJuese());
  		int k = userservice.delcaidan(caidan);
  		if(i>0){
  			state="删除角色成功";
  			int j = userservice.delyonghujuese(juese);
  		}
  		else{
  			state="";
  		}
  		jueseList = userservice.searchJuese();
  		return "searchJuese";
  	}
  	public String searchcaidan(){
  		caidanList = userservice.searchCaidan(info);
  		JSONArray json = JSONArray.fromObject(caidanList);
		state = json.toString();
  		return "fenpei";
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
    
    public userManagerAction() {
        // TODO Auto-generated constructor stub
    }

    public Caidan getCaidan() {
		return caidan;
	}
	public void setCaidan(Caidan caidan) {
		this.caidan = caidan;
	}
	public List<Caidan> getCaidanList() {
		return caidanList;
	}
	public void setCaidanList(List<Caidan> caidanList) {
		this.caidanList = caidanList;
	}
	public Juese getJuese() {
		return juese;
	}
	public void setJuese(Juese juese) {
		this.juese = juese;
	}
	public List<Juese> getJueseList() {
		return jueseList;
	}
	public void setJueseList(List<Juese> jueseList) {
		this.jueseList = jueseList;
	}
	public userInfo getUser() {
		return user;
	}
	public void setUser(userInfo user) {
		this.user = user;
	}
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	@Override
    public void setSession(Map<String, Object> session) {
        // TODO Auto-generated method stub
        this.session=session;
    }

    /**!
     * @return Returns the info.
     */
    public userInfo getInfo() {
        return info;
    }

    /**!
     * @param info The info to set.
     */
    public void setInfo(userInfo info) {
        this.info = info;
    }

    /**!
     * @return Returns the userList.
     */
    public List<userInfo> getUserList() {
        return userList;
    }

    /**!
     * @param userList The userList to set.
     */
    public void setUserList(List<userInfo> userList) {
        this.userList = userList;
    }

    /**!
     * @return Returns the userservice.
     */
    public userService getUserservice() {
        return userservice;
    }

    /**!
     * @param userservice The userservice to set.
     */
    public void setUserservice(userService userservice) {
        this.userservice = userservice;
    }

    /**!
     * @return Returns the state.
     */
    public String getState() {
        return state;
    }

    /**!
     * @param state The state to set.
     */
    public void setState(String state) {
        this.state = state;
    }

    /**!
     * @return Returns the session.
     */
    
    

}
