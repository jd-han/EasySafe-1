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
						<a href="/notice/list.do" class="pull-right">목록으로</a>
						<form action="/issue/issuePost.do" method="post" class="form-horizontal" role="form">
							<h3>이슈 작성</h3>
					</div>
						<div class="panel-body">
					<div class="form-group" style="padding: 14px;">
					<input type="text" name="title" class="form-control" placeholder="제목" /> 
					<br>
						<textarea rows="15" name="content" class="form-control" placeholder="내용" ></textarea>
						<button type="submit" class="btn btn-success pull-right" type="button" style="margin-top: 15px;">작성 완료</button>
					<hr>
					</div>
					
					<input type="hidden" name="writer" value="${uvo.uname}">


					</form>

						</div>
				</div>
			</div>
		</div>
	</div>
</html>
