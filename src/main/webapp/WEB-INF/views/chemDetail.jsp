<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>성분 상세 정보</title>
</head>
<body>
<%@ include file="nav.jsp" %>
	<div class="container" id="main">
	<c:choose>
		<c:when test="${!empty chemResult}">
			<div class="well">
				<h1>${chemResult.name}</h1>
			</div><br><br>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>국가별 안정성</h4>
				</div>
				<div class="panel-body">
					<div class="list-group">
					미국 : ${chemResult.us}<br>
					유럽 : ${chemResult.eu}<br>
					일본 : ${chemResult.japan}<br>
					중국 : ${chemResult.china}<br>
					호주 : ${chemResult.australia}<br>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="well">
				<h1>해당 성분에 대한 정보가 없습니다.</h1>
			</div>
		</c:otherwise>
	</c:choose>		
	</div>	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#curPage").html("성분상세");
			alert(chemResult);
		});
	</script>
</body>
</html>