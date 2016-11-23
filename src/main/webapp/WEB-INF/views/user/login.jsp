<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EasySafe-Log in</title>
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/styles.css"
	type="text/css" />
<!-- iCheck -->
<link href="/resources/plugins/iCheck/square/blue.css" rel="stylesheet"
	type="text/css" />

</head>
	<%@ include file="../nav.jsp" %>
<body class="login-page" style="">
	<div class="login-box">
		<!-- 		<div class="login-logo" style="text-align:center;"> -->
		<!-- title was here -->

	</div>
	<!-- /.login-logo -->
	<div class="login-box-body">


		<div class="container" id="main">

			<%-- 				 ${uvo.uname} 님 환영합니당 <br> --%>

			<div class="row">
				<div class="col-md-4 col-sm-6"></div>
				<div class="col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/index.do"><img
						class="center-block" alt="너구리"
						src="${pageContext.request.contextPath}/resources/media/img/hi_nobg.png"
						style="width: 70%; height: 70%;" /></a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-sm-6"></div>
				<div class="col-md-4 col-sm-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4>Log in</h4>
						</div>
						<div class="panel-body">
							<div class="list-group">
								<div class="form-group has-feedback">
					<form action="/user/loginPost.do" method="post">
									<input type="text" name="uid" class="form-control"
										placeholder="ID" /> <span
										class="glyphicon glyphicon-envelope form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input type="password" name="upw" class="form-control"
										placeholder="Password" /> <span
										class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
								<div class="row">
									<div class="col-xs-8">
										<div class="checkbox icheck">
											<label> <input type="checkbox" name="useCookie">
												Remember Me
											</label>
										</div>
									</div>
									<!-- /.col -->
									<div class="col-xs-4">
										<button type="submit"
											class="btn btn-primary btn-block btn-flat">Login</button>
			</form>
									</div>
									<!-- /.col -->
								</div>
							</div>
							<a href="#">비밀번호 찾기</a><br> <a href="register.html">가입하기</a>
						</div>
					</div>
				</div>
			</div>




		</div>




	</div>
	<!-- /.login-box-body -->
	<!-- /.login-box -->

	<!-- jQuery 2.1.4 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"
		type="text/javascript"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>