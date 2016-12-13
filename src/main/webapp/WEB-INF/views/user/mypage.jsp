<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EasySafe - 마이페이지</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
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
	b{
		font-size: 20px;
	}
	content{
		font-size: 15px;
	}
	hr{
		border-top: 2px solid #d6d6d6 !important;
	}
	#pic, #oripic{
		border: 15px solid transparent !important;
		border-image: url(${pageContext.request.contextPath}/resources/media/img/royalborder.png) 30 stretch !important;
	}
	.imgborder{
		border: 15px solid transparent !important;
		border-image: url(${pageContext.request.contextPath}/resources/media/img/royalborder.png) 30 stretch !important;
	}
	
	.file-upload{display:block;text-align:center;font-family: Helvetica, Arial, sans-serif;font-size: 12px;}
	.file-upload .file-select{display:block;border: 2px solid #0080ff;color: #34495e;cursor:pointer;height:40px;line-height:40px;text-align:left;background:#FFFFFF;overflow:hidden;position:relative;}
	.file-upload .file-select .file-select-button{background:#0080ff;padding:0 10px;display:inline-block;height:40px;line-height:40px;}
	.file-upload .file-select .file-select-name{line-height:40px;display:inline-block;padding:0 10px;}
	.file-upload .file-select:hover{border-color:#34495e;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
	.file-upload .file-select:hover .file-select-button{background:#34495e;color:#FFFFFF;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
	.file-upload.active .file-select{border-color:#0080ff;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
	.file-upload.active .file-select .file-select-button{background:#0080ff;color:#FFFFFF;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
	.file-upload .file-select input[type=file]{z-index:100;cursor:pointer;position:absolute;height:100%;width:100%;top:0;left:0;opacity:0;filter:alpha(opacity=0);}
	.file-upload .file-select.file-select-disabled{opacity:0.65;}
	.file-upload .file-select.file-select-disabled:hover{cursor:default;display:block;border: 2px solid #dce4ec;color: #34495e;cursor:pointer;height:40px;line-height:40px;margin-top:5px;text-align:left;background:#FFFFFF;overflow:hidden;position:relative;}
	.file-upload .file-select.file-select-disabled:hover .file-select-button{background:#dce4ec;color:#666666;padding:0 10px;display:inline-block;height:40px;line-height:40px;}
	.file-upload .file-select.file-select-disabled:hover .file-select-name{line-height:40px;display:inline-block;padding:0 10px;}
</style>
</head>
<body>
<%@ include file="../nav.jsp"%>
<%@ include file="upModal.jsp" %>
<div class="container" id="main">
	<div class="well col-xs-8">
		<span class="fa fa-user-circle fa-2x"></span>
		<label style="font-size: 30px;">마이페이지</label>
	</div>
	<div class="col-xs-8" style="padding-left: 0px !important; padding-right: 0px !important;">
		<div class="alert alert-info">
			<strong>개인정보 안내: </strong> 비밀번호의 주기적인 변경을 통해 개인정보를 안전하게 보호하세요.
		</div>
		<div class="well" style="text-align:center; float: left; width: 38%; height: 300px;">
			<span class="fa fa-camera-retro fa-2x"></span>
			<b>프로필 사진</b>
			<img id="pic" alt="profile" style="margin-left: 5px !important; width: 220px; height: 220px; margin: 5px;"
							src="/user/displayFile.do?filename=<c:out value="${login.file}"/>" />
		</div>
		<div style="float: left; width: 60%; height: 300px; margin-left: 2%;" class="well">
			<div style="padding-top:20px; text-align: center; float: left; width: 48%; height: 40%; border-bottom: 1px solid #d6d6d6; border-right: 1px solid #d6d6d6;">
				<span class="fa fa-user fa-2x"></span>
				<b>아이디</b>
				<br><br>
				<content><c:out value="${login.uid}" /></content>
			</div>
			<div style="padding-top:20px; text-align: center; float: left; width: 48%; height: 40%; border-bottom: 1px solid #d6d6d6; border-left: 1px solid #d6d6d6;">
				<span class="fa fa-pencil fa-2x"></span>
				<b>이름</b>
				<br><br>
				<c:out value="${login.uname}" />
			</div>
			<div style="padding-top:20px; text-align: center; clear: left; float: left; width: 48%; height: 40%; border-top: 1px solid #d6d6d6; border-right: 1px solid #d6d6d6;">
				<span class="fa fa-envelope fa-2x"></span>
				<b>이메일</b>
				<br><br>
				<c:out value="${login.umail}" />
			</div>
			<div style="padding-top:20px; text-align: center; float: left; width: 48%; height: 40%; border-left: 1px solid #d6d6d6; border-top: 1px solid #d6d6d6;">
				<span class="fa fa-commenting fa-2x"></span>
				<b>자기소개</b>
				<br><br>
				<c:out value="${login.uinfo}" />
				<%-- <input type="hidden" id="no" value="<c:out value="${login.no}" />" /> --%>
			</div>
			<div style="clear: left; padding-top: -10px;">
			<br>
			<hr style="margin-bottom: 10px; margin-top: 0px;">
				<c:if test="${login.ulevel eq 'user' && login.request eq 'N'}">
					<a class="btn btn-success" style="margin-left: 5px; width: 32%;" href="#upModal" data-toggle="modal" onclick="resetUpModal();">전문가 신청</a>
				</c:if>
				<c:if test="${login.ulevel eq 'user' && login.request eq 'R'}">
					<div class="btn btn-warning" style="margin-left: 5px; width: 32%;">전문가 신청대기중</div>
				</c:if>
				<a class="btn btn-danger" style="width: 32%;" href="#exitModal" role="button" data-toggle="modal" onclick="resetExitModal()">탈퇴하기</a>
				<a class="btn btn-primary" style="width: 32%;" href="#myModal" role="button" data-toggle="modal">내 정보 수정</a>
			</div>
		</div>		
	</div>
</div>

<!-- 정보수정 모달 -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="text-align: center;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				<span class="fa fa-times fa-2x"></span>
				</button>
				<br>
				<span class="fa fa-user-circle fa-2x"></span>
				<b style="font-size: 30px;">내 정보 수정</b>
			</div>
			<div class="modal-body">
				프로필 사진, 비밀번호, 이름, 이메일, 자기소개를 수정합니다.<br><br>
				<div> 
					<img id="oripic" alt="profile" style="width: 220px; height: 220px; margin-left: 100px;" 
						src="${pageContext.request.contextPath}/user/displayFile.do?filename=<c:out value="${login.file}"/>" />
				</div>
				<form action="/user/updateAccount.do" method="post"	name="updateForm" onsubmit="chkUpdate();" enctype="multipart/form-data">
					<div class="form-group">
						<div id="list" onChange></div>
						<span class="fa fa-camera-retro fa-2x"></span>
						<b>프로필 사진 업로드</b>
						<!-- <input type="file" id="files" name="filename" /> -->
						<div class="file-upload">
						  <div class="file-select">
						    <div class="file-select-button" id="fileName">파일선택</div>
						    <div class="file-select-name" id="noimgFile">jpg, png 같은 이미지 파일만 가능</div> 
						    <input type="file" name="filename" id="chooseFile" accept="image/*">
						  </div>
						</div>
						<br>
						<a class="btn btn-danger">내 프로필 삭제하기</a>
						<br>
					</div>
					<div class="form-group">
						<span class="fa fa-user fa-2x"></span>
						<b>내 아이디</b>
						<br>
						<div class="imgborder" style="text-align: center; font-size: 20px; font-weight: bold;">
							<c:out value="${login.uid}" />
						</div>
						<br><br>
						<span class="fa fa-lock fa-2x"></span>
						<b>기존 비밀번호</b>
							<input type="password" class="form-control input" id="oripw" name="oripw">
						<br>
						<div class="alert alert-danger">
						<strong>Tip :</strong> 
						비밀번호에 특수문자를 추가하여 사용하면 기억하기도 쉽고 비밀번호 안전도가 높아져 도용의 위험이 줄어듭니다.
						</div>
						<br>
						<span class="fa fa-unlock-alt fa-2x"></span>
						<b>새로운 비밀번호</b>
						<input type="password" class="form-control input" id="upw" name="upw" placeholder="새 비밀번호" />
						<br>
						<span class="fa fa-unlock-alt fa-2x"></span>
						<b>비밀번호 확인</b> 
						<input type="password" class="form-control input" id="pw2" name="pw2" placeholder="새 비밀번호 확인" />
						<br><br>
						<span class="fa fa-pencil fa-2x"></span>
						<b>이름</b>
						<input type="text" class="form-control input" id="uname" name="uname" value="<c:out value="${login.uname}"/>" />
						<br>
						<span class="fa fa-envelope fa-2x"></span>
						<b>이메일</b>
						<input type="text" class="form-control input" id="umail" name="umail" value="<c:out value="${login.umail}"/>">
						<br>
						<span class="fa fa-commenting fa-2x"></span>
						<b>자기소개</b>
						<input type="text" class="form-control input" id="uinfo" name="uinfo" value="<c:out value="${login.uinfo}" />">
						<input type="hidden" id="uid" name="uid" value="<c:out value="${login.uid}"/>">
						<br><br><br><br>
					</div>
					<div class="pull-right" style="margin-top: -40px;">
						<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</button>
						<button class="btn btn-primary" type="submit" id="saveChange">변경하기</button>
					</div>
				</form>
			</div>
		</div>
		<div class="modal-footer"></div>
	</div>
</div>

<!-- 회원탈퇴 모달 -->
<div id="exitModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="text-align: center;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				<span class="fa fa-times fa-2x"></span>
				</button>
				<br>
				<span class="fa fa-user-circle fa-2x"></span>
				<b style="font-size: 30px;">회원 탈퇴</b>
			</div>
			<div class="modal-body">
				<div id="beforeexit">
					<div style="text-align: center;">
						<span class="fa fa-user-times fa-6" aria-hidden="true" style="font-size: 200px;"></span>	
						<br><br>
						<b style="font-size: 30px !important;">정말로<br>회원 탈퇴를 진행합니까?</b>
						<br><br>
						<div class="alert alert-danger">
						<strong>안내사항</strong><br> 
						회원 탈퇴를 실행하면 유저의 정보가 모두 삭제됩니다.
						</div>
					</div>
					<div id="realExit" style="visibility: visible; text-align: center;">
						<div class="alert alert-danger">
						<strong>경고</strong><br>
						정말로 회원 탈퇴를 진행합니까?<br>이 결정은 되돌릴 수 없습니다.
						</div>
						<button class="btn btn-danger" type="button" onclick="deleteUser(${login.no})">탈퇴확정</button>
						<button class="btn btn-primary" type="button" onclick="openRealExit('close')">취소</button>
					</div>
				</div>
				<div id="afterexit" style="text-align: center; font-size: 30px;">
					<img id="afterexit" style="width: 100%;" alt="GoodBye" src="${pageContext.request.contextPath}/resources/media/img/hi_nobg.png" />
					<br>회원 탈퇴가 완료 되었습니다.<br>
					3초 후 <br>메인 페이지로 이동합니다.
				</div>
			</div>
			<div class="modal-footer">
				<div class="pull-right" id="btns">
					<button class="btn btn-primary" id="exitcancle" data-dismiss="modal" aria-hidden="true">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</button>
					<button class="btn btn-danger" id="goexit" type="button" onclick="openRealExit('open')">탈퇴하기</button>
				</div>			
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function() {
		$("#curPage").html("나의 정보");
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
	$('#chooseFile').bind('change', function () {
		  var filename = $("#chooseFile").val();
		  if (/^\s*$/.test(filename)) {
		    $(".file-upload").removeClass('active');
		    $("#noimgFile").text("jpg, png 같은 이미지 파일만 가능"); 
		  }
		  else {
		    $(".file-upload").addClass('active');
		    $("#noimgFile").text(filename.replace("C:\\fakepath\\", "")); 
		  }
		});
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
            '<img style="width: 220px; height: 220px; margin-left: 100px;" id="oripic" src="', 
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

  document.getElementById('chooseFile').addEventListener('change', handleFileSelect, false);
</script>
<script type="text/javascript">
	function openRealExit(isOpen){
		if(isOpen == 'open'){
			$("#realExit").css("visibility", "visible");
			$("#goexit").attr("disabled", true);
			$("#exitcancle").attr("disabled", true);
		}else if(isOpen == 'close'){
			$("#realExit").css("visibility", "hidden");
			$("#goexit").attr("disabled", false);
			$("#exitcancle").attr("disabled", false);
		}
	}
	
	function resetExitModal(){
		$("#realExit").css("visibility", "hidden");
		$("#afterexit").css("display", "none");
		$("#beforeexit").css("display", "block");
		$("#btns").css("display", "block");
		$("#goexit").attr("disabled", false);
		$("#exitcancle").attr("disabled", false);
	}
	
	function deleteUser(uno) {
		$.ajax ({
			url:"/user/deleteAccount.do",
			type:"POST",
			data : {no : uno},
			success : function(data) {
				$("#realExit").css("visibility", "hidden");
				$("#afterexit").css("display", "block");
				$("#beforeexit").css("display", "none");
				$("#btns").css("display", "none");
				setTimeout(function(){
					window.location.href="../index.do";					
				}, 3000);
			},
			error : function(jqXHR, textStatus, errorThrown) {
		        alert("에러 발생\n" + textStatus + " : " + errorThrown);
			}
		});
	}
</script>
</body>
</html>