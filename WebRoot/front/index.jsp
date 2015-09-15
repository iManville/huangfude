<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>黄复得的博客  --  huangfude.com</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/front/assets/css/main.css" />
	</head>
	<body>
	
		<!-- Content -->
			<div id="content">
				<div class="inner">

				<c:forEach items="${articlePage.list}" var="article">
					<!-- Post -->
						<article class="box post post-excerpt">
							<header>
								<h2><a href="/view_article/${article.id}">${article.title}</a></h2>
							</header>
							<div class="info">
								<span class="date"><span class="month">Jul</span> <span class="day">14</span><span class="year">2015</span></span>
								<!--
									Note: You can change the number of list items in "stats" to whatever you want.
								-->
								<ul class="stats">								
									
									<li><a href="#" class="icon fa-heart">原创</a></li>
								</ul>
								
							</div>

							<p>
								${article.content}
							</p>

						</article>
					</c:forEach>

					<!-- Pagination -->
						<div class="pagination">
							<!--<a href="#" class="button previous">Previous Page</a>-->
							<div class="pages">
								<a href="#" class="active">1</a>
								<a href="#">2</a>
								<a href="#">3</a>
								<a href="#">4</a>
								<span>&hellip;</span>
								<a href="#">20</a>
							</div>
							<a href="#" class="button next">Next Page</a>
						</div>

				</div>
			</div>

	<%@ include file="/front/sidebar.jsp"%>
	
	</body>	
</html>
