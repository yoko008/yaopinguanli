/*
 * 源代码，版权归taoyao所有。
 * 
 * 项目名称 : Drug management system
 * 创建日期 : 2016年2月28日
 * 修改历史 : 
 *     1. [2016年2月28日]创建文件 by Administrator
 */
package com.qdu.service.impl;

import java.util.List;

import com.qdu.dao.userDao;
import com.qdu.dao.yaopinDao;
import com.qdu.dao.zhigongDao;
import com.qdu.model.Gongyingshang;
import com.qdu.model.Jinhuo;
import com.qdu.model.Page;
import com.qdu.model.Xiaoshou;
import com.qdu.model.Yaopininfo;
import com.qdu.model.Yaopinchuli;
import com.qdu.model.Yaopinkucun;
import com.qdu.model.Zhigong;
import com.qdu.model.userInfo;
import com.qdu.service.userService;
import com.qdu.service.yaopinService;
import com.qdu.service.zhigongService;

/**!
 * //TODO 添加类/接口功能描述
 * @author Administrator
 */
public class yaopinServiceImpl implements yaopinService{
    public yaopinDao yaopindao=null;

	public yaopinDao getYaopindao() {
		return yaopindao;
	}

	public void setYaopindao(yaopinDao yaopindao) {
		this.yaopindao = yaopindao;
	}
    
	public List<Yaopininfo> searchYaopinInfo(Page page){
		return yaopindao.searchYaopinInfo(page);
	}
	public List<Gongyingshang> searchGongyingshang(Page page){
		return yaopindao.searchGongyingshang();
	}
	public int addJinhuo(Jinhuo jinhuo){
		return yaopindao.addJinhuo(jinhuo);
	}
	public Yaopinkucun searchKucun(Jinhuo jinhuo){
		return yaopindao.searchKucun(jinhuo);
	}
	public int addYaopinKucun(Jinhuo jinhuo){
		return yaopindao.addYaopinKucun(jinhuo);
	}
	public int updateYaopinKucun(Jinhuo jinhuo){
		return yaopindao.updateYaopinKucun(jinhuo);
	}
	public Yaopininfo jinhuoxinxi(Yaopininfo yaopininfo){
		return yaopindao.jinhuoxinxi(yaopininfo);
	}
	public int jinhuodanListnum(Page page){
		return yaopindao.jinhuodanListnum(page);
	}
	public List<Jinhuo> jinhuodan(Page page){
		return yaopindao.jinhuodan(page);
	}
	public int yaopininfoListnum(Page page){
		return yaopindao.yaopininfoListnum(page);
	}
	public List<Yaopininfo> yaopininfo(Page page){
		return yaopindao.yaopininfo(page);
	}
	public int addyaopininfo(Yaopininfo yaopininfo){
		return yaopindao.addyaopininfo(yaopininfo);
	}
	public int delinfo(Yaopininfo yaopininfo){
		return yaopindao.delinfo(yaopininfo);
	}
	public int updateInfo(Yaopininfo yaopininfo){
		return yaopindao.updateInfo(yaopininfo);
	}
	public int addXiaoshou(Xiaoshou xiaoshou){
		return yaopindao.addXiaoshou(xiaoshou);
	}
	public int jianYaopinKucun(Xiaoshou xiaoshou){
		return yaopindao.jianYaopinKucun(xiaoshou);
	}
	public int xiaoshouListnum(Page page){
		return yaopindao.xiaoshouListnum(page);
	}
	public List<Xiaoshou> xiaoshoudan(Page page){
		return yaopindao.xiaoshoudan(page);
	}
	public List<Yaopinkucun> searchYaopinKucun(){
		return yaopindao.searchYaopinKucun();
	}
	public int chuli(Yaopinchuli yaopinchuli){
		return yaopindao.chuli(yaopinchuli);
	}
	public int jian(Yaopinchuli yaopinchuli){
		return yaopindao.jian(yaopinchuli);
	}
}
