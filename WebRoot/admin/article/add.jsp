<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <meta name="viewport" content="width=device-width">        
  <link rel="stylesheet" href="/admin/css/templatemo_main.css">
  
  <%@ include file="/common/ueditor.jsp"%>
</head>
<body>
  
  	<%@ include file="/admin/header.jsp"%>
  
    <%@ include file="/admin/menu.jsp"%>

    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
          <ol class="breadcrumb">
            <li><a href="index.html">Admin Panel</a></li>
            <li><a href="#">Manage Users</a></li>
            <li class="active">文章管理界面</li>
          </ol>
          <h1>文章管理界面 -  创建 </h1>
          
          <%@ include file="/admin/article/_form.jsp" %>
          
        </div>
      </div>
	
	<%@ include file="/admin/footer.jsp"%>
	<script type="text/javascript">
	function submitForm(){
		var path = "/admin/article/save";
		$('#templatemo-preferences-form').attr("action", path).submit();
	}
	</script>
</body>
</html>