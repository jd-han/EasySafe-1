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
<style type="text/css">
xmp{		
font-family: inherit;
}
</style>
</head>
<body>
	<%@ include file="../nav.jsp"%>
	<!--main-->
	<div class="container" id="main">
		<div class="row">
			<div class="col-md-12">
				<!-- 				<h2>공지사항</h2> -->
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-10 col-sm-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<b>${noticeVO.title}</b>
						<hr>
					</div>
					<div class="panel-body" style="padding-left: 70px;">
						 <div><xmp>${noticeVO.content}</xmp></div>
						<a href="#">사이트 바로가기</a>						
						<div class="col-md-12">
						<img style="width: 150px; height: 150px;"
							src="${pageContext.request.contextPath}/resources/media/img/logo_nobg3.png"	align="right">
						</div>
						<br><br><br><br>
						<hr>
						<div class="panel-body" style="padding-top: 30px !important;">
							<!-- <div class="row"> -->
								<div class="col-xs-2"></div>
								<div class="pull-right">
								<c:if test="${uvo.ulevel eq 'admin'}">
									<!-- <div class="col-xs-1"> -->
									<form role="form" action="update.do" method="post">
											<input type='hidden' name='no' value="${noticeVO.noticeNo}"> 
											<input type='hidden' name='page' value="${cri.page}"> 
											<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
											<input type='hidden' name='searchType' value="${cri.searchType}">
											<input type='hidden' name='keyword' value="${cri.keyword}">
									</form>
									<br><br><br><br>
											<a class="btn btn-warning" id="updatePageBtn" type="button"> &nbsp; &nbsp;수정 &nbsp; &nbsp;</a> &nbsp;
											<a class="btn btn-danger" href="/notice/delete.do?no=${noticeVO.noticeNo}" type="button"> &nbsp; &nbsp;삭제 &nbsp; &nbsp;</a> &nbsp;
								</c:if>
											<a class="btn btn-primary" href="/notice/listPage.do" type="button"> &nbsp; &nbsp;목록 &nbsp; &nbsp;</a>
								</div>	
								<br><br>						
							<!-- </div> -->
							<hr>
<!-- 							<form> -->
<!-- 							<span class="fa fa-comment fa-2x"></span> -->
<!-- 							<b>댓글</b> -->
<!-- 								<div class="input-group"> -->
<!-- 									<div class="input-group-btn"> -->
<!-- 										<button class="btn btn-default">+1</button> -->
<!-- 									</div> -->
<!-- 									<input type="text" class="form-control" placeholder="댓글 달기.."> -->
<!-- 								</div> -->
<!-- 							</form> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function () {
			//네비바 메뉴 누르면 밑줄 그어줌
			$(".topmenu").removeClass("active");
			$(".noticemenu").addClass("active");
				
			var formObj = $("form[role='form']");
			console.log(formObj);
			
			$("#updatePageBtn").on(
					"click",
					function (event) {
				formObj.attr("action", "/notice/update.do");
				formObj.attr("method", "get");		
				formObj.submit();
					});
		});
	</script>
</html>
