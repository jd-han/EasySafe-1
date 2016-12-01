<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/recources/bootstrap/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	type="text/css"/>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/styles.css"
	type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>
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
	<div class="container" id="main">
		<div class="row">
				<div class="col-xs-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3>마이페이지</h3>
						</div>
						<div class="panel-body" style="width: 100%;">
								    <div class="alert alert-info alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <strong>개인정보 안내: </strong> 비밀번호의 주기적인 변경을 통해 개인정보를 안전하게 보호하세요. </div>
							<div style="width: 90%; margin: auto;">
<!-- 								<div class="input-group"> -->
								<img src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
								class="img-circle" style=""><br>
									<b>내 아이디 : </b>
									<c:out value="${login.uid}" />
									<br> <b>이름 : </b>
									<c:out value="${login.uname}" />
									<br> <b>이메일 : </b>
									<c:out value="${login.umail}" />
									<br> <b>자기소개 : </b>
									<c:out value="${login.uinfo}" />
									<br> 
									<input type="text" id="no" value="<c:out value="${login.no}" />"/>
<div class=" col-xs-12"></div>
										<div class="row">
										 <div class="col-xs-3"></div>
										 <div class="col-xs-3"></div>
               							 <div class="col-xs-3"><a class="btn btn-primary center-block" onclick="javascript:deleteUser(${login.no})" >탈퇴하기</a></div>
               							 <div class="col-xs-3"><a class="btn btn-default center-block" href="#myModal" role="button"
												data-toggle="modal">내 정보 수정하기</a></div>
											
												
										</div>

									</div>
<!-- 								</div> -->
							</div>

						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="col-xs-4 col-xs-12"></div>
				</div>
			</div>


<!-- 마이페이지 모달 -->
		<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 class="text-center">
							<br>내 정보 수정
						</h3>
					</div>
					<div class="modal-body">
					프로필 사진, 비밀번호, 이름, 이메일, 자기소개를 수정합니다.<br>
<!-- 						<form class="form col-md-12 center-block"> -->
								
							<form action="/user/updateAccount.do" method="post" name="updateForm" enctype="multipart/form-data">
							<div class="form-group">
								<b><img src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
								class="img-circle" display="center-block"><br>
								
							<input type="file" name="upic" id="upic"/>
								<a>내 프로필 삭제하기</a><br>
							</div>
								
 							   
							<div class="form-group">
								내 아이디 : </b> <c:out value="${login.uid}" />
									<br>
									<br> <b>기존 비밀번호 : </b> <input type="password" class="form-control input" id="oripw" name="oripw">
									<code>Tip : 비밀번호에 특수문자를 추가하여 사용하면 기억하기도 쉽고 비밀번호 안전도가 높아져
									도용의 위험이 줄어듭니다.</code>
									<br> <b>비밀번호 : </b> <input type="password" class="form-control input" id="upw" name="upw"
									placeholder="새 비밀번호">
									<br> <b>비밀번호 확인 : </b> <input type="password" class="form-control input" id="pw2" name="pw2"
									placeholder="새 비밀번호 확인"> <br>
									<br> 
									<b>이름 : </b> <input type="text" class="form-control input" id="uname" name="uname" value="<c:out value="${login.uname}"/>">
									<br> 
									<b>이메일 : </b> <input type="text" class="form-control input" id="umail" name="umail" value="<c:out value="${login.umail}"/>">
									<br>
									<b>자기소개 : </b> <input type="text" class="form-control input" id="uinfo" name="uinfo" value="<c:out value="${login.uinfo}" />">
									
									<input type="hidden" id="uid" name="uid" value="<c:out value="${login.uid}"/>">
									<br> 
							</div>
								<button class="btn btn-primary pull-right" type="submit" id="saveChange" >내 정보 변경하기
								</button>
								</form>
							</div>
							
<!-- 						</form> -->
						<div >
							<button class="btn" data-dismiss="modal" aria-hidden="true">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</button>
						</div>
					</div>
					<div class="modal-footer">
					</div>
				</div>
			</div>
		
<script type="text/javascript">

$(document).ready(function() {
	 
    $("#saveChange").click(function() {
       
             if ($("#oripw").val() == "") {
                alert("현재 비밀번호를 입력하세요. ");
                $("#pwd2").focus();
 
             }else if ($("#upw").val() == "") {
                alert("비밀번호를 입력하세요!");
                $("#upw").focus();
 
            } else if ($("#pw2").val() == "") {
                alert("비밀번호확인 을 입력하세요!");
                $("#pwd2").focus();
 
            } else if ($("#upw").val() != $("#pw2").val()) {
                alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
                $("#upw").val("");
                $("#pw2").val("");
                $("#upw").focus();
 
            } else if ($("#uname").val() == "") {
                alert("이름을 입력하세요");
                $("#name").focus();
            } else if ($("#umail").val() == "") {
                alert("이메일을 입력하세요");
                $("#email").focus();
            } else if ($("#uinfo").val() == "") {
                alert("자기소개를 입력하세요");
                $("#uinfo").focus();
            } else {
                alert("내 정보 변경이 완료되었습니다. ");
            }
             
 
        });
 
    });
    
    
    
function deleteUser(no) {
	var input = confirm("탈퇴하시겠습니까? ");
	var userNo = no;
	if (input == true) {
	$.ajax ({
		url:"/user/deleteAccount.do",
		type:"POST",
		data : {no : userNo},
		success : function(data) {
			alert("탈퇴 되었습니다. ");
			window.location.href="../index.do";
		},
		error : function(jqXHR, textStatus, errorThrown) {
	        alert("에러 발생\n" + textStatus + " : " + errorThrown);
		}
			});
	}else {
		alert("탈퇴를 취소하셨습니다. ");
	}
}


	
});

</script>
</body>
</html>