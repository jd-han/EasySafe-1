<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 검색 상세 페이지</title>
<style type="text/css">
	a:HOVER{
		background-color: skyblue !important;
		transition: 0.5s;
	}
</style>
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
						<aa style="font-size: 20px;" class="list-group-item">
							<span style="width: 75%; display: inline-block;"><label>성분명</label></span>
							<span class="pull-right" style="width: 25%; display: inline-block;"><label>안전성 여부</label></span>
						</aa>
						<c:forEach items="${components}" var="compo">
						<!-- <div class="list-group-item"> -->
							<a style="font-size: 20px;" class="list-group-item" href="chemDetail.do?compo=${compo.name}">
								${compo.name}
							<c:choose>
								<c:when test="${compo.avg eq 'A'}">
									<img class="pull-right" style="margin: -6px 40px 0 0; width: 40px; height: 40px;" data-toggle="tooltip" data-placement="bottom" title="해당 성분이 안전함을 나타냅니다" width="120px;" src="${pageContext.request.contextPath}/resources/media/img/safehex.png" />
									</c:when>
									<c:when test="${compo.avg eq 'I'}">
									<img class="pull-right" style="margin: -6px 40px 0 0; width: 40px; height: 40px;" data-toggle="tooltip" data-placement="bottom" title="해당 성분에 대해 주의사항이 있음을 나타냅니다" width="120px;" src="${pageContext.request.contextPath}/resources/media/img/warninghex.png" />
									</c:when>
									<c:when test="${compo.avg eq 'B'}">
									<img class="pull-right" style="margin: -6px 40px 0 0; width: 40px; height: 40px;" data-toggle="tooltip" data-placement="bottom" title="해당 성분은 위험하여 금지됬음을 나타냅니다" width="120px;" src="${pageContext.request.contextPath}/resources/media/img/dangerhex.png" />
									</c:when>
								<c:otherwise>
									<img class="pull-right" style="margin: -6px 40px 0 0; width: 40px; height: 40px;" data-toggle="tooltip" data-placement="bottom" title="해당 성분은 식품원재료임을 나타냅니다" width="120px;" src="${pageContext.request.contextPath}/resources/media/img/nothex.png" />
								</c:otherwise>
							</c:choose>
							</a>
						<!-- </div> -->
						</c:forEach>						
					</c:if>	
				</div>
			</div>
		</div>
		<br>
		<br>		
	</div>
</body>
</html>