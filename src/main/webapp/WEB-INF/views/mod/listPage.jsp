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
#fileIname{
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>

</head>
<body>

	<%@ include file="../nav.jsp" %>

	<!--main-->
	<div class="container" id="main">
		<div class="row">
			<div class="col-md-12 col-sm-12">
			<div class="well">
			<form class="form-inline">
			 <select name="searchType" class="form-control">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							검색유형을 선택하세요</option>
						<option value="no"
							<c:out value="${cri.searchType eq 'no'?'selected':''}"/>>
							유저번호</option>
						<option value="ID"
							<c:out value="${cri.searchType eq 'ID'?'selected':''}"/>>
							ID</option>
						<option value="username"
							<c:out value="${cri.searchType eq 'username'?'selected':''}"/>>
							유저네임</option>
						<option value="email"
							<c:out value="${cri.searchType eq 'email'?'selected':''}"/>>
							이메일</option>
						<option disabled="disabled">-유저 타입별 검색-</option>
						<option value="admin"
							<c:out value="${cri.searchType eq 'admin'?'selected':''}"/>>
							관리자</option>
						<option value="pro"
							<c:out value="${cri.searchType eq 'pro'?'selected':''}"/>>
							전문가</option>
						<option value="user"
							<c:out value="${cri.searchType eq 'user'?'selected':''}"/>>
							일반유저</option>
							
						<option value="request"
						<c:out value="${cri.searchType eq 'R'?'selected':''}"/>>
						등업신청자</option>
							
					</select> <input type="text" class="form-control" placeholder="검색어 입력" name='keyword' id="keywordInput"
						value='${cri.keyword }'/>
					<a id='searchBtn' class="btn btn-default" href="#">검색</a>
					
			</form>
			</div>
			
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

									<td>
										<a class="btn btn-warning" onclick="javascript:deleteUser(${userVO.no})">삭제</a>
										<c:if test="${userVO.request eq 'R'}">
										<a href="#requestModal" role="button" data-toggle="modal" onclick="modalRequUser('${userVO.uid}');">
											<img data-toggle="tooltip" data-placement="bottom" title="유저가 전문가 신청을 해왔습니다" class="glowicon" height="30px;" src="${pageContext.request.contextPath}/resources/media/img/email.png" />
										</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>





						</table>
						<!-- </form> -->
						
						<div class="col-sm-12 text-center">
							<ul class="pagination center-block"
								style="display: inline-block;">
								<!-- 돌아가는  화살표 -->
								<c:if test="${pageMaker.prev}">
								<li><a href="listPage.do?page=${pageMaker.startPage-1}">«</a></li>
								 </c:if>
								 <!-- 1,2,3,4... -->
								 <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var = "idx">
								<li
								<c:out value="${pageMaker.cri.page ==idx? 'class=active':''}"/>>
								<a href="listPage.do${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
								 </c:forEach>
								<!-- 다음 페이지들로 가는 호ㅏ살표 -->
								<c:if test="${pageMaker.next && pageMaker.endPage>0}">
								<li><a href="listPage.do?page=${pageMaker.endPage +1}">»</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>


			</div>
		</div>


	</div>
<!-- 등업신청 모달 -->
	<div id="requestModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center;">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						<span class="fa fa-times fa-2x"></span>
					</button>
					<br>
					<span class="fa fa-arrow-up fa-2x"></span>
					<b style="font-size: 30px;" id="requUserName">신청자 아이디 적히는 부분</b>
					<!-- <h3 class="text-center" id="requUserName">
						등업신청자 아이디 적히는 부분
					</h3> -->
				</div>
				<div class="modal-body">
					<input id="msgNo" name="msgNo" type="hidden"/>				
					<input id="msgReceiver" name="msgReceiver" type="hidden"/>
					<span class="fa fa-header fa-2x"></span>
					<b>제목</b>
					<br>
						<input class="form-control" id="msgTitle" name="msgTitle" type="text" readonly="readonly"/>
					<br>
					<span class="fa fa-list-alt fa-2x"></span>
					<b>내용</b>
					<br>					
						<!-- <input class="form-control" id="msgContent" name="msg" type="text" readonly="readonly"/> -->
						<textarea class="form-control" name="msg" rows="10" cols="1" id="msgContent" readonly="readonly"></textarea>
					<br>
					<span class="fa fa-floppy-o fa-2x"></span>
					<b>첨부파일</b>
					<br>
					<div id="filePlace">
					</div>
					<br>
					<span class="fa fa-clock-o fa-2x"></span>
					<b>신청일</b>
					<br>
					<input class="form-control" id="msgRegDate" name="date" type="text" readonly="readonly" />
					<hr>
					<span class="fa fa-gavel fa-2x"></span>
					<b>수락/거부 사유를 적어주세요</b>
					<br>
					<input class="form-control" id="cause" name="cause" type="text"/>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true" onclick="submitUp('OK');">&nbsp;&nbsp;&nbsp;&nbsp;수락&nbsp;&nbsp;&nbsp;&nbsp;</button>
					<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" onclick="submitUp('NO');">&nbsp;&nbsp;&nbsp;&nbsp;거부&nbsp;&nbsp;&nbsp;&nbsp;</button>
					<button class="btn btn-warning" data-dismiss="modal" aria-hidden="true">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</button>
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
		$("#isRequestUser").css("display", "none");
		
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
				});
	
	/* 유저 아이디를 받아서 데이터를 모달창에 띄움 */
	function modalRequUser(uid){
		$.ajax({
			url: "${pageContext.request.contextPath}/mod/requestUpUser.do",
			type: "GET",
			data: {userId: uid}
		})
		.done(function(result) {
            // MsgVO 내용이 올라옴
			$("#requUserName").html(result.sendUser + " 회원에 대한<br> 승급 처리");
            $("#msgTitle").val(result.msgTitle);
            $("#msgContent").val(result.msg);
            $("#msgNo").val(result.msgNo);
            $("#msgReceiver").val(result.sendUser);
            var date = new Date(result.regDate);
            $("#msgRegDate").val(date.getFullYear()+"-"+parseDate(date.getMonth()+1)+"-"+parseDate(date.getDate()));
            // 첨부파일이 있고 없고 따라 다운로드 링크 생성
            if(result.lvUpFile != null){
            	var oriFileName = result.lvUpFile.substring(result.lvUpFile.indexOf("_")+1, result.lvUpFile.length);
            	$("#filePlace").html("<div class='alert alert-success'>"+ 
            			"<div class='input-group text-center'>" + 
            			"<input id='fileIname' class='form-control' type='text' value='" + oriFileName + "' readonly='readonly'/>" +
            			"<span class='input-group-btn'>" +
            			"<a href='${pageContext.request.contextPath}/user/displayFile.do?filename="+result.lvUpFile+"&cate=expert' class='btn btn-primary'>첨부파일 다운로드</a></span></div></div>");
            }else{
            	$("#filePlace").html("<a class='btn btn-danger' disabled='disabled'>첨부파일 없음</a>");
            }
        });
	}
	function parseDate(vari){
		vari = vari+"";
		if(vari.length < 2){
			return "0"+vari;
		}
		return vari;
	}
	/* 등업을 수락/거부 */
	function submitUp(isokno){
		var title = "";
		var requ = "";
		if(isokno == 'OK'){
			// 승낙
			title = "전문가 신청이 수락되었습니다";
			requ = "D";
		}else{
			// 거부
			title = "전문가 신청이 거부되었습니다";
			requ = "N";
		}
		$.ajax({
			url: "${pageContext.request.contextPath}/mod/completeUpUser.do",
			type: "POST",
			data: {msgNo: $("#msgNo").val(), msgTitle: title, msgContent: $("#cause").val(), 
					requStat: requ, sender: '${login.uid}', receiver: $("#msgReceiver").val()
			}
		})
		.done(function(result) {
			window.location.reload();
        });
	}
	
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
	

	</script>
</html>
