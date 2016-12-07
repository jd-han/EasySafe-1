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
		</div>
		번호:${msgDetail.msgNo}
		받는유저:${msgDetail.receiveUser}
		보낸유저:${msgDetail.sendUser}
		내용:${msgDetail.msg}
		제목:${msgDetail.msgTitle}
		날짜:${msgDetail.regDate}
		열람:${msgDetail.readable}
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#curPage").html("메시지 내용");
	});
</script>
</body>
</html>