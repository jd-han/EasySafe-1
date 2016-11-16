<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- JQuery import -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>성분명 검색 결과</title>
</head>
<body>
	검색결과<br>
	<c:forEach items="${chemList}" var="chemVO">
		<a href="chemDetail?name=${chemVO.name}">${chemVO.name}</a><br>
	</c:forEach>
	
	<script type="text/javascript">
		/* $(document).ready(function(){
			alert("성분검색페이지 진입");			
		}); */
	</script>
</body>
</html>