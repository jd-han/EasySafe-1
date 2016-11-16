<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- JQuery import -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>EasySafeWebPage</title>
</head>
<body>

index.jsp 페이지입니다
<br>
${uvo.uname} 님 환영합니다
<br>
<input type="text" id="keyword" placeholder="검색어를 입력하세요" />
<button id="search">검색</button>

<script type="text/javascript">
	$("#search").click(function(){
		//alert("성분검색누름" + $("#inputChem").val());
		self.location = "search" + "?key=" + $("#keyword").val();
	});
</script>
</body>
</html>