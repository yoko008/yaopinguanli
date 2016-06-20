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
import com.qdu.model.Page;
import com.qdu.model.Zhigong;

/**!
 * //TODO 添加类/接口功能描述
 * @author Administrator
 */
public interface gongyingshangService {
    /**
     * !
     * //TODO 添加方法功能描述
     * @param info
     * @return
     */

	public int listnum(Page page);

	public List<Gongyingshang> gongyingshangList(Page page);

	public int addGYS(Gongyingshang gongyingshang);

	public int delGYS(Gongyingshang gongyingshang);

	public int updateGYS(Gongyingshang gongyingshang);

}
