<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博客后台管理</title>
</head>
<div class="wrap">
    <!--头部-->
    <div id="header">
        <c:import url="head.jsp"></c:import>
    </div>

    <!-- 左侧菜单和主体内容 -->
    <div class="grid-1-7" style="flex: 1;margin:0;">
        <c:import url="menu.jsp"></c:import>
    </div>
</div>
</html>
