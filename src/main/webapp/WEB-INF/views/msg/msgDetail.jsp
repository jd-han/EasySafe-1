<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<div style="width: 40%; display: inline-block;">
			<span class="fa fa-search fa-2x"></span>
			<b style="font-size: 30px;">메시지 내용</b>
			<hr>
			<span class="fa fa-user fa-2x"></span>
			<b>보낸 사람</b>				
			<input type="text" class="form-control input-lg" value="${msgDetail.sendUser}" readonly="readonly" />			
			<br>
			<span class="fa fa-header fa-2x"></span>
			<b>제목</b>
				<input type="text" class="form-control input-lg" value="${msgDetail.msgTitle}" readonly="readonly" />
			<br>
			<span class="fa fa-list-alt fa-2x"></span>
			<b>내용</b>
			<br>
				<textarea class="form-control input-lg" rows="10" cols="23" readonly="readonly"><c:out value="${msgDetail.msg}" /></textarea>
			<br>
			<span class="fa fa-header fa-2x"></span>
			<b>발신일</b>
				<input type="text" class="form-control input-lg" value="<fmt:formatDate value="${msgDetail.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly="readonly" />
			<br>
			<hr>
			<c:if test="${replyBtn eq 'OFF'}">
			<div class="col-xs-2" style="margin-left: -15px; width: 40%;">
				<a href="#msgModal" data-toggle="modal" class="btn btn-primary center-block" onclick="replyModal()">답장 보내기</a>
			</div>
			</c:if>
			<div class="col-xs-2" style="margin-left: -15px; width: 40%;">
				<a href="${pageContext.request.contextPath}/msg/msgList.do" class="btn btn-success center-block">목록으로</a>
			</div>
			<br><br><br>
		</div>
		<img class="center-block" style="float: right; display: inline-block; margin-top:15%; margin-right:5%; width: 50%;" src="${pageContext.request.contextPath}/resources/media/img/omnomnom_nobg.png"/>
		</div>
	</div>
<script type="text/javascript">
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