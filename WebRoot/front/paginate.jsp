<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%
// 如下参数需要在 include 该页面的地方被赋值才能使用，以下是示例
/*  
	<c:set var="currentPage" value="${articlePage.pageNumber}" />
	<c:set var="totalPage" value="${articlePage.totalPage}" />
	<c:set var="actionUrl" value="/admin/article" />
	<c:set var="urlParas" value="" />
*/
%>

<c:if test="${urlParas == null}">
	<c:set var="urlParas" value="" />
</c:if>
<c:if test="${(totalPage > 0) && (currentPage <= totalPage)}">
	<c:set var="startPage" value="${currentPage - 4}" />
	<c:if test="${startPage < 1}" >
		<c:set var="startPage" value="1" />
	</c:if>
	<c:set var="endPage" value="${currentPage + 4}" />
	<c:if test="${endPage > totalPage}" >
		<c:set var="endPage" value="totalPage" />
	</c:if>
	
	<div class="pagination">
		<c:if test="${currentPage <= 8}">
			<c:set var="startPage" value="1" />
		</c:if>
		
		<c:if test="${(totalPage - currentPage) < 8}">
			<c:set var="endPage" value="${totalPage}" />
		</c:if>
		
		<c:choose>
			<c:when test="${currentPage == 1}">
				<span class="disabled button previous">上页</span>
			</c:when>
			<c:otherwise>
				<a href="${actionUrl}${currentPage - 1}${urlParas}" class="button previous">上页</a>
			</c:otherwise>
		</c:choose>
		
		<div class="pages">
		<c:if test="${currentPage > 8}">
			<a href="${actionUrl}${1}${urlParas}">${1}</a>
			<a href="${actionUrl}${2}${urlParas}">${2}</a>
			<span>&hellip;</span>
		</c:if>
		
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<c:choose>
				<c:when test="${currentPage == i}">
					<span class="active">${i}</span>
				</c:when>
				<c:otherwise>
					<a href="${actionUrl}${i}${urlParas}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${(totalPage - currentPage) >= 8}">
			<span>&hellip;</span>
			<a href="${actionUrl}${totalPage - 1}${urlParas}">${totalPage - 1}</a>
			<a href="${actionUrl}${totalPage}${urlParas}">${totalPage}</a>
		</c:if>
		</div>
		
		<c:choose>
			<c:when test="${currentPage == totalPage}">
				<span class="disabled button next">下页</span>
			</c:when>
			<c:otherwise>
				<a href="${actionUrl}${currentPage + 1}${urlParas}" class="button next" rel="next">下页</a>
			</c:otherwise>
		</c:choose>
	</div>
</c:if>