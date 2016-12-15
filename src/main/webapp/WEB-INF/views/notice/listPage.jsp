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
	
<style type="text/css">
.activeme {
background-color: 	#eef2f7 !important;
}
</style>
</head>
<body>
<%@ include file="../nav.jsp" %>
	<div class="container-fluid" style="padding-top: 85px !important;" id="main">
	<div class="row">
			<div class="col-md-12">
	
			<div class="col-md-1"></div>
			
			<div class="col-md-8" style="padding-right: 0px !important;">
			
		
			
				<div class="panel panel-default">
					<div class="panel-heading">
						<br>
						<span>&nbsp;&nbsp;</span><span class="fa fa-newspaper-o fa-2x"></span>
						<b style="font-size: 30px;">공지사항</b>
					<hr>
					</div>
					
					
					<div class="panel-body">
<!-- 						<table class="table" style="border: 1px solid black;"> -->
<!-- 							<tr> -->
<!-- 								<td class="col-xs-4" style="padding-left: 15%;"><span class="fa fa-header fa-2x"></span> -->
<!-- 									<b>제목</b> -->
<!-- 								</td> -->
<!-- 								<td class="col-xs-2" style="text-align: center;"><span class="fa fa-clock-o fa-2x"></span> -->
<!-- 									<b>작성일자</b> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<%-- 							<c:forEach items="${list}" var="noticeVO"> --%>
<!-- 							<tr> -->
<%-- 								<td><a href='/notice/read.do${pageMaker.makeSearch(pageMaker.cri.page)}&no=${noticeVO.noticeNo}'>${noticeVO.title}</a></td>  --%>
<%-- 								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${noticeVO.regDate}" /></td>								 --%>
<!-- 							</tr> -->
<%-- 							</c:forEach> --%>
<!-- 						</table> -->

							<div class="list-group">
								<a class="list-group-item activeme">&nbsp;<span><i class="fa fa-columns" aria-hidden="true"></i></span>&nbsp;제목<span class="pull-right"><span class="fa fa-clock-o fa-1x"></span>&nbsp;작성일자</span></a>
							<c:forEach items="${list}" var="noticeVO">
								<!-- <span class="list-group-item"> -->
								<a href='/notice/read.do${pageMaker.makeSearch(pageMaker.cri.page)}&no=${noticeVO.noticeNo}'
									class="list-group-item"> ${noticeVO.title} 
									<span
									class="pull-right"><fmt:formatDate
											pattern="yyyy-MM-dd" value="${noticeVO.regDate}" /> </span>
								</a>

								<!-- </span> -->
							</c:forEach>
							<!-- 							<a href="http://bootply.com/tagged/modal" class="list-group-item">Modal/ Dialog</a>  -->
						</div>
						<div class="col-xs-10"></div>
						
						<c:if test="${uvo.ulevel eq 'admin'}">
							<div class="col-xs-2" >
								<a class="btn btn-primary pull-left"
									href="/notice/create.do" type="button">공지 작성</a>
							</div>						
						</c:if>
<!-- 페이지네이션 -->						
						<div class="col-sm-12 text-center">
							<ul class="pagination center-block"
								style="display: inline-block;">
								<!-- 돌아가는  화살표 -->
								<c:if test="${pageMaker.prev}">
								<li><a href="listPage.do${pageMaker.makeSearch(pagemaker.startPage-1)}">«</a></li>
								 </c:if>
								 <!-- 1,2,3,4... -->
								 <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var = "idx">
								<li
								<c:out value="${pageMaker.cri.page ==idx? 'class=active':''}"/>>
<%-- 								<a href="listPage.do?page=${idx}">${idx}</a> --%>
								<a href="listPage.do${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
								 </c:forEach>
								<!-- 다음 페이지들로 가는 호ㅏ살표 -->
								<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
								<li><a href="listPage.do${pageMaker.makeSearch(pageMaker.endPage +1) }">»</a></li>
								</c:if>
							</ul>
						</div>
						
<!-- 검색부분 -->						
						<form class="form-inline">
							<select name="searchType" class="form-control" style="margin-left: 140px">
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
									<button id="searchBtn" class="btn btn-default" type="button">검색</button>
								</span>
							</div>
						</form>
						
						
					</div>
<!-- 바디의 끝 -->		</div>
					</div>
					
					<div class="col-md-3" style="padding: 0px !important;">
					<div>
						<img height="520px" width="100px" alt="easysafe" src="${pageContext.request.contextPath}/resources/media/img/clear.png"/>
					<a href="${pageContext.request.contextPath}/index.do">
	                <img alt="너구리" src="${pageContext.request.contextPath}/resources/media/img/panda01_nobg.png" 
	                	style="width: 100%; height: 100%;" />
	                </a>
					</div>
					
					
					</div>
					
				</div>
			</div>
				</div>
<script type="text/javascript">
$(document).ready(function(){
	//네비바 메뉴 누르면 밑줄 그어줌
	$(".topmenu").removeClass("active");
	$(".noticemenu").addClass("active");
	
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
