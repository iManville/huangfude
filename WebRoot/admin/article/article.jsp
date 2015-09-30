<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>文章管理</title>
  <meta name="viewport" content="width=device-width">        
  <link rel="stylesheet" href="/admin/css/templatemo_main.css">
</head>
<body>
  
  	<%@ include file="/admin/header.jsp"%>
  
    <%@ include file="/admin/menu.jsp"%>

    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
          <ol class="breadcrumb">
            <li><a href="/admin">后台首页</a></li>
            <li><a href="/admin/article">文章管理</a></li>
            <li class="active">文章管理界面</li>
          </ol>
          <h1>文章管理界面</h1>

          <div class="row margin-bottom-30">
            <div class="col-md-12">
              <ul class="nav nav-pills">
                <li class="active"><a href="/admin/article/add">新建文章</a></li>
              </ul>          
            </div>
          </div> 
          <div class="row">
            <div class="col-md-12">
              <div class="btn-group pull-right" id="templatemo_sort_btn">
                <button type="button" class="btn btn-default">排序</button>
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                  <span class="caret"></span>
                  <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">目录</a></li>
                  <li><a href="#">状态</a></li>
                  <li><a href="#">发布时间</a></li>
                </ul>
              </div>
              <div class="table-responsive">
                <h4 class="margin-bottom-15">文章列表</h4>
                <table class="table table-striped table-hover table-bordered">
                  <thead>
                    <tr>
                      <th>序号</th>
                      <th>目录</th>
                      <th>标题</th>
                      <th>类型</th>
                      <th>状态</th>
                      <th>发布时间</th>
                      <th>操作</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${articlePage.list}" var="article" varStatus="status">
                    <tr>
                      <td>${ status.index + 1}</td>
                      <td>${article.folder_id}</td>
                      <td>${article.title}</td>
                      <td>${article.type}</td>
                      <td>${article.status}</td>                    
                      <td>${article.publish_time}</td>
                      <td>
                      <a href="/admin/article/edit/${article.id}" class="btn btn-default">修改</a>
                      <a href="/admin/article/delete/${article.id}" class="btn btn-link">删除</a>
                      </td>
                    </tr>
                    </c:forEach>                  
                  </tbody>
                </table>
              </div>
			  
			  <!-- Pagination -->
				<c:set var="currentPage" value="${articlePage.pageNumber}" />
				<c:set var="totalPage" value="${articlePage.totalPage}" />
				<c:set var="actionUrl" value="/admin/article/" />
				<c:set var="urlParas" value="" />
				<%@ include file="/admin/paginate.jsp"%>
						
            </div>
          </div>
        </div>
      </div>
	
	<%@ include file="/admin/footer.jsp"%>

</body>
</html>
