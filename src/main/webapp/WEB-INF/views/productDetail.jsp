<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 검색 상세 페이지</title>
</head>
<body>
<%@ include file="nav.jsp" %>
	<div class="container" id="main">
		<div class="well">
			<h1>${productResult.name}</h1>
		</div>
		<div style="float: left; width: 100%;" class="well">
			<img class="well" style="width: 50%;" src="${productResult.thumimg}" />
			<div style="float: right; width: 50%;">
				<div class="well">
					<h4>제조사</h4>
					${productResult.producer}	
				</div>
				<div style="width: 100%;" class="well">
					<h4>제품에 포함된 성분들</h4>			
					<c:if test="${!empty productResult}">
						<c:forEach items="${components}" var="compo">
						<div class="list-group">
							<a href="chemDetail.do?name=${compo}">${compo}</a><br>
						</div>
						</c:forEach>
					</c:if>	
				</div>
			</div>
		</div>
		<br>
		<br>
		
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#curPage").html("제품 검색 결과");
		});
	</script>
</body>
</html>