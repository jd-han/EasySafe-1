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
							<label style="font-size: 30px;">공지 수정</label>
					</div>
					
					<div class="panel-body">
				
						<form action="/notice/updatePost.do" method="post" class="form-horizontal" role="form">
							<div class="form-group" style="padding: 14px;">
								
								
								
								
											<div class="input-group text-center"
										style="width: 850px; float: left;">
										<span class="input-group-btn">
										<button class="btn"disabled="disabled" style="background: transparent; border: none; cursor: text; color: black !important; font-weight: bold;">
										제목 :</button>
										</span> 	
										<input type="text" class="form-control input-mysize"
										value="${notice.title}" name="title">
										<span class="input-group-btn">
										<button class="btn" disabled="disabled"style="background: transparent; border: none; cursor: text; color: black !important; font-weight: bold;">
										&nbsp; &nbsp; &nbsp; &nbsp;
										글쓴이 :</button></span> 
										<input class="form-control" name='writer' value="관리자" disabled="disabled">
									</div>


									<input type="hidden" value="${{notice.noticeNo}}" name="ino" />
									
				<img height="8px" width="100px" alt="easysafe" src="${pageContext.request.contextPath}/resources/media/img/clear.png"/>					
									<textarea rows="15" name="content" class="form-control">${notice.content}</textarea>
									<hr />
									<div>
										<button type="submit" class="btn btn-success pull-right" id="updateBtn"
											type="button">&nbsp; &nbsp;Update &nbsp; &nbsp;</button>
									</div>
		
					
							</div>
						<input type="hidden" value="${notice.noticeNo}" name="noticeNo"/>
						<input type='hidden' name='page' value="${cri.page}"> 
						<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">


					</form>
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
	});
	</script>
</body>
</html>



