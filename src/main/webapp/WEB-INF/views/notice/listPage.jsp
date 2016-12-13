<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>EasySafe - 공지사항</title>
<meta name="generator" content="Bootply" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/styles.css"
	type="text/css" />
</head>
<body>
<%@ include file="../nav.jsp" %>
	<!--main-->
	<div class="container" id="main">
		<!-- <div class="row">
			<!-- <div class="col-md-12">	
			<div class="col-xs-1"></div>
			<div class="col-xs-10 col-xs-12">
			<div class="well">
			
			</div>-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<span class="fa fa-newspaper-o fa-2x"></span>
						<b style="font-size: 30px;">공지사항</b>
						<br><br>
						<form class="form-inline">
							<select name="searchType" class="form-control">
								<option value="no" <c:out value="${cri.searchType == null?'selected':''}"/>>
									검색유형을 선택하세요
								</option>
								<option value="title" <c:out value="${cri.searchType eq 'title'?'selected':''}"/>>
									제목으로 검색
								</option>
								<option value="content"	<c:out value="${cri.searchType eq 'content'?'selected':''}"/>>
									내용으로 검색
								</option>
								<option value="titlecontent" <c:out value="${cri.searchType eq 'titlecontent'?'selected':''}"/>>
									제목이나 내용으로 검색
								</option>
							</select>
							<div class="input-group text-center">
								<input type="text" class="form-control" placeholder="검색어 입력" name='keyword' id="keywordInput" value='${cri.keyword }'/>
								<span class="input-group-btn">
									<button id="searchBtn" class="btn btn-success" type="button">검색</button>
								</span>
							</div>
								<!-- <a id='searchBtn' class="btn btn-success" href="#">검색</a> -->
						</form>
					<hr>
					</div>
					<div class="panel-body">
					<div class="col-xs-6">
						<table class="table" style="border: 1px solid black;">
							<tr>
								<td class="col-xs-4" style="padding-left: 15%;"><span class="fa fa-header fa-2x"></span>
									<b>제목</b>
								</td>
								<td class="col-xs-2" style="text-align: center;"><span class="fa fa-clock-o fa-2x"></span>
									<b>작성일자</b>
								</td>
							</tr>
							<c:forEach items="${list}" var="noticeVO">
							<tr>
								<td><a href='/notice/read.do${pageMaker.makeSearch(pageMaker.cri.page)}&no=${noticeVO.noticeNo}'>${noticeVO.title}</a></td> 
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${noticeVO.regDate}" /></td>								
							</tr>
							</c:forEach>
						</table>
						<c:if test="${uvo.ulevel eq 'admin'}">
							<!-- <div class="col-xs-7"></div>
							<div class="col-xs-3"></div> -->
							<div class="col-xs-2" >
								<a class="btn btn-primary pull-left"
									href="/notice/create.do" type="button">공지 작성</a>
							</div>						
						</c:if>
						<div class="col-xs-6" style="margin-top: 40px; margin-left: 50px;">
							<ul class="pagination center-block"	style="display: inline-block;">
								<!-- 돌아가는  화살표 -->
								<c:if test="${pageMaker.prev}">
								<li><a href="listPage.do${pageMaker.makeSearch(pagemaker.startPage-1)}">«</a></li>
								 </c:if>
								 <!-- 1,2,3,4... -->
								 <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var = "idx">
								<li
								<c:out value="${pageMaker.cri.page ==idx? 'class=active':''}"/>>
								<a href="listPage.do?page=${idx}">${idx}</a>
								</li>
								 </c:forEach>
								<!-- 다음 페이지들로 가는 호ㅏ살표 -->
								<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
								<li><a href="listPage.do${pageMaker.makeSearch(pageMaker.endPage +1) }">»</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<div>
					<a href="${pageContext.request.contextPath}/index.do">
	                <img alt="너구리" src="${pageContext.request.contextPath}/resources/media/img/panda01_nobg.png" 
	                	style="width: 30%; height: 30%; margin-left: 10%; margin-top: 5%;" />
	                </a>
					</div>
						<%-- <div class="list-group">
							<span class="list-group-item">제목 
								<span class="pull-right">작성일자&nbsp;&nbsp;&nbsp;</span>
							</span>
							<c:forEach items="${list}" var="noticeVO">
								<!-- <span class="list-group-item"> -->
								<a href='/notice/read.do${pageMaker.makeSearch(pageMaker.cri.page)}&no=${noticeVO.noticeNo}' class="list-group-item">${noticeVO.title} 
									<span class="pull-right"><fmt:formatDate pattern="yyyy-MM-dd" value="${noticeVO.regDate}" /></span>
								</a>
								<!-- </span> -->
							</c:forEach>
							<!-- 							<a href="http://bootply.com/tagged/modal" class="list-group-item">Modal/ Dialog</a>  -->
						</div> --%>
						<!-- <div class="col-xs-6"></div> -->
					</div>
				</div>
			</div>
		<!-- </div></div></div> -->
		<!-- <div class="row">
			<div class="col-md-12">
			<div class="col-xs-1"></div>
			<div class="col-xs-10 col-xs-12"> -->
<!-- 			<div class="col-md-4 col-sm-12"> -->
			<%-- <img height="60px" width="1200px" alt="easysafe" src="${pageContext.request.contextPath}/resources/media/img/clear.png"> --%>
                   			
			<!-- </div>
		</div></div> -->		
<script type="text/javascript">
$(document).ready(function(){
	$("#curPage").html("Notice");
	$('#searchBtn').on(
			"click",
			function (event) {
				self.location="listPage.do"
						+'${pageMaker.makeQuery(1)}'
						+"&searchType="
						+$("select option:selected").val()
						+"&keyword="+$('#keywordInput').val();
							}
					);
})
</script>		
</body>
</html>
