<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EasySafe - 마이페이지</title>
<!-- <link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" /> -->

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<%-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/recources/bootstrap/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/styles.css"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script> --%>
<style type="text/css">
.modal-dialog {
	width: 450px;
}

.modal-footer {
	border-width: 0;
}

.thumb {
	height: 200px;
	border: 1px solid lavender;
	margin: 10px 5px 0 0;
}
</style>
</head>
<body>
	<%@ include file="../nav.jsp"%>
	<%@ include file="upModal.jsp" %>
	<div class="container" id="main">
		<div class="row">
			<div class="col-xs-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>마이페이지</h3>
					</div>
					<div class="panel-body" style="width: 100%;">
						<div class="alert alert-info alert-dismissable">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">×</button>
							<strong>개인정보 안내: </strong> 비밀번호의 주기적인 변경을 통해 개인정보를 안전하게 보호하세요.
						</div>
						<div style="width: 90%; margin: auto;">
							<!-- 								<div class="input-group"> -->
							<img id="pic" alt="ori" style="height: 200px; width:200px; border: 2px dotted lightslategrey; margin: 5px;"
								src="/user/displayFile.do?filename=<c:out value="${login.file}"/>" /><br>
							<b>내 아이디 : </b>
							<c:out value="${login.uid}" />
							<br> <b>이름 : </b>
							<c:out value="${login.uname}" />
							<br> <b>이메일 : </b>
							<c:out value="${login.umail}" />
							<br> <b>자기소개 : </b>
							<c:out value="${login.uinfo}" />
							<br> <input type="text" id="no" style="display: none;"
								value="<c:out value="${login.no}" />" />
							<div class=" col-xs-12"></div>
							<div class="row">
								<div class="col-xs-3"></div>
								<div class="col-xs-3">
									<c:if test="${login.ulevel eq 'user' && login.request eq 'N'}">
									<a class="btn btn-danger center-block"
										href="#upModal" data-toggle="modal" onclick="resetUpModal();">전문가 신청</a>
									</c:if>
									<c:if test="${login.ulevel eq 'user' && login.request eq 'R'}">
									<div class="btn btn-warning center-block">전문가 신청대기중</div>
									</c:if>
								</div>
								<div class="col-xs-3">
									<a class="btn btn-primary center-block"
										onclick="javascript:deleteUser(${login.no})">탈퇴하기</a>
								</div>
								<div class="col-xs-3">
									<a class="btn btn-default center-block" href="#myModal"
										role="button" data-toggle="modal">내 정보 수정하기</a>
								</div>


							</div>

						</div>
					</div>

				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="col-xs-4 col-xs-12"></div>
		</div>
	</div>


<!-- 마이페이지 모달 -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 class="text-center">
					<br>내 정보 수정
				</h3>
			</div>
			<div class="modal-body">
				프로필 사진, 비밀번호, 이름, 이메일, 자기소개를 수정합니다.<br> <br> 
				<img id="oripic" alt="ori" style="height: 200px; border: 2px dotted lightslategrey; margin: 5px" 
					src="${pageContext.request.contextPath}/user/displayFile.do?filename=<c:out value="${login.file}"/>" />

				<form action="/user/updateAccount.do" method="post"
					name="updateForm" onsubmit="chkUpdate();" enctype="multipart/form-data">
					<div class="form-group">
						<div id="list" onChange></div>
						<input type="file" id="files" name="filename" /> 
						<a>내 프로필 삭제하기</a><br>
					</div>
					<div class="form-group">
						<b>내 아이디 : </b>
						<c:out value="${login.uid}" />
						<br> <br> <b>기존 비밀번호 : </b> <input type="password"
							class="form-control input" id="oripw" name="oripw">
						<code>Tip : 비밀번호에 특수문자를 추가하여 사용하면 기억하기도 쉽고 비밀번호 안전도가 높아져
							도용의 위험이 줄어듭니다.</code>
						<br> <b>비밀번호 : </b> <input type="password"
							class="form-control input" id="upw" name="upw"
							placeholder="새 비밀번호"> <br> <b>비밀번호 확인 : </b> <input
							type="password" class="form-control input" id="pw2" name="pw2"
							placeholder="새 비밀번호 확인" /> <br> <br> <b>이름 : </b> <input
							type="text" class="form-control input" id="uname" name="uname"
							value="<c:out value="${login.uname}"/>" /> <br> <b>이메일
							: </b> <input type="text" class="form-control input" id="umail"
							name="umail" value="<c:out value="${login.umail}"/>"> <br>
						<b>자기소개 : </b>
						<input type="text" class="form-control input"
							id="uinfo" name="uinfo" 
							value="<c:out value="${login.uinfo}" />">

						<input type="hidden" id="uid" name="uid"
							value="<c:out value="${login.uid}"/>"> <br>
					</div>
					<button class="btn btn-primary pull-right" type="submit"
						id="saveChange">내 정보 변경하기</button>
				</form>
			</div>
			<div>
				<button class="btn" data-dismiss="modal" aria-hidden="true">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</button>
			</div>
		</div>
		<div class="modal-footer"></div>
	</div>
</div>

	<script type="text/javascript">

$(document).ready(function() {
 
    });
    
function chkUpdate() {
	
	
    var result = true;
          if ($("#oripw").val() == "") {
             alert("현재 비밀번호를 입력하세요. ");
             $("#pwd2").focus();
					result = false;
          }else if ($("#upw").val() == "") {
             alert("비밀번호를 입력하세요!");
             $("#upw").focus();
             result = false;
         } else if ($("#pw2").val() == "") {
             alert("비밀번호확인 을 입력하세요!");
             $("#pwd2").focus();
             result = false;
         } else if ($("#upw").val() != $("#pw2").val()) {
             alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
             $("#upw").val("");
             $("#pw2").val("");
             $("#upw").focus();
             result = false;
         } else if ($("#uname").val() == "") {
             alert("이름을 입력하세요");
             $("#name").focus();
             result = false;
         } else if ($("#umail").val() == "") {
             alert("이메일을 입력하세요");
             $("#email").focus();
             result = false;
         } else if ($("#uinfo").val() == "") {
             alert("자기소개를 입력하세요");
             $("#uinfo").focus();
             result = false;
         } 
         return result;
 	}
</script>

	<script type="text/javascript">    
function handleFileSelect(evt) {
    var files = evt.target.files;
    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = files[i]; i++) {

      // Only process image files.
      if (!f.type.match('image.*')) {
        continue;
      }

      var reader = new FileReader();

      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
        	document.getElementById('list').innerHTML = "";
          // Render thumbnail.
          var span = document.createElement('span');
          span.innerHTML = 
          [
            '<img style="height: 200px; width:200px; border: 2px dotted lightslategrey; margin: 5px;"; src="', 
            e.target.result,
            '" title="', escape(theFile.name), 
            '"/>'
          ].join('');
          
          document.getElementById('list').insertBefore(span, null);
        };
      })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
      document.getElementById('oripic').style.display="none";
    }
  }

  document.getElementById('files').addEventListener('change', handleFileSelect, false);
  </script>


	<script type="text/javascript">   
 
  
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



</script>
</body>
</html>