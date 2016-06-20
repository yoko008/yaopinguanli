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
import com.qdu.model.Caidan;
import com.qdu.model.Juese;
import com.qdu.model.Page;
import com.qdu.model.userInfo;
import com.qdu.service.userService;

/**!
 * //TODO 添加类/接口功能描述
 * @author Administrator
 */
public class userServiceImpl implements userService{
    public userDao userdao=null;
 
   

    @Override
    public userInfo login(userInfo info) {
        
        return userdao.login(info);
    }
    public int listnum(Page page){
    	 return userdao.listnum(page);
    }
    public List<userInfo> userList(Page page){
    	 return userdao.userList(page);
    }
    public int resetPass(userInfo user){
    	 return userdao.resetPass(user);
    }
	public int caozuo(userInfo user){
		 return userdao.caozuo(user);
	}
	public List<Juese> jueseList(){
		 return userdao.jueseList();
	}
	public int editjuese(userInfo user){
		 return userdao.editjuese(user);
	}
	public List<Juese> searchJuese(){
		return userdao.searchJuese();
	}
	public int editcaidan(Caidan caidan){
		return userdao.editcaidan(caidan);
	}
	public int delcaidan(Caidan caidan){
		return userdao.delcaidan(caidan);
	}
	public List<Caidan> searchCaidan(userInfo info){
		return userdao.searchCaidan(info);
	}
	public int addjuese(Caidan caidan){
		return userdao.addjuese(caidan);
	}
	public int deljuese(Juese juese){
		return userdao.deljuese(juese);
	}
	public int delyonghujuese(Juese juese){
		return userdao.delyonghujuese(juese);
	}
    /**!
     * 
     */
    public userServiceImpl() {
        // TODO Auto-generated constructor stub
    }
    /**!
     * @return Returns the userdao.
     */
    public userDao getUserdao() {
        return userdao;
    }
    /**!
     * @param userdao The userdao to set.
     */
    public void setUserdao(userDao userdao) {
        this.userdao = userdao;
    }
    
}
