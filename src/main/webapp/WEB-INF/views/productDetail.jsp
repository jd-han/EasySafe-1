<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 검색 상세 페이지</title>
</head>
<body>
	제품 검색 결과<br>
	제품명 : ${productResult.name}<br>
	==성분들==<br>
	<c:forEach items="${components}" var="compo">
		<a href="chemDetail.do?name=${compo}">${compo}</a><br>
	</c:forEach>
</body>
</html>