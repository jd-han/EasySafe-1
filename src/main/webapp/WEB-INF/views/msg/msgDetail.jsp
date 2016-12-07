<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>메시지 내용</title>
</head>
<body>
<%@ include file="../nav.jsp"%>
<%@ include file="msgModal.jsp"%>
	<div class="container" id="main">
		<div class="well">
			보낸 사람
			<div class="input-group text-center">
				<input type="text" class="form-control input-lg" value="${msgDetail.sendUser}" readonly="readonly" />				
			</div>
			제목
			<div class="input-group text-center">
				<input type="text" class="form-control input-lg" value="${msgDetail.msgTitle}" readonly="readonly" />				
			</div>
			내용
			<div class="input-group text-center">
				<input type="text" class="form-control input-lg" value="${msgDetail.msg}" readonly="readonly" />				
			</div>
			보낸 날짜
			<div class="input-group text-center">
				<input type="text" class="form-control input-lg" value="<fmt:formatDate value="${msgDetail.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly="readonly" />				
			</div>
			<c:if test="${replyBtn eq 'OFF'}">
			<div class="col-xs-2">
				<a href="#msgModal" data-toggle="modal" class="btn btn-primary center-block" onclick="replyModal()">답장 보내기</a>
			</div>
			</c:if>
			<div class="col-xs-2">
				<a href="${pageContext.request.contextPath}/msg/msgList.do" class="btn btn-warning center-block">목록으로</a>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#curPage").html("메시지 내용");
	});
	
	function replyModal(){
		findId = false;
		$("#msgUser").val("${msgDetail.sendUser}");
		$("#msgUser").attr("readonly", true);
		$("#findBtn").css("display", "none");
		$("#msgTitle").val("${msgDetail.msgTitle}");
		$("#msgContent").val("RE : ${msgDetail.msg}");
		$("#isExistId").css("display", "none");
	}
</script>
</body>
</html>