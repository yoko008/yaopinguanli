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

import com.qdu.model.Caidan;
import com.qdu.model.Juese;
import com.qdu.model.Page;
import com.qdu.model.userInfo;

/**!
 * //TODO 添加类/接口功能描述
 * @author Administrator
 */
public interface userService {
    /**
     * !
     * //TODO 添加方法功能描述
     * @param info
     * @return
     */
    public userInfo login(userInfo info);

	public int listnum(Page page);

	public List<userInfo> userList(Page page);

	public int resetPass(userInfo user);

	public int caozuo(userInfo user);

	public List<Juese> jueseList();

	public int editjuese(userInfo user);

	public List<Juese> searchJuese();

	public int editcaidan(Caidan caidan);

	public int delcaidan(Caidan caidan);

	public List<Caidan> searchCaidan(userInfo info);

	public int addjuese(Caidan caidan);

	public int deljuese(Juese juese);

	public int delyonghujuese(Juese juese);

}
