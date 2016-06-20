<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%> 
<%
	String path=request.getContextPath();
    //获得当前协议+服务器名称+端口名
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<link href="css/admin_login.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:73px;
	height:14px;
	z-index:1;
	left: 648px;
	top: 202px;
}
-->
</style>
</head>
<body>
<div class="admin_login_wrap">
    
    <div class="adming_login_border">
    <h1 align="center">药品管理系统</h1>
        <div class="admin_input">
            <form action="ypgl/userManagerAction!login" method="post">
                <ul class="admin_items">
                    <li>
                        <label for="user">账号：
                        <input type="text" name="info.username" value="" id="user" size="20" class="admin_input_style" />  
                        <a href="register.jsp">注册账号</a>
                        </label> 
                    </li>
                    <li>
                        <label for="pwd">密码：
                        <input type="password" name="info.password" value="" id="pwd" size="20" class="admin_input_style" />
                        <a href="">找回密码</a>
                    </label>
                    </li>
                    <li >
                        <input type="submit" tabindex="3" value="提交" class="btn btn-primary"  />
                    </li>
                </ul>
            </form>
        </div>
    </div>
    <p class="admin_copyright"><a tabindex="5" href="#">返回首页</a> &copy; 2016 Powered by <a href="" target="_blank">taoyao</a></p>
</div>
</body>
</html>