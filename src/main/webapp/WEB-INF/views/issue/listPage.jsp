<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>EasySafe</title>
<meta name="generator" content="Bootply" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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

.writerkan {
text-align: center;
display:inline-block;
width: 100px;
}
</style>

</head>
<body>
		<%@ include file="../nav.jsp" %>
	<!--main-->
	<div class="container-fluid" id="main">
		<div class="row">
			<div class="col-md-12">
	
			<div class="col-md-1"></div>
			<div class="col-md-8">
<!-- 			<div class="well">			</div> -->
			
			
			
				<div class="panel panel-default">
					<div class="panel-heading">
						<br>
						<span>&nbsp;&nbsp;</span><span class="fa fa-newspaper-o fa-2x"></span>
						<b style="font-size: 30px;">이슈게시판</b>
					</div>
					
					
					<div class="panel-body">
						<div class="list-group">
<!-- 게시물 목록 헤더 시작 -->						
						<a class="list-group-item activeme">&nbsp;
						<span><i class="fa fa-tag" aria-hidden="true"></i></span>&nbsp;
						제목
						
						<span class="pull-right">
						
						조회수 <span>&nbsp;</span>
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i> 글쓴이  <span>&nbsp;&nbsp;</span><span>&nbsp;&nbsp;</span>
						<span class="fa fa-clock-o fa-1x"></span>&nbsp;작성일자
						</span></a>
<!-- 게시물 목록 헤더 끝 -->						
						
							<c:forEach items="${list}" var="IssueVO">
								<!-- <span class="list-group-item"> -->
								<a href='/issue/read.do${pageMaker.makeSearch(pageMaker.cri.page)}&ino=${IssueVO.ino}'
									class="list-group-item"> 
										${IssueVO.title} 
										 <strong>[${IssueVO.replycount }]</strong>
										<span
										class="pull-right">
										<span>${IssueVO.viewcount}</span>
										<span class="writerkan">${IssueVO.writer}</span>
										<fmt:formatDate	pattern="yyyy-MM-dd" value="${IssueVO.regdate}" /> </span>
								</a>

							</c:forEach>
						</div>
						<div class="col-xs-10"></div>
						<c:if test="${!empty uvo}"></c:if>
							<div class="col-xs-7"></div>
							<div class="col-xs-3"></div>
							<div class="col-xs-2" >
								<a class="btn btn-primary center-block"
									href="/issue/create.do" type="button">글 올리기</a>
							</div>						
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
						
							<form class="form-inline">
			 <select name="searchType" class="form-control" style="margin-left: 210px">
					<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							검색 유형</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							글쓴이</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							제목이나 내용</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							내용이나 글쓴이</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							제목, 글쓴이, 내용</option>
					</select> 
						 <input type="text" class="form-control" placeholder="검색어 입력" name='keyword' id="keywordInput"
						value='${cri.keyword }'/>
					<a id='searchBtn' class="btn btn-default" href="#">검색</a>
			</form>
						
					</div>
				</div>
				

				<div class="panel panel-default"></div>
				
				
		</div>
			<div class="col-md-3">
			
			<img height="480px" width="100px" alt="easysafe" src="${pageContext.request.contextPath}/resources/media/img/clear.png"/>
                   <a href="${pageContext.request.contextPath}/index.do">
                   <img alt="너구리" 
                             src="${pageContext.request.contextPath}/resources/media/img/glassholding.png"
                             style="width: 70%; height: 70%; padding-left: 20px;"  /></a>
			</div>
		</div>
			</div>
			
			</div>
			
			
			
			
		</body>
		
<script type="text/javascript">

$(document).ready(function(){
	//네비바 메뉴 누르면 밑줄 그어줌
	$(".topmenu").removeClass("active");
	$(".issuemenu").addClass("active");
	
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
		
		
</html>
