<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%
// 如下参数需要在 include 该页面的地方被赋值才能使用，以下是示例
/*  
	<c:set var="currentPage" value="${articlePage.pageNumber}" />
	<c:set var="totalPage" value="${articlePage.totalPage}" />
	<c:set var="actionUrl" value="/admin/article/" />
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
	
	<ul class="pagination pull-right">
		<c:if test="${currentPage <= 8}">
			<c:set var="startPage" value="1" />
		</c:if>
		
		<c:if test="${(totalPage - currentPage) < 8}">
			<c:set var="endPage" value="${totalPage}" />
		</c:if>
		
		<c:choose>
			<c:when test="${currentPage == 1}">
				<li class="disabled"><a href="#">&laquo;</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${actionUrl}${currentPage - 1}${urlParas}">&laquo;</a></li>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${currentPage > 8}">
			<a href="${actionUrl}${1}${urlParas}">${1}</a>
			<a href="${actionUrl}${2}${urlParas}">${2}</a>
		</c:if>
		
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<c:choose>
				<c:when test="${currentPage == i}">
					<li class="active"><a href="#">${i} <span class="sr-only">(current)</span></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${actionUrl}${i}${urlParas}">${i} <span class="sr-only">(current)</span></a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${(totalPage - currentPage) >= 8}">
			<a href="${actionUrl}${totalPage - 1}${urlParas}">${totalPage - 1}</a>
			<a href="${actionUrl}${totalPage}${urlParas}">${totalPage}</a>
		</c:if>
		
		<c:choose>
			<c:when test="${currentPage == totalPage}">
				<li class="disabled"><a href="#">&raquo;</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${actionUrl}${currentPage + 1}${urlParas}">&raquo;</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</c:if>