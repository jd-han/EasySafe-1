<%@page import="info.easysafe.domain.UserVO"%>
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
<!-- <script id="_carbonads_projs" type="text/javascript" -->
<!-- 	src="//srv.carbonads.net/ads/C6AILKT.json?segment=placement:bootplycom&amp;callback=_carbonads_go"></script> -->
<!-- <script type="text/javascript" -->
<!-- 	src="//fallbacks.carbonads.com/home/e99a260b94849497ea962f674f0aebd9//bootplycom/8/"></script> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/styles.css"
	type="text/css" />


<style>
.table.table-hover span {
	font-size: 16px;
}

.table.table-hover {
	margin-top: 30px;
}

.glyphicon glyphicon-cog {
	padding-left: 60%;
}

#savebutton {
	margin-right: 10px;
}

#wrap {
	display: inline-block;
}
</style>

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
						<!-- 						<a href="#" class="pull-right">View all</a> -->
						<h2>전체 회원 목록</h2>
						<!-- 						<form action="/notice/noticePost.do" method="post"
							class="form-horizontal" role="form"> -->
<!-- 						<div> -->
<!-- 							<button id="savebutton" type="submit" -->
<!-- 								class="btn btn-success pull-right" type="button"> -->
<!-- 								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;저장&nbsp;<i -->
<!-- 									class="glyphicon glyphicon-cog" style="color: white;"></i>&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 							</button> -->
<!-- 						</div> -->
					</div>
					<div class="panel-body">
						<!-- Table -->
						<table class="table table-hover">
							<tr>
								<th><span>User no</span></th>
								<th><span>ID</span></th>
								<th><span>Username</span></th>
								<th><span>E-mail</span></th>
								<th><span>Join date</span></th>
								<th><span>User type</span></th>
								<th><span>Edit</span></th>
							</tr>


							<c:forEach items="${list}" var="userVO">
								<tr>
									<td>${userVO.no}</td>
									<td>${userVO.uid}</td>
									<td>${userVO.uname}</td>
									<td>${userVO.umail}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${userVO.regdate}" /></td>

									<td><div style="float: left;">
											<%-- 									<c:if test="${!empty list} }"> --%>
											<select class="form-control" id="${userVO.no}">
												<option value="user"
													<c:if test="${userVO.ulevel=='user'}">
												selected="selected"
												</c:if>>일반
													유저</option>
												<option value="pro"
													<c:if test="${userVO.ulevel=='pro'}">
												selected="selected"
											</c:if>>전문가</option>
												<option value="admin"
													<c:if test="${userVO.ulevel=='admin'}">
												selected="selected"
											</c:if>>관리자</option>
											</select>

										</div>
										<div style="float: left;">
											<a class="btn btn-small pull-right" name="levelUpdate"
												id="updatelevel" onclick="javascript:update(${userVO.no})">
												변경 </a>
											<!-- <a class="btn btn-small pull-right" name="levelUpdate" id="updatelevel" >
										변경
										</a> -->
										</div></td>

									<td><a class="btn btn-warning" onclick="javascript:deleteUser(${userVO.no})">삭제</a></td>
								</tr>
							</c:forEach>





						</table>
						<!-- </form> -->
					</div>
				</div>


			</div>
		</div>


	</div>


</body>

<script type="text/javascript">
	//수정 버튼 누를 때.
/* 	alert("스크립트 시작");
	
	var selectStatus = $('selectBox').on('change', function(){
		$(this).find(":selected").val()
	}); */
		
	$(document).ready(function() {
		$("#curPage").html("Users Modify");
	});
	function update(no) {
			var userNo = no
			var userLevel = $("#"+ no +" option:selected").val();
			
	 		$.ajax({
				url: "/mod/updateLevel.do",
				type:"GET",
				data : {no : userNo, ulevel: userLevel},
				//dataType : "json", 넘어올 데이터 종류 지정.
				success : function(data){
					alert("등급이 변경되었습니다.");
				},
				error : function(jqXHR, textStatus, errorThrown) {
			        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			    }
			});
			
		}
	
	function deleteUser(no) {
		var userNo = no
		
		$.ajax ({
			url:"/mod/deleteUser.do",
			type:"POST",
			data : {no : userNo},
			success : function(data) {
				alert("유저가 삭제되었습니다. ");
				window.location.reload();
			},
			error : function(jqXHR, textStatus, errorThrown) {
		        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			}
		});
	}
	/* 
	$("#updatelevel").click(function(){
		alert("나와라");
	});
		
	 $("#updatelevel").click(function updatelevel() {
		var level = $("#"+${userVO.uid} +" option:selected").val();
		alert("수정될 val : " + level);
	}); 
		function deleteUser(){
			
		}  */
	</script>
</html>
