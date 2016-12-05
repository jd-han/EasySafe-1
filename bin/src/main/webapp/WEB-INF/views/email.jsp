<!-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<h2>email 보내기</h2>
<form name="emailSend" action="/app/emailSend.do" method="POST">
	To <input type="text" name="emailTo" /><br>
	Subject <input type="text" name="emailSubject" /><br>
	Content <input type="text" name="emailContent" /><br>
	<button type="submit">email 보내기</button>
</form>

</body>
</html>