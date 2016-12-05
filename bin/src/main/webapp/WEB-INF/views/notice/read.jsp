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
						<a href="/notice/list.do" class="pull-right">목록으로</a>
						<h4>${notice.title}</h4>
					</div>

					<div class="panel-body">
						<!-- 						<a href="#">Keyword: Bootstrap</a> -->
						<!-- 						<div class="clearfix"></div> -->
						<!-- 						<hr> -->

						<p>${notice.content}</p>

						<a href="#">사이트 바로가기</a> <img
							src="${pageContext.request.contextPath}/resources/media/img/logo_nobg3.png"
							class="img-circle pull-right">


						<hr>
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-8"></div>
								<c:if test="${uvo.ulevel eq 'admin'}">
									<div class="col-xs-2">
										<a class="btn btn-info center-block"
											href="/notice/update.do?no=${notice.noticeNo}" type="button">Update</a>
									</div>
	
									<div class="col-xs-2">
										<a class="btn btn-primary center-block"
											href="/notice/delete.do?no=${notice.noticeNo}" type="button">Delete</a>
									</div>								
								</c:if>

							</div>
							<br>
							<form>
								<div class="input-group">
									<div class="input-group-btn">
										<button class="btn btn-default">+1</button>
									</div>
									<input type="text" class="form-control" placeholder="댓글 달기..">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</html>
