<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>EasySafe - 메시지</title>
<style type="text/css">
	b{
		font-size: 20px;
	}
</style>
</head>
<body>
<%@ include file="../nav.jsp"%>
<%@ include file="msgModal.jsp"%>
	<div class="container" id="main">
		<div class="panel panel-default">
			<div class="panel-heading">
			<span class="fa fa-paper-plane fa-2x"></span>
			<label style="font-size: 30px;">메시지 보기</label>
			</div>
			<div class="panel-body" style="width: 100%;">
			<ul class="nav nav-tabs">
				<li class="active">					
					<a href="#receiveMsg" data-toggle="tab"><span class="fa fa-reply fa-2x"></span>
					&nbsp;&nbsp;<b>받은메시지</b></a>
				</li>
				<li class>					
					<a href="#sendMsg" data-toggle="tab"><span class="fa fa-share fa-2x"></span>
					&nbsp;&nbsp;<b>보낸메시지</b></a>
				</li>
			</ul>
			<div class="tabbable">
				<div class="tab-content">
					<div class="tab-pane active" id="receiveMsg">
						<div>
						<c:choose>
							<c:when test="${!empty msgReceiveList}">
							<table class="table" style="border: 1px solid #cccccc; text-align: center;">
								<tr style="height: 50px;">
									<td class="col-md-1"><span class="fa fa-user fa-2x"></span><b>&nbsp;보낸 사람</b></td>
									<td class="col-md-3"><i class="fa fa-commenting-o fa-2x" aria-hidden="true"></i><b>&nbsp;제목</b></td>
									<td class="col-md-2"><span class="fa fa-clock-o fa-2x"></span><b>&nbsp;보낸 날짜</b></td>
									<td colspan="2" style="width: 10%;"><span class="fa fa-eye fa-2x"></span><b>&nbsp;열람여부</b></td>
									<td class="col-md-2"><span class="fa fa-trash fa-2x"></span><b>&nbsp;메시지 삭제</b></td>
								</tr>
								<c:forEach items="${msgReceiveList}" var="msgReceive">
									<tr style="height: 50px;">
									<c:choose>
										<c:when test="${msgReceive.readable eq 'A' || msgReceive.readable eq 'E'}">													
											<td style="font-weight: bold; line-height: 200%;" class="col-md-2">
											<span class="fa fa-user-secret" data-toggle="tooltip" data-placement="bottom" title="관리자 입니다"></span>
											<%-- <a href="${pageContext.request.contextPath}/msg/msgDetail.do?msgNo=${msgReceive.msgNo}"></a> --%>
											${msgReceive.sendUser}
											</td>												
										</c:when>
										<c:otherwise>
											<td style="line-height: 200%;" class="col-md-2">
											<%-- <a href="${pageContext.request.contextPath}/msg/msgDetail.do?msgNo=${msgReceive.msgNo}"></a> --%>
											${msgReceive.sendUser}
											</td>
										</c:otherwise>
									</c:choose>
									<td style="line-height: 200%;" class="col-md-2"><a href="${pageContext.request.contextPath}/msg/msgDetail.do?msgNo=${msgReceive.msgNo}&isSend=N">${msgReceive.msgTitle}</a></td>
									<td style="line-height: 200%;" class="col-md-2"><fmt:formatDate value="${msgReceive.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<c:choose>
										<c:when test="${msgReceive.readable eq 'A'}">
										<td style="line-height: 200%;">미열람</td>
										<td><img data-toggle="tooltip" data-placement="right" title="운영진으로부터의 메시지 입니다" height="30px;" src="${pageContext.request.contextPath}/resources/media/img/email.png" /></td>												
										</c:when>
										<c:when test="${msgReceive.readable eq 'E'}">
										<td style="line-height: 200%;">열람</td>
										<td><img data-toggle="tooltip" data-placement="right" title="운영진으로부터의 메시지 입니다" height="30px;" src="${pageContext.request.contextPath}/resources/media/img/email.png" /></td>												
										</c:when>
										<c:when test="${msgReceive.readable eq 'N'}">
										<td style="line-height: 200%;">미열람</td>
										<td></td>												
										</c:when>
										<c:otherwise>
										<td style="line-height: 200%;">열람</td>
										<td></td>
										</c:otherwise>
									</c:choose>	
									<td style="line-height: 200%;" class="col-md-1"><button class="btn btn-danger" onclick="deleteMsg(${msgReceive.msgNo});">삭제</button></td>										
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
						<div>
						<c:choose>
						<c:when test="${!empty msgSendList}">
						<table class="table" style="text-align: center;">
							<tr style="height: 50px;">
								<td class="col-md-2"><span class="fa fa-user fa-2x"></span><b>받는 사람</b></td>
								<td class="col-md-2"><span class="fa fa-header fa-2x"></span><b>제목</b></td>
								<td class="col-md-2"><span class="fa fa-clock-o fa-2x"></span><b>보낸 날짜</b></td>
								<td class="col-md-2"><span class="fa fa-eye fa-2x"></span><b>열람여부</b></td>
							</tr>
							<c:forEach items="${msgSendList}" var="msgSend">
								<tr style="height: 50px;">
									<!-- <td style="line-height: 200%;" class="col-md-2"> -->
										<%-- <c:choose>
											<c:when test="${msgSend.readable eq 'A' || msgSend.readable eq 'E'}"> --%>
											<%-- <td style="font-weight: bold; line-height: 200%;" class="col-md-2">
											<span class="fa fa-user-secret" data-toggle="tooltip" data-placement="bottom" title="관리자 입니다"></span>											
											${msgSend.receiveUser}
											</td> --%>
											<%-- </c:when>
											<c:otherwise> --%>
											<td style="line-height: 200%;" class="col-md-2">
											${msgSend.receiveUser}
											</td>
											<%-- </c:otherwise>
										</c:choose> --%>
									<!-- </td> -->
									<td style="line-height: 200%;" class="col-md-2">
										<a href="${pageContext.request.contextPath}/msg/msgDetail.do?msgNo=${msgSend.msgNo}&isSend=Y">${msgSend.msgTitle}</a>
									</td>
									<td style="line-height: 200%;" class="col-md-2"><fmt:formatDate value="${msgSend.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<c:choose>
										<c:when test="${msgSend.readable eq 'A' || msgSend.readable eq 'N'}">
										<td style="line-height: 200%;" class="col-md-1">미열람</td>
										</c:when>
										<c:otherwise>
										<td style="line-height: 200%;" class="col-md-1">열람</td>
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
			<div class="col-xs-12" style="padding-right: 0px !important;">
				<a href="#msgModal" data-toggle="modal" class="btn btn-primary pull-right" onclick="resetModal()">메시지 작성</a>
			</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#isMsg").css("display", "none");
	});
	
	function resetModal(){
		findId = false;
		$("#msgUser").val("");
		$("#msgUser").attr("readonly", false);
		$("#findBtn").css("display", "table-cell");
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