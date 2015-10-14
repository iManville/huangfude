<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- Sidebar -->
<div id="sidebar">

	<!-- Logo -->
	<h1 id="logo">
		<a href="http://www.huangfude.com/">黄复得</a>
	</h1>

	<!-- Nav -->
	<nav id="nav">
		<ul>
			<li<c:if test="${curFolder_id==0}"> class="current"</c:if>>
			<a href="/1-0">所有文章列表</a></li>
			<li<c:if test="${curFolder_id==1}"> class="current"</c:if>>
			<a href="/1-1">技术</a></li>
			<li><a href="/front/node.html" target="_blank">Node入门</a></li>
			<!--
			<li><a href="#">关于我</a></li>
			-->
		</ul>
	</nav>

	<!-- Search -->
	<section class="box search">
		<form method="post" action="/search">
			<input type="text" class="text" name="keyword" placeholder="Search" />
		</form>
	</section>

	<!-- Text -->
	<section class="box text-style1">
		<div class="inner">
			<p>
				<strong>黄复得：</strong> 一个程序员的独白。  <a
					href="https://github.com/imanville">Fork me on GitHub</a>
			</p>
		</div>
	</section>

	<!-- Recent Posts -->
	<section class="box recent-posts">
		<header>
			<h2>标&nbsp;&nbsp;签</h2>
		</header>
		<ul>
			<c:forEach items="${tagnamelist}" var="item">
			<li><a href="/tag?tagname=${item[0]}">${item[0]}</a>(${item[1]})</li>
			</c:forEach>
		</ul>
	</section>
	<!-- Copyright -->
	<ul id="copyright">
		<li>&copy; Huangfude.</li>
		<li>基于STRIPED主题二次开发</li>
	</ul>

</div>

<!-- Scripts -->
<script src="/front/assets/js/jquery.min.js"></script>
<script src="/front/assets/js/skel.min.js"></script>
<script src="/front/assets/js/util.js"></script>
<script src="/front/assets/js/main.js"></script>
