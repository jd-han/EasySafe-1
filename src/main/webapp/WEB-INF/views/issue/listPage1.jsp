<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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




</head>
<body>
		<%@ include file="../nav.jsp" %>
	<!--main-->
	<div class="container-fluid" id="main">
		<div class="row">
			<div class="col-md-12">
	
			<div class="col-md-3"></div>
			<div class="col-md-6">
			<div class="well">
			<form class="form-inline">
			 <select name="searchType" class="form-control">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
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
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<a id='searchBtn' class="btn btn-default" href="#">검색</a>
			</form>
			</div>
			
			
			
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>공지사항</h3>
					</div>
					<div class="panel-body">
						<div class="list-group">
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
							<div class="col-xs-7"></div>
							<div class="col-xs-3"></div>
							<div class="col-xs-2" >
								<a class="btn btn-primary center-block"
									href="/notice/create.do" type="button">공지 작성</a>
							</div>						
						</c:if>
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
					</div>
				</div>
				

				<div class="panel panel-default"></div>
				
				
		</div>
			<div class="col-md-3">
			
			<img height="500px" width="100px" alt="easysafe" src="${pageContext.request.contextPath}/resources/media/img/clear.png"/>
                   <a href="${pageContext.request.contextPath}/index.do">
                   <img alt="너구리"
                             src="${pageContext.request.contextPath}/resources/media/img/panda01_nobg.png"
                             style="width: 80%; height: 80%;" /></a>
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
