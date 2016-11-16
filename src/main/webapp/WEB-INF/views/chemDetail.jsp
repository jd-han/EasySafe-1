<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	이름 : ${chemResult.name}<br>
	국가별 안정성..?<br>
	미국 : ${chemResult.us}<br>
	유럽 : ${chemResult.eu}<br>
	일본 : ${chemResult.japan}<br>
	중국 : ${chemResult.china}<br>
	호주 : ${chemResult.australia}<br>
</body>
</html>