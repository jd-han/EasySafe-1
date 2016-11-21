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
	<nav class="navbar navbar-fixed-top header">
	<div class="col-md-12">
		<div class="navbar-header">

			<a href="#" class="navbar-brand">Bootstrap</a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse1">
				<i class="glyphicon glyphicon-search"></i>
			</button>

		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse1">
			<form class="navbar-form pull-left">
				<div class="input-group" style="max-width: 470px;">
					<input type="text" class="form-control" placeholder="Search"
						name="srch-term" id="srch-term">
					<div class="input-group-btn">
						<button class="btn btn-default btn-primary" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="http://www.bootply.com" target="_ext">Bootply+</a></li>
				<li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
						class="glyphicon glyphicon-bell"></i></a>
					<ul class="dropdown-menu">
						<li><a href="#"><span class="badge pull-right">40</span>Link</a></li>
						<li><a href="#"><span class="badge pull-right">2</span>Link</a></li>
						<li><a href="#"><span class="badge pull-right">0</span>Link</a></li>
						<li><a href="#"><span class="label label-info pull-right">1</span>Link</a></li>
						<li><a href="#"><span class="badge pull-right">13</span>Link</a></li>
					</ul></li>
				<li><a href="#" id="btnToggle"><i
						class="glyphicon glyphicon-th-large"></i></a></li>
				<li><a href="#"><i class="glyphicon glyphicon-user"></i></a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="navbar navbar-default" id="subnav">
		<div class="col-md-12">
			<div class="navbar-header">

				<a href="#" style="margin-left: 15px;"
					class="navbar-btn btn btn-default btn-plus dropdown-toggle"
					data-toggle="dropdown"><i class="glyphicon glyphicon-home"
					style="color: #dd1111;"></i> Home <small><i
						class="glyphicon glyphicon-chevron-down"></i></small></a>
				<ul class="nav dropdown-menu">
					<li><a href="#"><i class="glyphicon glyphicon-user"
							style="color: #1111dd;"></i> Profile</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-dashboard"
							style="color: #0000aa;"></i> Dashboard</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-inbox"
							style="color: #11dd11;"></i> Pages</a></li>
					<li class="nav-divider"></li>
					<li><a href="#"><i class="glyphicon glyphicon-cog"
							style="color: #dd1111;"></i> Settings</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-plus"></i>
							More..</a></li>
				</ul>


				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-collapse2">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse2">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="#">Posts</a></li>
					<li><a href="#loginModal" role="button" data-toggle="modal">Login</a></li>
					<li><a href="#aboutModal" role="button" data-toggle="modal">About</a></li>
				</ul>
			</div>
		</div>
	</div>

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
						
						<p>	이지세이프 사이트가 1.1버전으로 업데이트 되었습니다. <p>
							1.1ver 수정 사항 : 
							공지사항 띄우기 기능.
							<p>
							<a
								href="#">사이트 바로가기</a>
						<img src="${pageContext.request.contextPath}/resources/media/img/logo_nobg3.png" class="img-circle pull-right">
							</p>
						

						<hr>
						 <div class="panel-body">
              <div class="row">
                <div class="col-xs-8"></div>
                <div class="col-xs-2"><a class="btn btn-info center-block" href="#">Update</a></div>
                <div class="col-xs-2"><a class="btn btn-primary center-block" href="/notice/delete.do?no=${notice.noticeNo}" type="delete" >Delete</a></div>
              </div>
              <br>
						<form>
							<div class="input-group">
								<div class="input-group-btn">
									<button class="btn btn-default">+1</button>
								</div>
								<input type="text" class="form-control"
									placeholder="댓글 달기..">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</html>
