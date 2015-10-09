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
								<h2><a href="/view_article/${article.id}">${article.title}</a></h2>
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
							<p>
								标签：${tagsname}
							</p>

							<!-- JiaThis Button BEGIN -->
							<div class="jiathis_style_24x24">
								<a class="jiathis_button_qzone"></a>
								<a class="jiathis_button_tsina"></a>
								<a class="jiathis_button_tqq"></a>
								<a class="jiathis_button_weixin"></a>
								<a class="jiathis_button_renren"></a>
								<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
							</div>
							<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
							<!-- JiaThis Button END -->
						</article>
						
						<c:if test="${last_id!=''}">
						<p><b>上一篇：</b><a href="/view_article/${last_id}">${last_title}</a></p>
						</c:if>
						<c:if test="${next_id!=''}">
						<p><b>下一篇：</b><a href="/view_article/${next_id}">${next_title}</a></p>
						</c:if>


				</div>
			</div>

	<%@ include file="/front/sidebar.jsp"%>
	
	</body>	
</html>
