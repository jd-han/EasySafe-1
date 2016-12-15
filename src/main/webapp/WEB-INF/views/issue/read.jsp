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
.modal-dialog {
	width: 450px;
}

.modal-footer {
	border-width: 0;
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
						<a href="/issue/listPage.do" class="pull-right">목록으로</a>
						<h4>${issueVO.title}</h4>
					</div>

					<div class="panel-body">
						<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
							value="${issueVO.regdate}" />

						<div class="col-md-12">
							<img style="width: 150px; height: 150px;"
								src="${pageContext.request.contextPath}/resources/media/img/logo_nobg3.png"
								align="right">
						</div>

						&nbsp;<br> &nbsp;<br>
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-8"></div>


								<c:if test="${uvo.ulevel eq 'admin'}">
								</c:if>
								<form role="form" action="update.do" method="post">
									<input type='hidden' name='no' value="${issueVO.ino}">
									<input type='hidden' name='page' value="${cri.page}"> 
									<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
									<input type='hidden' name='searchType' value="${cri.searchType}"> 
									<input type='hidden' name='keyword' value="${cri.keyword}">
								</form>
								<div class="col-xs-2">


									<a class="btn btn-info center-block" id="updatePageBtn"
										href="/issue/update.do?ino=${issueVO.ino}" type="button">Update</a>
								</div>

								<div class="col-xs-2">
									<a class="btn btn-primary center-block"
										href="/issue/delete.do?ino=${issueVO.ino}" type="button">Delete</a>
								</div>
								<%-- 								${issueVO.ino} --%>
							</div>
							<br>
							<h4>
								댓글 리스트&nbsp;<span class='glyphicon glyphicon-comment'></span>
							</h4>
							<!-- <form> -->
							<ul class="list-group" id="replies">
								<li>이것이 뜨면 댓글 에이작스가 실행되지 않은 것이다.</li>
							</ul>
							<div class="input-group">
								<div class="input-group-btn">
									<button class="btn btn-default" id="replyAddBtn">+1</button>
								</div>
								<input type="text" class="form-control" id="newReplyText" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 덧글 수정 모달 시작 -->
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 class="text-center">
						<br>덧글 수정
					</h3>
				</div>


				<div class="modal-body">

					<input type="hidden" id="uid" name="uid"
						value="<c:out value="${login.uid}"/>"> <br>

					<div>
						<span class='modal-title' id="modno"></span><span>번 댓글을
							수정합니다. </span>
					</div>
					<div id="modDiv">
						<input type="text" class="form-control" id="replytext">
					</div>

					<br>
					<div>
						<button class="btn btn-primary pull-right" type="button"
							id="replyModBtn" onclick='replyUpdate();' data-dismiss="modal"
							aria-hidden="true">댓글 수정하기</button>
						<button class="btn" data-dismiss="modal" aria-hidden="true">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</button>
					</div>

				</div>

			</div>

		</div>
		<div class="modal-footer"></div>
	</div>
	<!-- 댓글 수정 모달 끝 -->



	<script type="text/javascript">
	var ino = ${issueVO.ino};
		$(document).ready(function() {
							//네비바 메뉴 누르면 밑줄 그어줌
							$(".topmenu").removeClass("active");
							$(".issuemenu").addClass("active");
				
							console.log("document ready" + ino);
							console.log("getAllList");
							
							getAllList(ino);
							
							

							var formObj = $("form[role='form']");
							console.log(formObj);

							$("#updatePageBtn").on("click", function(event) {
								formObj.attr("action", "/issue/update.do");
								formObj.attr("method", "get");
								formObj.submit();
							});
						});

		$("#replyAddBtn").on("click",function() {

							var replytextObj = $("#newReplyText");
							var replytext = replytextObj.val();
							var ino = ${issueVO.ino};
							confirm("댓글을 등록할까요?");
							$.ajax({type : 'POST',
										url : '/replies/register.do',
										headers : {
											"Content-Type" : "application/json",
										},
										data : JSON.stringify({
											ino : ino,
											replyer : replyer,
											replytext : replytext
										}),
										success : function(result) {
											console.log("result: " + result);
											if (result == 'success.') {
												alert("등록 되었습니다.");
// 												replyPage = 1;
// 												$('#replies').append(
// 																"<li class='list-group-item' data-rno='"+this.rno+"' >"	+ replyer+ " : "+ replytext+ new Date().toISOString()
// 																.slice(0,10)
// 																		+ "<a onclick='replyMod("+this.rno+ ");' class='btn btn-xs btn-default' id='replyDelBtn'>update</a>"
// 																		+ "<a onclick='replyDel("+this.rno+ ");' class='btn btn-xs btn-default' id='replyModBtn'>delete</a></li>");
												getAllList(ino);
												replyerObj.val("");
												replytextObj.val("");
											}
										},
									});
						});

		// 		$(".timeline").on("click", ".replyLi", function(event){

		// 			var reply = $(this);

		// 			$("#replytext").val(reply.find('.timeline-body').text());
		// 			$(".modal-title").html(reply.attr("data-rno"));

		// 		});

		// 		$("#replyModBtn").on("click",function(){
		function getAllList(ino) {
	$.getJSON(
			"/replies/all/" + ino +".do",
			function(data) {
					var str = "";
					console.log(data.length);
					$(data).each(function() {
							if ('${login.uid}' == this.replyer) {
											str +=
												"<li class='list-group-item' data-rno='"+this.rno+"' title='"+this.replytext+"'> no : "+this.rno+"  "
													+this.replyer+ " : "+ this.replytext
													+ "<span class='pull-right'>"
													+ "<span class='mini'>"
													+ new Date(this.regdate).toLocaleString()
													+ "</span>&nbsp;&nbsp;"
													+ "<a onclick='replyMod("+this.rno+",\""+this.replytext+"\");' class='btn btn-xs btn-default' id='replyModBtn' href='#myModal'"
													+ "role='button' data-toggle='modal'>update</a>&nbsp;"
													+ "<a onclick='replyDel("+this.rno+",\""+this.replytext+"\");' class='btn btn-xs btn-default' id='replyDelBtn'>delete</a>"
													+ "</li>"
													+ "</span>";
									} else {	
										str +=
											"<li class='list-group-item' data-rno='"+this.rno+"' title='"+this.replytext+"'> no : "+this.rno+"  "
											+this.replyer+ " : "+ this.replytext
											+ "<span class='pull-right'>"
											+ "<span class='mini'>"
											+ new Date(this.regdate).toLocaleString()
											+ "</span>&nbsp;&nbsp;";
									}
							});
										
				$("#replies").html(str);
					});

	}
		function replyMod(rno, title) {
			console.log("댓글번호 : " + rno);
			console.log("댓글 내용 : " + title);
			$(".modal-title").html(rno);
			$("#replytext").val(title);
		};

		
		function replyUpdate() {
			var rno = document.getElementById('modno').innerHTML;
			console.log("갖고온 rno : "+rno);
			console.dir(rno);
			var replytext = $("#modDiv #replytext").val();
			console.log("갖고온 replytext : " + replytext);
			console.dir(replytext);
			$.ajax({
				type : 'put',
				url : '/replies/'+rno+'.do',
				headers : {
					"Content-Type" : "application/json",
				},
				data : JSON.stringify({
					rno : rno,
					replytext : replytext
				}),
// 				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'success.') {
						alert("수정 되었습니다.");
						getAllList(ino);
					}
				}
			});
		};

		function replyDel(rno){
// 			alert(rno"번 댓글 삭제 누름. ");
			confirm(rno+"번 댓글을 삭제할까요?");
			$.ajax({
				type : 'post',
				url : '/replies/delete'+rno+'.do',
				headers : {
					"Content-Type" : "application/json",
				},
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'susccess~') {
						alert("삭제 되었습니다.");
						getAllList(ino);
					}
				}
			});
		};
		
		
	</script>
</html>
