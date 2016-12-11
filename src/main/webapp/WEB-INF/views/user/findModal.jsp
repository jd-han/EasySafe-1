<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<!-- 비번찾기 모달 -->
<div id="findModal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				<div style="font-size: 30px;" class="text-center" id="findTitletag">
					가입시 입력한 ID 와 Email을 정확히 적어주세요
				</div>
			</div>
			<div class="modal-body">				
				ID<br>
				<div class="input-group">
	                <input type="text" id="inputId" class="form-control" placeholder="ID를 입력하세요" /> 
				E-mail<br>
					<input id="inputEmail" type="text" class="form-control" placeholder="Email을 입력하세요"/>
                </div>
                <br>
                <span class="input-group-btn">
	                <button id="checkAccount" class="btn btn-success" onclick="chkAccount();">가입확인</button>
                </span>
                <br>
                <div class="alert alert-success" id="isCorrect"></div>
			</div>
			<div class="modal-footer" id="findBtns">
				<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true" disabled="disabled" id="findPass" onclick="resetPass();">비밀번호 찾기</button>			
				<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">취소</button>
			</div>
		</div>
	</div>
</div>

<script>
	var id = "";
	var email = "";
	function resetFindModal(){
		$("#inputId").val("");
		$("#inputEmail").val("");
		$("#findPass").attr("disabled", true);
		$("#isCorrect").css("visibility", "hidden");
		id = "";
		email = "";
	}
	function chkAccount(){
		$.ajax({
			url: "${pageContext.request.contextPath}/user/chkAccount.do",
			type: "POST",
			data: {findId: $("#inputId").val(), findEmail: $("#inputEmail").val()}
		})
		.done(function(result){
			id = $("#inputId").val();
			email = $("#inputEmail").val();
			$("#isCorrect").css("visibility", result.show).removeClass(result.removeClass).addClass(result.addClass)
			.html(result.msg);
			$("#findPass").attr("disabled", result.disabled);
		});	
	}
	function resetPass(){
		$.ajax({
			url: "${pageContext.request.contextPath}/user/emailSend.do",
			type: "POST",
			data: {emailTo: email, toUser: id}
		})
		.done(function(result){
			
		});
	}
</script>