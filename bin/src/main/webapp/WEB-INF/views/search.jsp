<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>성분명 검색 결과</title>
</head>
<body>
<%@ include file="nav.jsp" %>
	<div class="container" id="main">
		<c:if test="${!empty chemList}">
			<div class="well">
				<h4>성분 검색 결과</h4>
			</div>			
			<c:forEach items="${chemList}" var="chemVO">
				<div class="well">
					<a class="list-group-item" href="chemDetail.do?name=${chemVO.name}">${chemVO.name}</a>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${!empty proList}">
			<div class="well">
				<h4>제품 검색 결과</h4>
			</div>
			<c:forEach items="${proList}" var="proVO">
				<div class="well">
					<a class="list-group-item" href="productDetail.do?name=${proVO.name}">${proVO.name}</a>
				</div>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>