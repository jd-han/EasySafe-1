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
	<div class="container-fluid" style="padding-top: 120px !important;" id="main">	
		<div class="row">
		<div class="col-md-12">
		<div class="col-md-1"></div>
		<div class="col-md-5">
	
		<div class="well">
		<div style="width: 100%; display: inline-block;">
			<span class="fa fa-search fa-2x"></span>
			<b style="font-size: 30px;">메시지 보기</b>
			<hr>
			 &nbsp;<span class="fa fa-user fa-2x"></span>
			<b>보낸 사람</b>				
			<input type="text" class="form-control input-lg" value="${msgDetail.sendUser}" readonly="readonly" />			
			<br>
			
			<b> &nbsp;<i class="fa fa-caret-right" aria-hidden="true"></i> &nbsp;제목</b>
				<input type="text" class="form-control input-lg" value="${msgDetail.msgTitle}" readonly="readonly" />
			<br>
			<b> &nbsp;<i class="fa fa-caret-right" aria-hidden="true"></i> &nbsp;내용</b>
			<br>
				<textarea class="form-control input-lg" rows="10" cols="23" readonly="readonly"><c:out value="${msgDetail.msg}" /></textarea>
			<br>
		
			<b> &nbsp;<i class="fa fa-calendar-check-o" aria-hidden="true"></i> 발신일</b>
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
		</div>
			</div>
		<div class="col-md-6">
			<img height="420px" width="400px" alt="easysafe" src="${pageContext.request.contextPath}/resources/media/img/clear.png"/>
		<img style="float: right; margin-top:15%; margin-right:5%; width: 50%;" src="${pageContext.request.contextPath}/resources/media/img/pye1.png"/>
		</div>
		</div>
		</div>
	</div>
<script type="text/javascript">
	function replyModal(){
		findId = false;
		$("#msgUser").val("${msgDetail.sendUser}");
		$("#msgUser").attr("readonly", true);
		$("#findBtn").css("display", "none");
		$("#msgTitle").val("RE :${msgDetail.msgTitle}");
		$("#msgContent").val("원본 내용 : ${msgDetail.msg}");
		$("#isExistId").css("display", "none");
	}
</script>
</body>
</html>