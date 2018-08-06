<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>博客首页</title>
    <!--字体图标样式-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/icomoon.css" rel="stylesheet"/>
    <!--动画样式-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/animate.css" rel="stylesheet"/>
    <!--核心样式-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/style.css" rel="stylesheet"/>
    <!--jquery，当前版本不可更改jquery版本-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/lib/jquery-1.7.2.min.js"></script>
    <!--全局动态修改-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/common.js"></script>
    <!--核心组件-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/javaex.js"></script>
    <!--表单验证-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/javaex-formVerify.js"></script>

    <%--search.jsp的css--%>
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/search.css" rel="stylesheet">

</head>

<body>
	<div class="header">
		<div id="top">
			<c:import url="header.jsp"></c:import>
		</div>
		<h1 id="big-title">搜索结果</h1>
	</div>

	<div id="content">
		<div class="block" style="border-radius: 6px 6px 0 0;">
			<div class="grid-1-2-1">
				<div></div>
				<div id="main-content" style="min-width: 950px;margin-top: 100px;margin-bottom: 40px;">
					<c:forEach items="${pageInfo.list}" var="entity" varStatus="status" >
						<div class="block block2">
							<div class="grid-5-7" style="height: 230px;">
								<div class="img">
                                    <img style=" height: 200px; width: 330px" src="${entity.imagePath}" />
								</div>
								<div class="main-15">
                                    所属分类：<a style="color: #4cd964" href="${pageContext.request.contextPath}/portal/type.action?typeId=${entity.typeId}">${entity.typeName}</a>
									<h2><a href="${pageContext.request.contextPath}/portal/article.action?id=${entity.id}"><b>${entity.title}</b></a></h2>
									<p>
										${entity.describeArticle}
										<a href="${pageContext.request.contextPath}/portal/article.action?id=${entity.id}"> 阅读更多…</a>
									</p>

								</div>
							</div>
						</div>
					</c:forEach>
					
					<div class="page">
						<ul id="page" class="pagination"></ul>
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
	var currentPage = "${pageInfo.pageNum}";
	var pageCount = "${pageInfo.pages}";

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
			$("#main-content").css("margin-bottom", diff-100+"px");
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
	
	javaex.page({	
		id : "page",	// 分页id
		pageCount : pageCount,	// 总页数
		currentPage : currentPage,	// 默认选中第几页
		position : "center",
		// 返回当前选中的页数
		callback:function(rtn) {
			window.location.href = "${pageContext.request.contextPath}/portal/search.action"
					+ "?pageNum="+rtn
					+ "&keyWord=${keyWord}";
		}
	});
</script>
</html>
