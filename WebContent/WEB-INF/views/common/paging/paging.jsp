<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징 영역</title>
<link href="<%= request.getContextPath() %>/resources/css/common/paging/paging.css" rel="stylesheet">
</head>
<body>
<ul>
	<%-- start page --%>
	<c:choose>
		<c:when test="${ pi.startPage < pi.pageLimit }">
			<c:set var="startPage" value="1"/>
		</c:when>
		<c:otherwise>
			<c:set var="startPage" value="${pi.startPage -  pi.pageLimit}"/>
		</c:otherwise>
	</c:choose>
	<%-- end page --%>
	<c:choose>
		<c:when test="${ pi.endPage + 1 <= pi.maxPage }">
			<c:set var="endPage" value="${ pi.endPage + 1 }"/>
		</c:when>
		<c:otherwise>
			<c:set var="endPage" value="${ pi.maxPage }"/>
		</c:otherwise>
	</c:choose>

	
	<li><a <c:if test="${ pi.page != 1 }">href="${ url }?page=${ startPage }" class="active"</c:if> <c:if test="${ pi.page == 1 }">tabindex = -1</c:if>>앞으로 10페이지 이동</a></li>
<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	<li><a href="${ url }?page=${ p }" <c:if test="${ pi.page == p }">class="now"</c:if>>${ p }</a></li>
</c:forEach>
	<li><a <c:if test="${ pi.page != pi.maxPage }">href="${ url }?page=${ endPage }" class="active"</c:if> <c:if test="${ pi.page == pi.maxPage }">tabindex = -1</c:if>>뒤로 10페이지 이동</a></li>
</ul>
</body>
</html>