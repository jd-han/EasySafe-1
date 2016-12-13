<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<style>
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
<!-- 등업신청 모달 -->
<div id="upModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="text-align: center;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				<span class="fa fa-times fa-2x"></span>
				</button>
				<br>
				<span class="fa fa-graduation-cap fa-2x"></span>
				<b style="font-size: 30px;">전문가 등급 신청서 작성</b>
			</div>
		<form action="/mod/askLevelUp.do" method="post" enctype="multipart/form-data" >
			<div class="modal-body">
			<div class="form-group">
				<input id="msgSender" name="sendUser" type="hidden" value="${login.uid}"/>				
				<br>
				<span class="fa fa-header fa-2x"></span>
				<b>제목</b>
				<br>
				<div>
					<input class="form-control" id="msgTitle" name="msgTitle" type="text"/>
				</div>
				<br>
				<span class="fa fa-list-alt fa-2x"></span>
				<b>내용</b>
				<br>
				<div>
					<!-- <input class="form-control" id="msgContent" name="msg" type="text"/> -->
					<textarea class="form-control" name="msg" rows="10" cols="1" id="msgContent"></textarea>
				</div>
				<br>
				<span class="fa fa-id-card-o fa-2x"></span>				
				<b>첨부파일</b>
				<br>
				<div class="file-upload">
				  <div class="file-select">
				    <div class="file-select-button" id="fileName">파일선택</div>
				    <div class="file-select-name" id="noFile">pdf, 압축파일, 문서파일 외 이미지 파일만 가능</div> 
				    <input type="file" name="lvUpFile" id="lvUpFile" accept=".pdf, .zip, .alz, .7z, .hwp, .txt, .doc, .docx, .xls, .xlsx, image/*">
				  </div>
				</div>
				<!-- <input id="lvUpFile" name="lvUpFile" type="file" accept=".pdf, .zip, .alz, .7z, .hwp, .txt, .doc, .docx, .xls, .xlsx, image/*"/> -->
				<br>
				<div class="alert alert-warning">
					<strong>안내사항</strong><br> 
					전문가 등급 승인은 운영진의 판단에 따라 이루어지며,<br> 신청이 거부될 수도 있습니다.
				</div>
			</div>
			</div>
			<div class="modal-footer" id="msgBtns">
				<button class="btn btn-primary" type="submit">신청</button>			
				<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">취소</button>
			</div>
		</form>
		</div>
	</div>
</div>

<script>
	function resetUpModal(){
		$("#msgTitle").val("");
		$("#msgContent").val("");
		$("#lvUpFile").val("");
	}
	$('#lvUpFile').bind('change', function () {
		  var filename = $("#lvUpFile").val();
		  if (/^\s*$/.test(filename)) {
		    $(".file-upload").removeClass('active');
		    $("#noFile").text("선택된 파일 없음"); 
		  }
		  else {
		    $(".file-upload").addClass('active');
		    $("#noFile").text(filename.replace("C:\\fakepath\\", "")); 
		  }
		});
</script>