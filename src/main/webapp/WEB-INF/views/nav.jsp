<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- JQuery import -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type='text/javascript' src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	  crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/styles.css" 
	  type="text/css"/>
<style type="text/css">
	.navbar-header{
		position: absolute;
		right: 235px;
		vertical-align: middle;
	}
	.glowicon{
		animation-name: glow;
		animation-duration: 1s;
		animation-iteration-count: infinite;
		animation-direction: alternate;
	}
	@keyframes glow {
	    from {opacity: 1.0}
	    to {opacity: 0.1}
	}
	a{
		text-decoration: none !important;
	}
</style>
<%@ include file="alertModal.jsp" %>
<div class="navbar navbar-default" id="subnav">
	<div class="col-md-12">
       <div class="collapse navbar-collapse" id="navbar-collapse2">
       <span style="float: left;">
			<h4 id="curPage">INDEX</h4>	
			<a href="#alertModal" data-toggle="modal" onclick="callAlert('눌러봄','눌렀다고','ync');">ff</a>	        
       </span>
       <div class="navbar-header">
<%--        <c:out value="${uvo.ulevel}"></c:out> --%>
<c:choose> 
		 <c:when test="${!empty uvo}"> 
		 		<c:choose>
		 		
				 	<c:when test="${uvo.ulevel eq 'user'}">
				 		<span id="isMsg"></span>
				          <a href="#" style="margin-left:15px;" class="navbar-btn btn btn-default btn-plus dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-home" style="color:#dd1111;"></i> Menu <small><i class="glyphicon glyphicon-chevron-down"></i></small></a>
				          <ul class="nav dropdown-menu custommenu">
				              <li><a href="${pageContext.request.contextPath}/user/mypage.do"><i class="glyphicon glyphicon-user" style="color:#1111dd;"></i> Profile</a></li>
				              <li><a href="${pageContext.request.contextPath}/history/history.do"><i class="glyphicon glyphicon-dashboard" style="color:#0000aa;"></i> History</a></li>
				              <li><a href="${pageContext.request.contextPath}/msg/msgList.do"><i class="glyphicon glyphicon-envelope" style="color:#ffae00;"></i> Message</a></li>
				<!--               <li><a href="#"><i class="glyphicon glyphicon-inbox" style="color:#11dd11;"></i> Pages</a></li> -->
				              <li class="nav-divider"></li>
				              <li><a href="#"><i class="glyphicon glyphicon-cog" style="color:#dd1111;"></i> Settings</a></li>
				              <li><a href="#"> More..</a></li>
				          </ul>
				 	</c:when>
				 	
				 	<c:when test="${uvo.ulevel eq 'admin'}">
				 		<span id="isMsg"></span>
				 		<span id="isRequestUser"></span>
				          <a href="#" style="margin-left:15px;" class="navbar-btn btn btn-default btn-plus dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-home" style="color:#dd1111;"></i> Menu <small><i class="glyphicon glyphicon-chevron-down"></i></small></a>
				          <ul class="nav dropdown-menu custommenu">
				              <li><a href="${pageContext.request.contextPath}/user/mypage.do"><i class="glyphicon glyphicon-user" style="color:#1111dd;"></i> Profile</a></li>
				              <li><a href="${pageContext.request.contextPath}/history/history.do"><i class="glyphicon glyphicon-dashboard" style="color:#0000aa;"></i> History</a></li>
				              <li><a href="${pageContext.request.contextPath}/msg/msgList.do"><i class="glyphicon glyphicon-envelope" style="color:#ffae00;"></i> Message</a></li>
				              <li class="nav-divider"></li>
				              <li><a href="${pageContext.request.contextPath}/mod/listPage.do"><i class="glyphicon glyphicon-inbox" style="color:#11dd11;"></i> Modify Users</a></li>
				              <li><a href="#"><i class="glyphicon glyphicon-cog" style="color:#dd1111;"></i> Settings</a></li>
				              <li><a href="#"> More..</a></li>
				          </ul>
				 	</c:when>
	         </c:choose>
	      
	 </c:when>
 
	 <c:otherwise>
	 </c:otherwise>
 
</c:choose>
      
      
        </div>
       <span>
	   		<ul class="nav navbar-nav navbar-right">
		        <li class="active"><a href="${pageContext.request.contextPath}/index.do">Main</a></li>		        
		        	<c:choose>
		        	<c:when test="${empty uvo}">
		        		<li><a href="${pageContext.request.contextPath}/user/login.do" role="button">Login</a></li>
		        		<li><a href="${pageContext.request.contextPath}/user/register.do" role="button">
<!-- 		        		<i class="glyphicon glyphicon-plus"></i> -->
		        		Join</a></li>
		        	</c:when>
		        	<c:otherwise>
		        		<li><a href="${pageContext.request.contextPath}/user/logout.do" role="button">Logout</a></li>
		        	</c:otherwise>
		        	</c:choose>	        	
		        <li><a href="${pageContext.request.contextPath}/notice/list.do" role="button" data-toggle="modal">Notice</a></li>
	        </ul>
        </span>
       	</div>	
    </div>	
</div>

<script>
	// 전문가 신청자가 있는지 ajax 쏴서 판별
	$(document).ready(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/mod/listAll.do",
			type: "POST"
		})
		.done(function(result) {
             if(result){
            	 $("#isRequestUser").html("<a href='${pageContext.request.contextPath}/mod/listPage.do'><img class='glowicon' data-toggle='tooltip' data-placement='bottom' title='전문가 신청을 해온 유저가 있습니다' height='30px;'"+ 
            	 							"src='${pageContext.request.contextPath}/resources/media/img/email.png' /></a>");
             }
        });
		isMsg();
	});
	function isMsg(){
		// 받은 메시지 있는지 ajax 쏴서 판별
		$.ajax({
			url: "${pageContext.request.contextPath}/msg/isMsg.do",
			type: "POST"
		})
		.done(function(result) {
             if(result == "AN"){
            	 $("#isMsg").html("<a style='text-decoration: none;' href='${pageContext.request.contextPath}/msg/msgList.do'>"
            	 				 +"<img class='glowicon' data-toggle='tooltip' data-placement='bottom' title='당신에게 온 새로운 메시지가 있습니다' height='30px;' src='${pageContext.request.contextPath}/resources/media/img/greenemail.png' />"
            	 				 +"&nbsp;&nbsp;<img class='glowicon' data-toggle='tooltip' data-placement='bottom' title='운영진으로부터 온 새로운 메시지가 있습니다' height='30px;' src='${pageContext.request.contextPath}/resources/media/img/email.png' />"
            	 				 +"</a>");
             }else if(result == "A"){
            	 $("#isMsg").html("<a href='${pageContext.request.contextPath}/msg/msgList.do'><img class='glowicon' data-toggle='tooltip' data-placement='bottom' title='운영진으로부터 온 새로운 메시지가 있습니다' height='30px;'"+ 
                	 					"src='${pageContext.request.contextPath}/resources/media/img/email.png' /></a>");
             }else if(result == "N"){
            	 $("#isMsg").html("<a href='${pageContext.request.contextPath}/msg/msgList.do'><img class='glowicon' data-toggle='tooltip' data-placement='bottom' title='당신에게 온 새로운 메시지가 있습니다' height='30px;'"+ 
					"src='${pageContext.request.contextPath}/resources/media/img/greenemail.png' /></a>");
             }
        });
	}
</script>