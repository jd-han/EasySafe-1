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
		<form action="${pageContext.request.contextPath}/msg/sendMsg.do" method="POST" enctype="multipart/request">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				<div style="font-size: 30px;" class="text-center" id="msgTitletag">
					메시지 보내기
				</div>
			</div>
			<div class="modal-body">
				<div id="usertag">받는 사람</div>
				<div class="form-control">
					<div class="input-group text-center">
						<input id="msgUser" name="receiveUser" />
						<span class="input-group-btn" id="findBtn">
							<button id="idSearch" class="btn btn-sm btn-success" type="button">아이디 확인</button>
						</span>
					</div>
					<input id="msgSender" name="sendUser" type="hidden" value="${login.uid}"/>
					<input id="isAdmin" name="readable" type="hidden" value="${login.ulevel}"/>
				</div>
				<div class="alert alert-warning" id="isExistId">메시지를 받을 유저의 ID를 먼저 검색해 주세요</div>
				<br>
				메시지 제목<br>
				<div class="form-control">
					<input id="msgTitle" name="msgTitle"/>				
				</div><br>
				메시지 내용<br>
				<div class="form-control">
					<input id="msgContent" name="msg"/>				
				</div>
			</div>			
			<div class="modal-footer" id="msgBtns">
				<button class="btn btn-primary" type="submit">전송</button>			
				<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">취소</button>
			</div>
		</form>
		</div>
	</div>
</div>

<script>
	var findId = false;
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
	});
</script>