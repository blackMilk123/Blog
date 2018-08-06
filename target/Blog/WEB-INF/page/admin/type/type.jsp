<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="wrap">
    <!-- 头部 -->
    <div id="header">
        <c:import url="../head.jsp"></c:import>
    </div>
    <!-- 左侧菜单和主体内容 -->
    <div class="grid-1-7" style="flex: 1;margin:0;">
        <!-- 左侧菜单 -->
        <c:import url="../menu.jsp"></c:import>
        <!-- 面包屑导航和主体内容 -->
        <div class="content">
            <!--面包屑导航-->
            <div class="content-header">
                <div class="breadcrumb">
                    <span>分类管理</span>
                    <span class="divider">/</span>
                    <span class="active">文章分类</span>
                </div>
            </div>
            <!--全部主体内容-->
            <div class="list-content">
                <!--块元素-->
                <div class="block">
                    <!--页面有多个表格时，可以用于标识表格-->
                    <h2>文章分类列表</h2>
                    <!--正文内容-->
                    <div class="main-20">
                        <!--表格上方的操作元素，添加、删除、搜索等-->
                        <div class="operation-wrap">
                            <div class="buttons-wrap">
                                <button id="add" class="button blue"><span class="icon-plus"></span> 添加分类</button>
                                <button id="save" class="button green"><span class="icon-check"></span> 一键保存</button>
                                <button id="manyDelete" class="button red"><span class="icon-minus"></span> 批量删除</button>
                            </div>
                        </div>
                        <table id="table" class="table">
                            <thead>
                            <tr>
                                <th style="width:20px;"><input type="checkbox" class="fill listen-1"/> </th>
                                <th style="width:30%;">显示排序</th>
                                <th>名称</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="entity" varStatus="status" >
                                <tr>

                                    <td><input type="checkbox" class="fill listen-1-2" name="id" value="${entity.id}" /> </td>
                                    <td><input type="text" class="text" name="sort" data-type="正整数" error-msg="必须输入正整数" value="${entity.sort}" /></td>
                                    <td><input type="text" class="text" name="name" data-type="必填" placeholder="请输入分类名称" value="${entity.typeName}" /></td>
                                    <td>
                                        <button id="delete" onclick="del(${entity.id})" class="button red"><span class="icon-minus">
                                        </span> 删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var idArr = new Array();
    var sortArr = new Array();
    var nameArr = new Array();

    function del(typeId){
        idArr.push(typeId);
        $.ajax({
            url : "manyDelete.json",
            type : "POST",
            dataType : "json",
            traditional : "true",

            data : {
                "idArr" : idArr,
            },
            success:function (rtn) {
                if (rtn.status== 200) {
                    javaex.optTip({
                        content : rtn.msg
                    });
                    // 延迟加载
                    setTimeout(function() {
                        // 刷新页面
                        window.location.reload();
                    }, 2000);
                }else {
                    javaex.optTip({
                        content : rtn.msg,
                        type : "error"
                    });
                }
            }
        })
    }


    // 动态添加tr行
    $("#add").click(function() {
        var html = '';
        html += '<tr>';
        html += '<td><input type="checkbox" class="fill listen-1-2" name="id" value="${entity.id}" /> </td>';
        html += '<td><input type="text" class="text" name="sort" data-type="正整数" error-msg="必须输入正整数" value="${entity.sort}" /></td>';
        html += '<td><input type="text" class="text" name="name" data-type="必填" placeholder="请输入分类名称" value="" /></td>';
        html += '</tr>';

        $("#table tbody").append(html);
        // 重新渲染
        javaex.render();
    });
    /*保存*/
    $("#save").click(function () {

        idArr = [];
        sortArr = [];
        nameArr = [];
        //id
        /*这是获取全部复选框id*/
        $('input[name="id"]').each(function() {
            idArr.push($(this).val());
        });

        // sort
        $('input[name="sort"]').each(function() {
            sortArr.push($(this).val());
        });
        //name
        // name
        $('input[name="name"]').each(function() {
            nameArr.push($(this).val());
        });
        $.ajax({
            url : "save.json",
            type : "POST",
            dataType : "json",
            traditional : "true",
            data : {
                "idArr" : idArr,
                "sortArr" : sortArr,
                "nameArr" : nameArr
            },
            success : function(rtn) {
                if (rtn.status== 200) {
                    javaex.optTip({
                        content : rtn.msg
                    });
                    // 建议延迟加载
                    setTimeout(function() {
                        // 刷新页面
                        window.location.reload();
                    }, 2000);
                } else {
                    javaex.optTip({
                        content : rtn.msg,
                        type : "error"
                    });
                }
            }
        });
    })
    /*批量删除*/
    $("#manyDelete").click(function () {
        idArr = [];

        /*这是获取复选框id*/
        $('input[name="id"]:checked').each(function() {
            idArr.push($(this).val());
        });
        $.ajax({
            url : "manyDelete.json",
            type : "POST",
            dataType : "json",
            traditional : "true",

            data : {
                "idArr" : idArr,
            },
            success:function (rtn) {
                if (rtn.status== 200) {
                    javaex.optTip({
                        content : rtn.msg
                    });
                    // 延迟加载
                    setTimeout(function() {
                        // 刷新页面
                        window.location.reload();
                    }, 2000);
                }else {
                    javaex.optTip({
                        content : rtn.msg,
                        type : "error"
                    });
                }
            }
    })


    })


</script>
</html>
