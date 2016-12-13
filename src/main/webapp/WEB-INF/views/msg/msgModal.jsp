<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<style>
	b{
		font-size: 20px;
	}
</style>
<!-- 메시지 모달 -->
<div id="msgModal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<form action="${pageContext.request.contextPath}/msg/sendMsg.do" method="POST">
			<div class="modal-header" style="text-align: center;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<span class="fa fa-times fa-2x"></span>
				</button>
				<br>
				<span class="fa fa-paper-plane fa-2x"></span>
				<b style="font-size: 30px;">메시지 보내기</b>
			</div>
			<div class="modal-body">
				<span class="fa fa-share fa-2x"></span>
				<b>받는 사람</b>
				<br>
				<div class="input-group text-center">
					<input style="float: left;" type="text" id="msgUser" name="receiveUser" class="form-control" placeholder="ID를 입력하세요" />					
					<input id="msgSender" name="sendUser" type="hidden" value="${login.uid}"/>
					<input id="isAdmin" name="readable" type="hidden" value="${login.ulevel}"/>
					<span class="input-group-btn" id="findBtn">
						<button id="idSearch" class="btn btn-success" type="button">아이디 확인</button>
					</span>
				</div>
				<br>
				<div class="alert alert-warning" id="isExistId">메시지를 받을 유저의 ID를 먼저 검색해 주세요</div>
				<br>
				<span class="fa fa-header fa-2x"></span>
				<b>메시지 제목</b>
				<br>
				<input class="form-control" id="msgTitle" name="msgTitle"/><br>
				<span class="fa fa-list-alt fa-2x"></span>
				<b>메시지 내용</b>
				<br>
				<textarea class="form-control" name="msg" rows="10" cols="1" id="msgContent"></textarea>
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