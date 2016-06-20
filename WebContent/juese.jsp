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
    <title>角色权限管理</title>
    <link rel="stylesheet" type="text/css" href="css/lanrenzhijia.css"/>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/toastr.css"/>
    <link rel="stylesheet" type="text/css" href="css/darktooltip.css"/>
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/toastr.js"></script>
    <script type="text/javascript" src="js/jquery.darktooltip.js"></script>
    <script language="JavaScript">
    $(document).ready(function(){
    	//每页显示条数的操作
    	$("#meiye").change(function(){
    		var pagelistnum =$("#meiye  option:selected").val();
    		location.href="zhigong/zhigongAction!searchZhigong?page.newpage=1&page.pagelistnum="+pagelistnum;
    	});
    	//全选，取消全选时间
    	$("#quanxuan").bind("click", function () {
    		if($(this).is(':checked')){
    			$("input:[type=checkbox]").attr("checked", true);
    		}
    		else{
    			$("input:[type=checkbox]").attr("checked", false);
    		}
        });
    	//显示添加，删除信息
    	var state = $("#state").val();
    	if(state!=null&&state!=""){
    		$("#state").val("");
    		toastr.success(state);
    	}
    	//点击添加触发事件
    	$('.theme-login').click(function(){
    		$('.theme-popover-mask').fadeIn(100);
    		$('#ad').slideDown(200);
    	});
    	$('.theme-login2').click(function(){
    		$("#juese").val($(this).attr("id"));
    		$('.theme-popover-mask').fadeIn(100);
    		$('#ed').slideDown(200);
    		var juesename = $(this).attr("id");
    		$("input:[type=checkbox]").attr("checked", false);
    		$.ajax({
				type : "POST",
				url : "user/userManagerAction!searchcaidan?info.type="+juesename,
				dataType : "json",
				async : false,
				success : function show(data) {
					var json = eval("("+data+")");
					$.each(json,function(index,item){
						if(item.caidan=='系统用户管理'){
							$("input:[value='系统用户管理']").attr("checked", true);
						}
						if(item.caidan=='角色权限管理'){
							$("input:[value='角色权限管理']").attr("checked", true);
						}
						if(item.caidan=='职工管理'){
							$("input:[value='职工管理']").attr("checked", true);
						}
						if(item.caidan=='销售'){
							$("input:[value='销售']").attr("checked", true);
						}
						if(item.caidan=='价目表管理'){
							$("input:[value='价目表管理']").attr("checked", true);
						}
						if(item.caidan=='销售单查询'){
							$("input:[value='销售单查询']").attr("checked", true);
						}
						if(item.caidan=='供应商信息管理'){
							$("input:[value='供应商信息管理']").attr("checked", true);
						}
						if(item.caidan=='进货'){
							$("input:[value='进货']").attr("checked", true);
						}
						if(item.caidan=='进货单信息查询'){
							$("input:[value='进货单信息查询']").attr("checked", true);
						}
						if(item.caidan=='药品信息管理'){
							$("input:[value='药品信息管理']").attr("checked", true);
						}
						if(item.caidan=='过期/毁坏处理'){
							$("input:[value='过期/毁坏处理']").attr("checked", true);
						}
					});
				}
			});
    	});
    	$('.theme-poptit .close').click(function(){
    		$('.theme-popover-mask').fadeOut(100);
    		$('.theme-popover').slideUp(200);
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
    	 //参数设置，若用默认值可以省略以下面代
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
 
        //成功提示绑定
        $("#success").click(function(){
        toastr.success("祝贺你成功了");
        })
         
        //信息提示绑定
        $("#info").click(function(){
        toastr.info("这是一个提示信息");
        })
         
        //敬告提示绑定
        $("#warning").click(function(){
        toastr.warning("警告你别来烦我了");
        })
         
        //错语提示绑定
        $("#error").click(function(){
        toastr.error("出现错误，请更改");
        })
         
        //清除窗口绑定
        $("#clear").click(function(){
        toastr.clear();
        })
        
        //删除提示事件
        $(".del").darkTooltip({
            animation:'flipIn',
            gravity:'north',
            confirm:true,
            theme:'dark',
            trigger:'click',
            yes: '确定',
            no: '取消',
            size:"small"
        });
    	});
    	
    </script>
</head>
<body>
<input id="currpage" type="hidden" value="${page.currpage}">
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
            <div class="crumb-list"><i class="icon-font"></i><a href="index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">角色权限管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                
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
                            <th>名称</th>
                            <th>分配权限</th>
                            <th>操作</th>
                        </tr>
                        <s:iterator value="jueseList" var="js" status="st">
                        <tr id="${js.id}">
                            <td class="tc">${(page.currpage-1)*page.pagelistnum+st.index+1}<input name="id" value="${js.id}" type="hidden">
                            </td>
                            <td class="zhigong.gonghao">${js.juese}</td>
                            <td class="zhigong.gonghao"><a  class="theme-login2"  id="${js.juese}"  href="javascript:;">分配权限</a></td>
                            <td class="zhigong.gonghao"><a class="del" data-tooltip="确定要删除 ${js.juese} 吗？" href="user/userManagerAction!deljuese?juese.id=${js.id}&juese.juese=${js.juese}" id="${js.juese}">删除角色</a></td>
                        </tr>
                        </s:iterator>
                        
                    </table>
                    
                    <div class="list-page">  <a  class="theme-login"  id="add" href="javascript:;" style="float: left;">添加角色</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
<div class="theme-popover" id="ad" style="height:350px;">
     <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>添加角色</h3>
     </div>
     <div class="theme-popbod dform">
           <form class="theme-signin" name="loginform" action="user/userManagerAction!addjuese" method="post">
                <ol>
                     <li><h4>添加角色</h4></li>
                     <li><strong>角色名称：</strong><input class="ipt" type="text" name="caidan.juese" value="" size="20" /></li>
                     <li><input class="btn btn-primary" type="submit" name="submit" value=" 添加角色 " /></li>
                </ol>
           </form>
     </div>
</div>
<div class="theme-popover" id="ed" style="height:450px;">
     <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>修改权限</h3>
     </div>
     <div style="padding-left: 0px;" class="theme-popbod dform">
           <form class="theme-signin" name="loginform" action="user/userManagerAction!editcaidan" method="post">
                <ol>
                     <li><h4>修改权限</h4><input id="quanxuan" type="checkbox"  value="系统用户管理">全选<input type="hidden" id="juese" name="caidan.juese"></li>
                     <li><input name="caidan.caidan" type="checkbox" value="系统用户管理">   系统用户管理
                     <input name="caidan.caidan"  type="checkbox" value="角色权限管理">   角色权限管理
                     <input name="caidan.caidan"  type="checkbox" value="职工管理">   职工管理</li>
                     <li><input name="caidan.caidan"  type="checkbox" value="销售">   销售
                     <input name="caidan.caidan"  type="checkbox" value="价目表管理">   价目表管理
                     <input name="caidan.caidan"  type="checkbox" value="销售单查询">   销售单查询</li>
                     <li><input name="caidan.caidan"  type="checkbox" value="供应商信息管理">   供应商信息管理
                     <input name="caidan.caidan"  type="checkbox" value="进货">   进货
                     <input name="caidan.caidan"  type="checkbox" value="进货单信息查询">   进货单信息查询
                     <input name="caidan.caidan"  type="checkbox" value="药品信息管理">   药品信息管理</li>
                     <li><input name="caidan.caidan"  type="checkbox" value="过期/毁坏处理">   过期/毁坏处理</li>
                     <li><input class="btn btn-primary" type="submit" name="submit" value=" 确定 " /></li>
                </ol>
           </form>
     </div>
</div>
</body>
</html>