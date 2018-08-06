
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--字体图标样式-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/icomoon.css" rel="stylesheet" />
    <!--动画样式-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/animate.css" rel="stylesheet" />
    <!--核心样式-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/style.css" rel="stylesheet" />
    <!--jquery，当前版本不可更改jquery版本-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/lib/jquery-1.7.2.min.js"></script>
    <!--全局动态修改-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/common.js"></script>
    <!--核心组件-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/javaex.js"></script>
    <!--表单验证-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/javaex-formVerify.js"></script>

    <title>Title</title>
</head>
<div id="menu" class="menu" style="width: 260px;">
    <div class="menu-title">
        <h1><i>菜单</i></h1>
    </div>
    <ul>
        <li class="menu-item">
            <a href="javascript:;"><span>分类管理</span><i class="my-icon menu-more"></i></a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/type/allType.action"><span>文章分类</span></a></li>
            </ul>
        </li>
        <li class="menu-item">
            <a href="javascript:;"><span>文章管理</span><i class="my-icon menu-more"></i></a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/article/list_normal.action"><span>文章列表</span></a></li>
                <li><a href="${pageContext.request.contextPath}/article/list_recycle.action"><span>回收站</span></a></li>
            </ul>
        </li>
    </ul>
</div>

<script>
    javaex.menu({
        id : "menu",
        isAutoSelected : true
    });
</script>
</html>
