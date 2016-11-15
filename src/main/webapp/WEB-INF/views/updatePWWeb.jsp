<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<form name="regist" action="/app/regist" method="post">
	id : ${UserVO.uid}
	password : <input type="password" name ="upw" /><br>
	name :  ${UserVO.uname}
	e-mail :  ${UserVO.umail}
	
	<button type="submit">비밀번호 변경하기</button>
	<button type="reset">초기화</button>
	<button type="button" >취소</button>
	
</form>

</body>
</html>