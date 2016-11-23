<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- JQuery import -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	  crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/styles.css" 
	  type="text/css"/>
<div class="navbar navbar-default" id="subnav">
	<div class="col-md-12">
       <!--<div class="navbar-header">          
         <a href="#" style="margin-left:15px;" class="navbar-btn btn btn-default btn-plus dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-home" style="color:#dd1111;"></i> Home <small><i class="glyphicon glyphicon-chevron-down"></i></small></a>
         <ul class="nav dropdown-menu">
             <li><a href="#"><i class="glyphicon glyphicon-user" style="color:#1111dd;"></i> Profile</a></li>
             <li><a href="#"><i class="glyphicon glyphicon-dashboard" style="color:#0000aa;"></i> Dashboard</a></li>
             <li><a href="#"><i class="glyphicon glyphicon-inbox" style="color:#11dd11;"></i> Pages</a></li>
             <li class="nav-divider"></li>
             <li><a href="#"><i class="glyphicon glyphicon-cog" style="color:#dd1111;"></i> Settings</a></li>
             <li><a href="#"><i class="glyphicon glyphicon-plus"></i> More..</a></li>
         </ul>
         
         
         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse2">
         <span class="sr-only">Toggle navigation</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         </button>      	
       </div>-->
       <div class="collapse navbar-collapse" id="navbar-collapse2">
       <span style="float: left;">
	        <!-- uvo = ${uvo.uid}
			<br>index.jsp 페이지입니다
			<br> ${uvo.uname} 님 환영합니다-->
			<h1 id="curPage">INDEX</h1>
		        <%-- <c:choose>
		        	<c:when test="${empty uvo}">
			        	<button id="goLogin">로그인</button>			        	
			        </c:when>
			        <c:when test="${uvo eq ''}">
			        	<button id="goLogout">로그아웃</button>
			        	<button id="goUserInfo">회원정보</button>
			        </c:when>
		        </c:choose> --%>
        </span>
        <span>
	        <ul class="nav navbar-nav navbar-right">
	        	<li><a href="#">Menu</a></li>
		        <li class="active"><a href="${pageContext.request.contextPath}/index.do">Main</a></li>		        
		        	<c:choose>
		        	<c:when test="${empty uvo}">
		        		<li><a href="${pageContext.request.contextPath}/user/login.do" role="button">Login</a></li>
		        		<li><a href="${pageContext.request.contextPath}/user/register.do" role="button">Join</a></li>
		        	</c:when>
		        	<c:otherwise>
		        		<li><a href="${pageContext.request.contextPath}/user/logout.do" role="button">Logout</a></li>
		        		<li><a href="#" role="button">UserInfo</a></li>
		        	</c:otherwise>
		        	</c:choose>	        	
		        <li><a href="#aboutModal" role="button" data-toggle="modal">About</a></li>
	        </ul>
        </span>
       </div>	
    </div>	
</div>

<script>
	/* $(document).ready(function(){
		alert('${uvo}');
	}); */
	/* $("#goLogin").click(function(){
		self.location = "login.do";
	});
	$("#goLogout").click(function(){
		self.location = "user/logout.do";
	});
	$("#goUserInfo").click(function(){
		//self.location = "user/login.do";
		alert("회원정보 페이지로 이동했다 치자");
	}); */
</script>