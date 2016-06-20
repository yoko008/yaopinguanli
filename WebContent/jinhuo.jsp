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
    <title>进货</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/toastr.css"/>
    <link rel="stylesheet" type="text/css" href="css/darktooltip.css"/>
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/toastr.js"></script>
    <script type="text/javascript" src="js/jquery.darktooltip.js"></script>
    <script language="JavaScript">
    $(document).ready(function(){
    	//显示添加，删除信息
    	var state = $("#state").val();
    	if(state!=null&&state!=""){
    		$("#state").val("");
    		toastr.success(state);
    	}
    	//自动计算总价填进input
    	$("#shuliang").blur(function(){
    		var shuliang = $("#shuliang").val();
    		var danjia = $("#danjia").val();
    		if(shuliang!=null&&shuliang!=""&&danjia!=null&&danjia!=""){
    			$("#zongjia").val(shuliang*danjia);
    		}
    	});
    	$("#danjia").blur(function(){
    		var shuliang = $("#shuliang").val();
    		var danjia = $("#danjia").val();
    		if(shuliang!=null&&shuliang!=""&&danjia!=null&&danjia!=""){
    			$("#zongjia").val(shuliang*danjia);
    		}
    	});
    	//
    	$("#yaopin").change(function(){
			var yaopinname =$("#yaopin  option:selected").val();
			$.ajax({
				type : "POST",
				url : "yaopin/yaopinAction!jinhuoxinxi?yaopininfo.name=" + yaopinname,
				dataType : "json",
				async : false,
				success : function show(data) {
					var json = eval("("+data+")");
					$.each(json,function(index,item){
						$("#danwei").val(item.danwei);
						$("#danjia").val(item.jhdanjia);
						$('#danjia').blur();
					});
				}
			});
			
		});
    });
    </script>
</head>
<body>
<input id="state" type="hidden" value="${state}">
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
            <div class="crumb-list"><i class="icon-font"></i><a href="index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">进货</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="zhigong/zhigongAction!searchZhigong?page.newpage=1" method="post">
                    <table class="search-tab">
                        <tr>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form action="yaopin/yaopinAction!addJinhuo" name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                    <center>
                    <form >
                                                 药品名：<select id="yaopin"  name="jinhuo.yaopinname">
                     <option style="width: 130px;" value="">请选择药品</option>
                     <s:iterator value="yaopininfoList" var="yp" status="st">
                         <option style="width: 130px;" value="${yp.name}">${yp.name}</option>
                     </s:iterator>
                     </select><br>
                                                 供应商：<select name="jinhuo.gongyingshang">
                     <option style="width: 130px;" value="">请选择供应商</option>
                     <s:iterator value="gongyingshangList" var="gys" status="st">
                         <option style="width: 130px;" value="${gys.name}">${gys.name}</option>
                     </s:iterator>
                     </select><br>                     
                                                 批次：<input name="jinhuo.pici" type="text"><br>
                                                生产日期：<input onclick="WdatePicker()"  name="jinhuo.shengchandate" type="text"><br>
                                                 过期日期：<input onclick="WdatePicker()"  name="jinhuo.guoqidate" type="text"><br>
                                                  单位：<input id="danwei"  readonly="readonly"  name="jinhuo.danwei" type="text"><br>
                                                   单价：<input id="danjia"  readonly="readonly"  name="jinhuo.danjia" type="text"><br>
                                                   数量：<input id="shuliang" name="jinhuo.shuliang" type="text"><br>
                                                    总价：<input id="zongjia" readonly="readonly" name="jinhuo.zongjia" type="text"><br><br> 
                     <input class="btn btn-primary btn2" value="进货"  type="submit">
                    </form>
                    </center>                         
                    </div>
                </div>
                <div class="result-content">
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>