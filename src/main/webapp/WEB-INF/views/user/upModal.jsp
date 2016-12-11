<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<!-- 등업신청 모달 -->
<div id="upModal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				<div style="font-size: 30px;" class="text-center" id="msgTitletag">
					전문가등급 신청서 작성
				</div>
			</div>
		<form action="/mod/askLevelUp.do" method="post" enctype="multipart/form-data" >
			<div class="modal-body">	
				<input id="msgSender" name="sendUser" type="hidden" value="${login.uid}"/>				
				제목<br>
				<div class="form-control">
					<input id="msgTitle" name="msgTitle" type="text"/>
				</div><br>
				내용<br>
				<div class="form-control">
					<input id="msgContent" name="msg" type="text"/>
				</div>
				첨부파일<br>
				<div class="form-control">
					<input id="lvUpFile" name="lvUpFile" type="file"/>
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
	/* var findId = false;
	$("#idSearch").click(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/msg/searchId.do",
			type: "POST",
			data: {findId: $("#msgUser").val()}
		})
		.done(function(result){
			if(result){
				$("#isExistId").removeClass("alert-danger").removeClass("alert-warning").addClass("alert-success").html("메시지 전송 가능");
				findId = true;
				if($("#msgUser").val() == '${login.uid}'){
					$("#isExistId").removeClass("alert-success").removeClass("alert-warning").addClass("alert-danger").html("자신에게 보낼수 없습니다");
					findId = false;
				}
			}else{
				$("#isExistId").removeClass("alert-success").removeClass("alert-warning").addClass("alert-danger").html("존재하지 않는 ID 입니다");
				findId = false;
			}
		});		
	}); */
</script>