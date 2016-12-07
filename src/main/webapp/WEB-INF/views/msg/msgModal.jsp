<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<!-- 메시지 모달 -->
<div id="msgModal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<form action="${pageContext.request.contextPath}/msg/sendMsg.do" method="POST">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				<div style="font-size: 30px;" class="text-center" id="msgTitletag">
					메시지 보내기
				</div>
			</div>
			<div class="modal-body">
				<div id="usertag">받는 사람</div>
				<div class="form-control">
					<input id="msgUser" name="receiveUser" />
					<input id="msgSender" name="sendUser" type="hidden" value="${login.uid}"/>
					<c:if test="${login.ulevel eq 'admin'}">
					<input id="isAdmin" name="readable" type="hidden" value="A"/>
					</c:if>
					<input id="isAdmin" name="readable" type="hidden" value="N"/>
				</div><br>
				메시지 제목<br>
				<div class="form-control">
					<input id="msgTitle" name="msgTitle" readonly="readonly"/>				
				</div><br>
				메시지 내용<br>
				<div class="form-control">
					<input id="msgContent" name="msg" readonly="readonly"/>				
				</div>
			</div>			
			<div class="modal-footer" id="msgBtns">
				<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">확인</button>			
				<button class="btn btn-warning" data-dismiss="modal" aria-hidden="true" onclick="sendReadyModal();">답장</button>
			</div>
		</form>
		</div>
	</div>
</div>

<script>
	
</script>