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
	<div class="container" id="main">
		<div class="row">
			<div class="col-md-12">
				<!-- 				<h2>공지사항</h2> -->
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-10 col-sm-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>공지사항</h3>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<c:forEach items="${list}" var="noticeVO">
								<!-- <span class="list-group-item"> -->
								<a href='/notice/read.do?no=${noticeVO.noticeNo}'
									class="list-group-item"> ${noticeVO.title} <span
									class="pull-right"><fmt:formatDate
											pattern="yyyy-MM-dd" value="${noticeVO.regDate}" /> </span>
								</a>

								<!-- </span> -->
							</c:forEach>
							<!-- 							<a href="http://bootply.com/tagged/modal" class="list-group-item">Modal/ Dialog</a>  -->
						</div>
						<div class="col-xs-10"></div>
						<div class="col-xs-2">
							<a class="btn btn-primary center-block"
								href="/notice/create.do" type="button">공지 작성</a>
						</div>
						<div class="col-sm-12 text-center">
							<ul class="pagination center-block"
								style="display: inline-block;">
								<li><a href="#">«</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">»</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</html>
