<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>메시지</title>
</head>
<body>
<%@ include file="../nav.jsp"%>
<%@ include file="msgModal.jsp"%>
	<div class="container" id="main">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>메시지 보기</h3>
			</div>
			<div class="panel-body" style="width: 100%;">
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#receiveMsg" data-toggle="tab">받은메시지</a>
				</li>
				<li class>
					<a href="#sendMsg" data-toggle="tab">보낸메시지</a>
				</li>
			</ul>
			<div class="tabbable">
				<div class="tab-content">
					<div class="tab-pane active" id="receiveMsg">
						<div class="well well-sm">
						<c:choose>
							<c:when test="${!empty msgReceiveList}">
							<table class="table" style="border: 1px solid black;">
								<tr style="height: 50px;">
									<td class="col-md-2">보낸 사람</td>
									<td class="col-md-2">제목</td>
									<td class="col-md-2">보낸 날짜</td>
									<td class="col-md-1">열람 여부</td>
									<td class="col-md-1">메시지 삭제</td>
								</tr>
								<c:forEach items="${msgReceiveList}" var="msgReceive">
										<tr style="height: 50px;">
										<c:choose>
											<c:when test="${msgReceive.readable eq 'A' || msgReceive.readable eq 'E'}">													
												<td style="font-weight: bold;" class="col-md-2">
												<%-- <a href="${pageContext.request.contextPath}/msg/msgDetail.do?msgNo=${msgReceive.msgNo}"></a> --%>
												${msgReceive.sendUser}
												</td>												
											</c:when>
											<c:otherwise>
												<td class="col-md-2">
												<%-- <a href="${pageContext.request.contextPath}/msg/msgDetail.do?msgNo=${msgReceive.msgNo}"></a> --%>
												${msgReceive.sendUser}
												</td>
											</c:otherwise>
										</c:choose>
										<td class="col-md-2"><a href="${pageContext.request.contextPath}/msg/msgDetail.do?msgNo=${msgReceive.msgNo}&isSend=N">${msgReceive.msgTitle}</a></td>
										<td class="col-md-2"><fmt:formatDate value="${msgReceive.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<c:choose>
											<c:when test="${msgReceive.readable eq 'A'}">
											<td class="col-md-1">미열람 <img data-toggle="tooltip" data-placement="right" title="운영진으로부터의 메시지 입니다" height="30px;" src="${pageContext.request.contextPath}/resources/media/img/email.png" /></td>												
											</c:when>
											<c:when test="${msgReceive.readable eq 'E'}">
											<td class="col-md-1">열람 <img data-toggle="tooltip" data-placement="right" title="운영진으로부터의 메시지 입니다" height="30px;" src="${pageContext.request.contextPath}/resources/media/img/email.png" /></td>												
											</c:when>
											<c:when test="${msgReceive.readable eq 'N'}">
											<td class="col-md-1">미열람</td>												
											</c:when>
											<c:otherwise>
											<td class="col-md-1">열람</td>
											</c:otherwise>
										</c:choose>	
										<td class="col-md-1"><button class="btn btn-danger" onclick="deleteMsg(${msgReceive.msgNo});">삭제</button></td>										
									</tr>								
								</c:forEach>
							</table>
							</c:when>
							<c:otherwise>
								받은 메시지가 없습니다.
							</c:otherwise>
						</c:choose>
						</div>
					</div>
					<div class="tab-pane" id="sendMsg">
						<div class="well well-sm">
						<c:choose>
						<c:when test="${!empty msgSendList}">
						<table class="table" style="border: 1px solid black;">
							<tr style="height: 50px;">
								<td class="col-md-2">받는 사람</td>
								<td class="col-md-2">제목</td>
								<td class="col-md-2">보낸 날짜</td>
								<td class="col-md-1">열람 여부</td>
							</tr>
							<c:forEach items="${msgSendList}" var="msgSend">
								<tr style="height: 50px;">
									<td class="col-md-2">
										<%-- <a href="${pageContext.request.contextPath}/msg/msgDetail.do?msgNo=${msgSend.msgNo}">${msgSend.receiveUser}</a> --%>
										${msgSend.receiveUser}
									</td>
									<td class="col-md-2">
										<a href="${pageContext.request.contextPath}/msg/msgDetail.do?msgNo=${msgSend.msgNo}&isSend=Y">${msgSend.msgTitle}</a>
									</td>
									<td class="col-md-2"><fmt:formatDate value="${msgSend.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<c:choose>
										<c:when test="${msgSend.readable eq 'A' || msgSend.readable eq 'N'}">
										<td class="col-md-1">미열람</td>
										</c:when>
										<c:otherwise>
										<td class="col-md-1">열람</td>
										</c:otherwise>
									</c:choose>										
								</tr>								
							</c:forEach>
						</table>
						</c:when>
						<c:otherwise>
							보낸 메시지가 없습니다.
						</c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-2">
				<a href="#msgModal" data-toggle="modal" class="btn btn-primary center-block" onclick="resetModal()">메시지 작성</a>
			</div>
			</div>
		</div>
	</div>	
<script type="text/javascript">
	$(document).ready(function(){
		$("#curPage").html("메시지");
		$("#isMsg").css("display", "none");
	});
	
	function resetModal(){
		findId = false;
		$("#msgUser").val("");
		$("#msgUser").attr("readonly", false);
		$("#findBtn").css("display", "inline-block");
		$("#msgTitle").val("");
		$("#msgContent").val("");
		$("#isExistId").css("display", "block");
		$("#isExistId").removeClass("alert-success").removeClass("alert-danger").addClass("alert-warning").html("메시지를 받을 유저의 ID를 먼저 검색해 주세요");	
	}
	
	function deleteMsg(delmsgNo){
		$.ajax({
			url: "${pageContext.request.contextPath}/msg/deleteMsg.do",
			type: "POST",
			data: {msgNo: delmsgNo}
		}).done(function(result){
		});
		self.location = "${pageContext.request.contextPath}/msg/msgList.do";
	}
</script>
</body>
</html>