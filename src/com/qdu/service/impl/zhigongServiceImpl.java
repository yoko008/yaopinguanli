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
import com.qdu.dao.zhigongDao;
import com.qdu.model.Page;
import com.qdu.model.Zhigong;
import com.qdu.model.userInfo;
import com.qdu.service.userService;
import com.qdu.service.zhigongService;

/**!
 * //TODO 添加类/接口功能描述
 * @author Administrator
 */
public class zhigongServiceImpl implements zhigongService{
    public zhigongDao zhigongdao=null;
 
   
    public zhigongDao getZhigongdao() {
		return zhigongdao;
	}
    
	public void setZhigongdao(zhigongDao zhigongdao) {
		this.zhigongdao = zhigongdao;
	}
	public int listnum(Page page) {
		return zhigongdao.listnum(page);
	}
	public List<Zhigong> zhigongList(Page page) {
		return zhigongdao.zhigongList(page);
	}
	public int lizhi(Zhigong zhigong){
		return zhigongdao.lizhi(zhigong);
	}
	public int xiugai(Zhigong zhigong){
		return zhigongdao.xiugai(zhigong);
	}
	public int addzhigong(Zhigong zhigong){
		return zhigongdao.addzhigong(zhigong);
	}
    
}
