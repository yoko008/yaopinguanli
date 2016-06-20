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

import com.qdu.dao.gongyingshangDao;
import com.qdu.dao.userDao;
import com.qdu.dao.zhigongDao;
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
public class gongyingshangServiceImpl implements gongyingshangService{
    public gongyingshangDao gongyingshangdao=null;
 
   
	public gongyingshangDao getGongyingshangdao() {
		return gongyingshangdao;
	}
	public void setGongyingshangdao(gongyingshangDao gongyingshangdao) {
		this.gongyingshangdao = gongyingshangdao;
	}
	
	
	public int listnum(Page page) {
		return gongyingshangdao.listnum(page);
	}
	
	public List<Gongyingshang> gongyingshangList(Page page){
		return gongyingshangdao.gongyingshangList(page);
	}
	
	public int addGYS(Gongyingshang gongyingshang){
		return gongyingshangdao.addGYS(gongyingshang);
	}
	
	public int delGYS(Gongyingshang gongyingshang){
		return gongyingshangdao.delGYS(gongyingshang);
	}
	
	public int updateGYS(Gongyingshang gongyingshang){
		return gongyingshangdao.updateGYS(gongyingshang);
	}
}
