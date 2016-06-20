<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	//获得当前协议+服务器名称+端口名
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>销售单管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/toastr.css"/>
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/toastr.js"></script>
    <script language="JavaScript">
    $(document).ready(function(){
    	//每页显示条数的操作
    	$("#meiye").change(function(){
    		var pagelistnum =$("#meiye  option:selected").val();
    		location.href="yaopin/yaopinAction!xiaoshoudan?page.newpage=1&page.pagelistnum="+pagelistnum;
    	});
    	//跳到指定页面
    	$("#pagelianjie").click(function(){
    		var newpage = $("#tiaopage").val();
    		var url = $(this).attr("href");
    		var pagenum = $("#pagenum").html();
    		var ex = /^\d+$/;
    		//验证输入的页码，如果小于1，大于总页数，不是整数，则不跳转
    		//特别说明：验证方式是 newpage-pagenum>0 ，之前用newpage>pagenum有BUG，应该跟什么弱类型有关，所以给他们减一下就好了
    		if(newpage<1 || newpage-pagenum>0 || !ex.test(newpage)){
    			toastr.error("页码输入错误，请重新输入");
    			return false;
    		}
    		else{
    			url = url+"&page.newpage="+newpage;
        		location.href = url;
    		}
    	});
    	toastr.options = {
    	        "closeButton": false, //是否显示关闭按钮
    	        "debug": false, //是否使用debug模式
    	        "positionClass": "toast-top-right",//弹出窗的位置
    	        "showDuration": "300",//显示的动画时间
    	        "hideDuration": "1000",//消失的动画时间
    	        "timeOut": "2000", //展现时间
    	        "extendedTimeOut": "1000",//加长展示时间
    	        "showEasing": "swing",//显示时的动画缓冲方式
    	        "hideEasing": "linear",//消失时的动画缓冲方式
    	        "showMethod": "fadeIn",//显示时的动画方式
    	        "hideMethod": "fadeOut" //消失时的动画方式
    	        };
    	});
    	
    </script>
</head>
<body>
<input id="currpage" type="hidden" value="${page.currpage}">
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="index.jsp">首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
   <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
           <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                         <s:iterator value="#session.caidan" var="cd" status="st">
                            <s:if test="#cd.caidan=='系统用户管理'"><li><a href="user/userManagerAction!searchUser?page.newpage=1"><i class="icon-font">&#xe008;</i>系统用户管理</a></li></s:if>
                            <s:if test="#cd.caidan=='角色权限管理'"><li><a href="user/userManagerAction!searchJuese?page.newpage=1"><i class="icon-font">&#xe008;</i>角色权限管理</a></li></s:if>
                            <s:if test="#cd.caidan=='职工管理'"><li><a href="zhigong/zhigongAction!searchZhigong?page.newpage=1&page.keyword="><i class="icon-font">&#xe012;</i>职工管理</a></li></s:if>
                         </s:iterator>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>药品销售管理</a>
                    <ul class="sub-menu">
                    <s:iterator value="#session.caidan" var="cd" status="st">
                        <s:if test="#cd.caidan=='销售'"><li><a href="yaopin/yaopinAction!xiaoshou"><i class="icon-font">&#xe017;</i>销售</a></li></s:if>
                        <s:if test="#cd.caidan=='价目表管理'"><li><a href="yaopin/yaopinAction!yaopinjiamu?page.newpage=1&page.keyword="><i class="icon-font">&#xe037;</i>价目表管理</a></li></s:if>
                        <s:if test="#cd.caidan=='销售单查询'"><li><a href="yaopin/yaopinAction!xiaoshoudan?page.newpage=1&page.keyword="><i class="icon-font">&#xe046;</i>销售单查询</a></li></s:if>
                    </s:iterator>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>药品进货管理</a>
                    <ul class="sub-menu">
                    <s:iterator value="#session.caidan" var="cd" status="st">
                        <s:if test="#cd.caidan=='供应商信息管理'"><li><a href="gongyingshang/gongyingshangAction!searchGYS?page.newpage=1&page.keyword="><i class="icon-font">&#xe017;</i>供应商信息管理</a></li></s:if>
                        <s:if test="#cd.caidan=='进货'"><li><a href="yaopin/yaopinAction!jinhuo"><i class="icon-font">&#xe037;</i>进货</a></li></s:if>
                        <s:if test="#cd.caidan=='进货单信息查询'"><li><a href="yaopin/yaopinAction!jinhuodan?page.newpage=1&page.keyword="><i class="icon-font">&#xe046;</i>进货单信息查询</a></li></s:if>
                        <s:if test="#cd.caidan=='药品信息管理'"><li><a href="yaopin/yaopinAction!yaopininfo?page.newpage=1&page.keyword="><i class="icon-font">&#xe045;</i>药品信息管理</a></li></s:if>
                    </s:iterator>
                    </ul>
                </li>
                 <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>库存转移管理</a>
                    <ul class="sub-menu">
                    <s:iterator value="#session.caidan" var="cd" status="st">
                         <s:if test="#cd.caidan=='过期/毁坏处理'"><li><a href="yaopin/yaopinAction!guoqichuli"><i class="icon-font">&#xe017;</i>过期/毁坏处理</a></li></s:if>
                    </s:iterator>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">销售单管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="yaopin/yaopinAction!xiaoshoudan?page.newpage=1" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="page.keyword" value="${page.keyword}" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                            <td>每页显示：</td>
                            <td><select id="meiye">
                            <option value="10" <s:if test="page.pagelistnum==10">selected</s:if>>10条</option>
                            <option value="20" <s:if test="page.pagelistnum==20">selected</s:if>>20条</option>
                            <option value="30" <s:if test="page.pagelistnum==30">selected</s:if>>30条</option>
                            </select> </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                    </div>
                </div>
                <div class="result-content">
                    <table id="table"  class="result-tab" width="100%">
                        <tr>
                            <th class="tc" width="5%">编号</th>
                            <th>药品名</th>
                            <th>数量</th>
                            <th>单价</th>
                            <th>总价</th>
                            <th>销售日期</th>
                        </tr>
                         <s:iterator value="xiaoshouList" var="xs" status="st">
                        <tr>
                            <td class="tc">${(page.currpage-1)*page.pagelistnum+st.index+1}
                            <input name="id" value="${xs.id}" type="hidden">
                            </td>
                            <td>${xs.yaopinname}</td>
                            <td>${xs.shuliang}</td>
                            <td>${xs.danjia}</td>
                            <td>${xs.zongjia}</td>
                             <td>${xs.date}</td>
                            
                        </tr>
                        </s:iterator>
                    </table>
                    
                   <div class="list-page"> 
                    共 ${page.listnum} 条结果 
                    <s:if test="page.currpage != 1"><a href="yaopin/yaopinAction!xiaoshoudan?page.newpage=1&page.pagelistnum=${page.pagelistnum}&page.keyword=${page.keyword}">首页</a></s:if> 
                    <s:if test="page.currpage == 1"><a ><font color="#aaaaaa">首页</font></a></s:if>
                    <s:if test="page.currpage != 1"><a href="yaopin/yaopinAction!xiaoshoudan?page.pagelistnum=${page.pagelistnum}&page.keyword=${page.keyword}&page.newpage=${page.currpage-1}">上一页</a></s:if> 
                    <s:if test="page.currpage == 1"><a ><font color="#aaaaaa">上一页</font></a></s:if> 
                    <s:if test="page.currpage != page.pagenum"><a href="yaopin/yaopinAction!xiaoshoudan?page.pagelistnum=${page.pagelistnum}&page.keyword=${page.keyword}&page.newpage=${page.currpage+1}">下一页</a></s:if>
                    <s:if test="page.currpage == page.pagenum"><a><font color="#aaaaaa">下一页</font></a></s:if>
                    <s:if test="page.currpage != page.pagenum"><a href="yaopin/yaopinAction!xiaoshoudan?page.pagelistnum=${page.pagelistnum}&page.keyword=${page.keyword}&page.newpage=${page.pagenum}">末页</a></s:if>
                    <s:if test="page.currpage == page.pagenum"><a><font color="#aaaaaa">末页</font></a></s:if>
                   第 ${page.currpage} 页/共 <font id="pagenum">${page.pagenum}</font> 页
                     <a id="pagelianjie" href="yaopin/yaopinAction!xiaoshoudan?page.pagelistnum=${page.pagelistnum}&page.keyword=${page.keyword}" style="float: right;">跳转</a><input id="tiaopage" style="float: right;" type="text">
                    </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>