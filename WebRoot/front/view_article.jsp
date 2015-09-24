<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
	<head>
	<title>${article.title} - 黄复得</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/front/assets/css/main.css" />
		<%@ include file="/common/syntaxhighlighter.jsp"%>
	</head>
	<body>
	
		<!-- Content -->
			<div id="content">
				<div class="inner">
				
					<!-- Post -->
						<article class="box post post-excerpt">
							<header>
								<h2><a href="/viewArticle/${article.id}">${article.title}</a></h2>
							</header>
							<div class="info">
								<c:set var="dateParts" value="${fn:split(article.publish_time, '-')}" />
								<span class="date"><span class="month">${dateParts[1]}</span> <span class="day">${dateParts[2]}</span> <span class="year">${dateParts[0]}</span></span>
								<ul class="stats">												
									<li>
									<c:if test="${article.type==1}">
									<span class="icon fa-heart">原创</span>
									</c:if>
									<c:if test="${article.type==2}">
									<span class="icon fa-comment">转载</span>
									</c:if>
									</li>
								</ul>
								
							</div>

							<p>
								${article.content}
							</p>

						</article>



				</div>
			</div>

	<%@ include file="/front/sidebar.jsp"%>
	
	</body>	
</html>
