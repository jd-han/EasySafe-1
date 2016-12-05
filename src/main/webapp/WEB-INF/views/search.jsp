<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>성분명 검색 결과</title>
<style type="text/css">
	.mar{
		margin-bottom: 20px;
	}
	.tifont{
		font-size: 40px;
	}
	.result{
		height: 60px;
		line-height: 40px;
		position: relative; 
		left: 0px;
	}
	.safemarks{
		top: 6px;
		position: absolute;		
		left: 1000px;	
	}
</style>
</head>
<body>
<%@ include file="nav.jsp" %>
	<div class="container" id="main">
		<c:if test="${!empty chemList}">
			<div class="well tifont">
				성분 검색 결과
			</div>			
			<c:forEach items="${chemList}" var="chemVO">
				<div class="mar">
					<a class="list-group-item result" href="chemDetail.do?name=${chemVO.name}">${chemVO.name}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;									
					<span class="safemarks">
						<c:choose>
							<c:when test="${chemVO.avg eq 'A'}">
							<img width="50px;" src="${pageContext.request.contextPath}/resources/media/img/safehex.png" />
							</c:when>
							<c:when test="${chemVO.avg eq 'I'}">
							<img width="50px;" src="${pageContext.request.contextPath}/resources/media/img/warninghex.png" />
							</c:when>
							<c:when test="${chemVO.avg eq 'B'}">
							<img width="50px;" src="${pageContext.request.contextPath}/resources/media/img/dangerhex.png" />
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</span>
					</a>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${!empty proList}">
			<div class="well tifont">
				제품 검색 결과
			</div>
			<c:forEach items="${proList}" var="proVO">
				<a class="list-group-item result" href="productDetail.do?name=${proVO.name}">${proVO.name}</a>					
			</c:forEach>
		</c:if>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#curPage").html("검색결과");
			var left = $(".result").css("left");
			$(".result").css("position", "absolute !important");
			$(".result").css("left", "0px !important");
			/* $(".result").css("position", "relative !important");
			$(".result").animate({"left": left + " !important"}, 'slow'); */
		});
	</script>
</body>
</html>