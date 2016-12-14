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
	a:HOVER{
		background-color: skyblue !important;
		transition: 0.5s;
	}
	span{
		white-space: nowrap;
		text-overflow: ellipsis;
	}
</style>
</head>
<body>
<%@ include file="nav.jsp" %>
	<div class="container" id="main">
		<c:choose>		
			<c:when test="${!empty chemList}">
			<div class="well tifont">
				성분 검색 결과
			</div>
			<aa class="list-group-item result" style="font-size: 20px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>성분명</label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;									
			<span class="safemarks">
				<label style="margin-left: -30px; width: 200px;">안전성 여부</label>
			</span>
			</aa>
			<c:forEach items="${chemList}" var="chemVO">
				<div class="mar">
					<a class="list-group-item result" style="font-size: 20px;" href="chemDetail.do?compo=${chemVO.name}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					${chemVO.name}
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
		</c:when>
		<c:when test="${!empty proList}">
			<div class="well tifont">
				제품 검색 결과
			</div>
			<aa class="list-group-item result">				
				<span style="display:inline-block; width: 10%;"><label>이미지</label></span>
				<span style="display:inline-block; width: 50%; text-align: center;"><label>제품명</label></span>
				<span style="display:inline-block; width: 25%; text-align: center;"><label>제조사</label></span>
				<span style="display:inline-block; width: 10%; text-align: center;"><label>제품분류</label></span>				
			</aa>
			<c:forEach items="${proList}" var="proVO">
				<a class="list-group-item result" href="productDetail.do?name=${proVO.name}&code=${proVO.code}&seqcode=${proVO.seqcode}">
					<span style="display:inline-block; width: 10%;"><img style="width: 40px; height: 40px;" src="${proVO.thumimg}" /></span>
					<span style="display:inline-block; width: 50%; text-align: center;">${proVO.name}</span>
					<span style="display:inline-block; width: 25%; text-align: center;">${proVO.producer}</span>
					<span style="display:inline-block; width: 10%; text-align: center;">${proVO.type}</span>
				</a>					
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="well">
				<h1>${keyword}에 대한 검색 결과가 없습니다.</h1>
			</div>
			<a class="well" style="display: block;" target="_blank" href="https://search.naver.com/search.naver?query=${keyword}">
				<span>
					<img width="50px;" src="${pageContext.request.contextPath}/resources/media/img/naverlogo.png" />
				</span>
				<span>네이버에서 ${keyword}를 검색</span>
			</a>
			<a class="well" style="display: block;" target="_blank" href="https://www.google.co.kr/search?q=${keyword}">
				<span>
					<img width="50px;" src="${pageContext.request.contextPath}/resources/media/img/googlelogo.png" />
				</span>
				<span>구글에서 ${keyword}를 검색</span>
			</a>
			<a class="well" style="display: block;" target="_blank" href="https://ko.wikipedia.org/wiki/${keyword}">
				<span>
					<img width="50px;" src="${pageContext.request.contextPath}/resources/media/img/wikilogo.png" />
				</span>
				<span>위키백과에서 ${keyword}를 검색</span>
			</a>
		</c:otherwise>
		</c:choose>		
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			var left = $(".result").css("left");
			$(".result").css("position", "absolute !important");
			$(".result").css("left", "0px !important");
			/* $(".result").css("position", "relative !important");
			$(".result").animate({"left": left + " !important"}, 'slow'); */
		});
	</script>
</body>
</html>