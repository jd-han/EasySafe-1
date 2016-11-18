<%@ page language="java" contentType="text/html; charset=UTF-8"
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="${pageContext.request.contextPath}/index.do"><b>EasySafe</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">Login</p>


			<div class="container" id="main">
				 ${uvo.uname} 님 환영합니딩 <br>


				<div class="row">
					<div class="col-md-4 col-sm-6"></div>
					<div class="col-md-4 col-sm-6">
						<div class="panel panel-default">
							<div class="panel-heading">
										<form action="/user/loginPost.do" method="post">
								<h4>Log in</h4>
							</div>
							<div class="panel-body" >
								<div class="list-group">
									<div class="form-group has-feedback">
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
										</div>
										<!-- /.col -->
										</form>
									</div>
								</div>
										<a href="#">비밀번호 찾기</a><br><a href="register.html">가입하기</a>
							</div>
						</div>
					</div>
				</div>




			</div>




		</div>
		<!-- /.login-box-body -->
	</div>
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