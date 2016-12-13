<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>성분 상세 정보</title>
<style type="text/css">
	.tifont{
		font-size: 40px;
		width: 85%;
		display: inline-block !important;
		height: 128px;
		margin-left: 1.6%;		
	}
	.well{
		border-radius: 5px !important;
	}
	.table{
		border: 1px solid black;
		text-align: center;
	}
	img{
		margin-left: 0px;
	}
	.icon{
		width: 12%;
		float: left;
		display: inline-block !important;
		height: 128px;
		margin-left: 15px;
		margin-top: 10px;
	}
	.kan{
		float: left;
		margin-left: 1%;
		width: 13.42%;
		text-align: center;
		border-radius: 50% !important;
	}
	hr{
		border-top: 2px solid gray !important;
	}
</style>
</head>
<body>
<%@ include file="nav.jsp" %>
	<div class="container" id="main">
	<c:choose>
		<c:when test="${!empty chemResult}">
		<div style="width: 100%;">
			<div class="icon">				
				<c:choose>
					<c:when test="${chemResult.avg eq 'A'}">
						<img style="margin-left: 0px !important;" data-toggle="tooltip" data-placement="bottom" title="해당 성분이 안전함을 나타냅니다" width="120px;" src="${pageContext.request.contextPath}/resources/media/img/safehex.png" />
						</c:when>
						<c:when test="${chemResult.avg eq 'I'}">
						<img style="margin-left: 0px !important;" data-toggle="tooltip" data-placement="bottom" title="해당 성분에 대해 주의사항이 있음을 나타냅니다" width="120px;" src="${pageContext.request.contextPath}/resources/media/img/warninghex.png" />
						</c:when>
						<c:when test="${chemResult.avg eq 'B'}">
						<img style="margin-left: 0px !important;" data-toggle="tooltip" data-placement="bottom" title="해당 성분은 위험하여 금지됬음을 나타냅니다" width="120px;" src="${pageContext.request.contextPath}/resources/media/img/dangerhex.png" />
						</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</div>
			<div class="well tifont">
				${chemResult.name}
				<br>
				<label style="font-size: 20px; font-weight: normal;">용도 : ${chemResult.type}</label>
			</div>
		</div>
			<br>
			<!-- <div class="panel panel-default"> -->
				<div class="well" style="font-size: 30px; text-align: center;">
					국가별 안정성 지표
				</div>
				<div>
					<div class="well kan" style="margin-left: 0px !important;">
						<img class="center-block" width="50px;" src="${pageContext.request.contextPath}/resources/media/img/UN.png" /> CODEX
						<hr>
						<c:choose>
							<c:when test="${chemResult.codex eq 'A'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분이 안전함을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/safehex.png" />
							</c:when>
							<c:when test="${chemResult.codex eq 'I'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분에 대해 주의사항이 있음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/warninghex.png" />								
							</c:when>
							<c:when test="${chemResult.codex eq 'B'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분은 위험하여 금지됬음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/dangerhex.png" />
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>						
					</div>
					<div class="well kan">
						<img class="center-block" width="50px;" src="${pageContext.request.contextPath}/resources/media/img/USA.png" /> 미국
						<hr>
						<c:choose>
							<c:when test="${chemResult.us eq 'A'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분이 안전함을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/safehex.png" />
							</c:when>
							<c:when test="${chemResult.us eq 'I'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분에 대해 주의사항이 있음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/warninghex.png" />
							</c:when>
							<c:when test="${chemResult.us eq 'B'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분은 위험하여 금지됬음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/dangerhex.png" />
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</div>
					<div class="well kan">
						<img class="center-block" width="50px;" src="${pageContext.request.contextPath}/resources/media/img/KOR.png" /> 한국
						<hr>
						<c:choose>
							<c:when test="${chemResult.korea eq 'A'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분이 안전함을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/safehex.png" />
							</c:when>
							<c:when test="${chemResult.korea eq 'I'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분에 대해 주의사항이 있음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/warninghex.png" />
							</c:when>
							<c:when test="${chemResult.korea eq 'B'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분은 위험하여 금지됬음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/dangerhex.png" />
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</div>
					<div class="well kan">
						<img class="center-block" width="50px;" src="${pageContext.request.contextPath}/resources/media/img/EU.png" /> 유럽
						<hr>
						<c:choose>
							<c:when test="${chemResult.eu eq 'A'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분이 안전함을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/safehex.png" />
							</c:when>
							<c:when test="${chemResult.eu eq 'I'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분에 대해 주의사항이 있음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/warninghex.png" />
							</c:when>
							<c:when test="${chemResult.eu eq 'B'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분은 위험하여 금지됬음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/dangerhex.png" />
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</div>
					<div class="well kan">
						<img class="center-block" width="50px;" src="${pageContext.request.contextPath}/resources/media/img/JPN.png" /> 일본
						<hr>
						<c:choose>
							<c:when test="${chemResult.japan eq 'A'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분이 안전함을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/safehex.png" />
							</c:when>
							<c:when test="${chemResult.japan eq 'I'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분에 대해 주의사항이 있음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/warninghex.png" />
							</c:when>
							<c:when test="${chemResult.japan eq 'B'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분은 위험하여 금지됬음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/dangerhex.png" />
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</div>
					<div class="well kan">
						<img class="center-block" width="50px;" src="${pageContext.request.contextPath}/resources/media/img/CHINA.png" /> 중국
						<hr>
						<c:choose>
							<c:when test="${chemResult.china eq 'A'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분이 안전함을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/safehex.png" />
							</c:when>
							<c:when test="${chemResult.china eq 'I'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분에 대해 주의사항이 있음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/warninghex.png" />
							</c:when>
							<c:when test="${chemResult.china eq 'B'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분은 위험하여 금지됬음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/dangerhex.png" />
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</div>
					<div class="well kan">
						<img class="center-block" width="50px;" src="${pageContext.request.contextPath}/resources/media/img/AUS.png" /> 호주
						<hr>
						<c:choose>
							<c:when test="${chemResult.australia eq 'A'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분이 안전함을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/safehex.png" />
							</c:when>
							<c:when test="${chemResult.australia eq 'I'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분에 대해 주의사항이 있음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/warninghex.png" />
							</c:when>
							<c:when test="${chemResult.australia eq 'B'}">
							<img data-toggle="tooltip" data-placement="bottom" title="해당 성분은 위험하여 금지됬음을 나타냅니다" width="70px;" src="${pageContext.request.contextPath}/resources/media/img/dangerhex.png" />
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</div>				
				</div>
			<div class="well" style="font-size: 40px; clear: left;">
				해당 성분이 포함된 제품 목록			
			</div>
			<div class="well" style="font-size: 20px;">
			<c:choose>		
				<c:when test="${!empty productResult}">
					<c:forEach items="${productResult}" var="prodVO">
						<a class="list-group-item" href="productDetail.do?name=${prodVO.name}">${prodVO.name}</a>					
					</c:forEach>
				</c:when>
				<c:otherwise>
					<span style="font-size: 40px;">해당 성분이 포함된 제품의 정보가 없습니다.</span>
				</c:otherwise>
			</c:choose>
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
		});
	</script>
</body>
</html>