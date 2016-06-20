/*
 * 源代码，版权归taoyao所有。
 * 
 * 项目名称 : Drug management system
 * 创建日期 : 2016年2月28日
 * 修改历史 : 
 *     1. [2016年2月28日]创建文件 by Administrator
 */
package com.qdu.service;

import java.util.List;

import com.qdu.model.Gongyingshang;
import com.qdu.model.Jinhuo;
import com.qdu.model.Page;
import com.qdu.model.Xiaoshou;
import com.qdu.model.Yaopininfo;
import com.qdu.model.Yaopinchuli;
import com.qdu.model.Yaopinkucun;
import com.qdu.model.Zhigong;

/**!
 * //TODO 添加类/接口功能描述
 * @author Administrator
 */
public interface yaopinService {

	public List<Yaopininfo> searchYaopinInfo(Page page);

	public List<Gongyingshang> searchGongyingshang(Page page);

	public int addJinhuo(Jinhuo jinhuo);

	public Yaopinkucun searchKucun(Jinhuo jinhuo);

	public int addYaopinKucun(Jinhuo jinhuo);

	public int updateYaopinKucun(Jinhuo jinhuo);

	public Yaopininfo jinhuoxinxi(Yaopininfo yaopininfo);

	public int jinhuodanListnum(Page page);

	public List<Jinhuo> jinhuodan(Page page);

	public int yaopininfoListnum(Page page);

	public List<Yaopininfo> yaopininfo(Page page);

	public int addyaopininfo(Yaopininfo yaopininfo);

	public int delinfo(Yaopininfo yaopininfo);

	public int updateInfo(Yaopininfo yaopininfo);

	public int addXiaoshou(Xiaoshou xiaoshou);

	public int jianYaopinKucun(Xiaoshou xiaoshou);

	public int xiaoshouListnum(Page page);

	public List<Xiaoshou> xiaoshoudan(Page page);

	public List<Yaopinkucun> searchYaopinKucun();

	public int chuli(Yaopinchuli yaopinchuli);

	public int jian(Yaopinchuli yaopinchuli);

}
