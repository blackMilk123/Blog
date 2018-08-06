<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>关于我页面</title>
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
  <%--关于我页面--%>
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/about.css" rel="stylesheet">
</head>

<body>
	<div class="header">
		<div class="header-mask"></div>
		<div id="top">
			<c:import url="header.jsp"></c:import>
		</div>
		<h1 id="big-title">关于我</h1>
	</div>

	<div id="content">
		<div class="block" style="border-radius: 6px 6px 0 0;">
			<div class="grid-1-2-1">
				<div></div>
				<div id="main-content" style="min-width: 950px;margin-top: 50px;margin-bottom: 40px;">
					<div class="content-header">
						<p>QQ：291026192</p>
					</div>
					
					<div class="block block2">
						<div class="main-0">
							<p>2018-08-05：</p>
							<blockquote><p>本博客是基于陈霓清先生所录的博客项目，在修改了一些css样式和
                            改动了一些该项目的小bug而来。并且使用了陈霓清先生原创的Javaex框架，在此贴上
                                作者地址，致谢
                                <a href="http://www.javaex.cn">JavaEx框架</a>
                            </p></blockquote>

						</div>
					</div>
				</div>
				<div></div>
			</div>
		</div>
		
		<div class="footer" style="background: #323437;">
			<c:import url="footer.jsp"></c:import>
		</div>
	</div>

	<!--回到顶部-->
	<div class="side-bar">
		<div id="goTopBtn">
			<span class="icon-arrow_upward"></span>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		// window的高度
		var windowHeight = $(window).height();
		// header的高度
		var headerHeight = $(".header").height();
		// footer的高度
		var footerHeight = $(".footer").height();
		// 内容的高度
		var contentHeight = $("#main-content").height();
		// 差
		var diff = windowHeight - (headerHeight+(contentHeight-60)+footerHeight);
		if (diff>0) {
			$("#main-content").css("margin-bottom", diff-50+"px");
		}
		
		// 监听元素获得焦点事件
		$('input[type="text"]').focus(function() {
			$("#search").addClass("is-focused");
		});

		// 监听元素失去焦点事件
		$('input[type="text"]').blur(function() {
			$("#search").removeClass("is-focused");
		});
	});
	
	function openSearch() {
		$(".nav").hide();
		$("#search").show();
	}
	
	$("#close-search").click(function() {
		$("#search").hide();
		$(".nav").show();
	});
</script>
</html>
