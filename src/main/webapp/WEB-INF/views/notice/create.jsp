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
						<span class="fa fa-pencil-square-o fa-3x"></span>
						<b style="font-size: 30px;">공지 작성</b>
						<hr>
					</div>
					<div class="panel-body">
					<form action="/notice/noticePost.do" method="post" class="form-horizontal" role="form">
						<div class="form-group" style="padding: 0 14px 0 14px;">
						<span class="fa fa-header fa-2x"></span>
						<b>제목</b>
						<br>
						<input type="text" name="title" class="form-control" placeholder="제목을 입력합니다" /> 
						<br>
						<span class="fa fa-list-alt fa-2x"></span>
						<b>내용</b>
						<br>
							<textarea rows="15" name="content" class="form-control" placeholder="내용을 입력합니다" ></textarea>
							<a href="/notice/listPage.do" class="btn btn-primary pull-right" style="margin-top: 15px; margin-left: 20px;">목록으로</a>
							<button type="submit" class="btn btn-success pull-right" style="margin-top: 15px;">작성완료</button>
						</div>
					</form>
				</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#curPage").html("Write Notice");
		});
	</script>
</body>
</html>
