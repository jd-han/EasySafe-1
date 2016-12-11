<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<!-- <link href="/resources/plugins/iCheck/square/blue.css" rel="stylesheet"
	type="text/css" /> -->
<!-- 구글 로그인 -->
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<style type="text/css">
	#gSignInWrapper{
		width: 100%;
		padding: 0 0 0 0;
	}
	#FBloginBtn{
		width: 100%;
		background: linear-gradient(#4c69ba, #3b55a0);
		border-radius: 5px;
		border: thin solid #888;
		box-shadow: 1px 1px 1px grey;
		white-space: nowrap;
		margin-bottom: 5px;
	}
	#FBloginBtn:HOVER{
		opacity: 0.5;
	}
	.customGPlusSignIn {
		display: inline-block;
		background: white;
		color: #444;
		width: 100%;
		border-radius: 5px;
		border: thin solid #888;
		box-shadow: 1px 1px 1px grey;
		white-space: nowrap;
	}
	
	.customGPlusSignIn:hover {
		cursor: pointer;
		opacity: 0.5;
	}
	
	span.label {
		font-family: serif;
		font-weight: normal;
	}
	
	span.icon {
		background: url('https://www.google.com/favicon.ico') transparent 8px
			50% no-repeat;
		display: inline-block;
		vertical-align: middle;
		width: 42px;
		height: 42px;
	}
	
	span.buttonText {
		display: inline-block;
		vertical-align: middle;
		padding-left: 5px;
		padding-right: 12px;
		font-size: 24px;
		font-weight: bold;
		/* Use the Roboto font that is loaded in the <head> */
		font-family: 'Roboto', sans-serif;
	}
</style>
</head>
<body class="login-page" style="">
<%@ include file="../nav.jsp"%>
<%@ include file="findModal.jsp"%>
	<div class="login-box">
		<!-- title was here -->

	</div>
	<!-- /.login-logo -->
	<div class="login-box-body">

		<div class="container" id="main">

			<div class="row">
				<div class="col-md-4 col-sm-6"></div>
				<div class="col-md-4 col-sm-6]">
				<img style="width: 60px; height: 200px" alt="z" src="${pageContext.request.contextPath}/resources/media/img/clear.png">
					<a href="${pageContext.request.contextPath}/index.do"><img
					 alt="너구리"
						src="${pageContext.request.contextPath}/resources/media/img/hi_nobg.png"
						style="width: 80%; height: 80%;" /></a>
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
						<form action="/user/loginPost.do" method="post" id="loginForm">
							<button id="FBloginBtn"
								class="fb-login-button"
								data-scope="public_profile,email" data-max-rows="1"
								data-size="xlarge" data-show-faces="false"
								data-auto-logout-link="true" onlogin="checkLoginState();"></button>
							<br>
							<!-- 구글 로그인 버튼 -->
							<button id="gSignInWrapper"
								style="background: none; border: none;" onclick="return false;">
								<div id="googleLoginBtn" class="customGPlusSignIn">
									<span class="icon"></span><span class="buttonText">로그인</span>
								</div>
							</button>
							<br>
							<br>
							<div class="form-group has-feedback">
								<input type="text" id="uid" name="uid" class="form-control" placeholder="ID" />
								<span class="glyphicon glyphicon-user form-control-feedback"></span>
							</div>
							<div class="form-group has-feedback">
								<input type="password" name="upw" class="form-control" placeholder="Password" />
								<span class="glyphicon glyphicon-lock form-control-feedback"></span>
							</div>
							<div class="row">
								<div class="col-xs-8">
									<div class="checkbox icheck">
										<label><input type="checkbox" name="useCookie">
											Remember Me
										</label>
									</div>
								</div>
							</div>
							<!-- /.col -->
							<div class="col-xs-5 pull-right">
							<button type="submit" class="btn btn-primary btn-block btn-flat">Login</button>
							<br>
							<a href="#findModal" data-toggle="modal" onclick="resetFindModal();">비밀번호 찾기</a><br><a href="register.do">가입하기</a>
							</div>
						</form>
						</div>
						<!-- /.col -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	
		
		$(document).ready(function(){
			$("#curPage").html("로그인");
			startApp();
		});

		
		
		
		
		// 페이스북 로그인 부분
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			
			if (response.status === 'connected') {
				// 페이스북 로그인 성공
				FB.api('/me', function(response) {
					console.log('Successful login for FB: ' + response.name);
					console.dir("FB response : " + response);
					loginAPI(response);
				});
			} else if (response.status === 'not_authorized') {
				// 페이스북 로그아웃 앱
				//document.getElementById('status').innerHTML = 'Please login to this app.';
			} else {
				// 페이스북 로그아웃
				//logoutAPI();				
			}
		}

		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '579324558918023',
				cookie : true, // enable cookies to allow the server to access 
				// the session
				xfbml : true, // parse social plugins on this page
				version : 'v2.8' // use graph api version 2.5
			});

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		};

		// Load the SDK asynchronously
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/ko_KR/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		// 구글 로그인 부분
		var googleUser = {};
		var startApp = function() {
			gapi
				.load(
					'auth2',
					function() {
						// Retrieve the singleton for the GoogleAuth library and set up the client.
						auth2 = gapi.auth2
							.init({
								client_id : '129490733099-cbhgf7srukhsjjs31stn7mtcdes5l47s.apps.googleusercontent.com',
								cookiepolicy : 'single_host_origin'
							// Request scopes in addition to 'profile' and 'email'
							// scope: 'additional_scope'
							});
						attachSignin(document
							.getElementById('googleLoginBtn'));
					});
		};
		function attachSignin(element) {
			console.log(element.id);
			auth2.attachClickHandler(element, {}, function(googleUser) {
				console.log(googleUser);
				console.log(googleUser.getBasicProfile());
				var profile = googleUser.getBasicProfile();

				var obj = {};
				obj.name = profile.getName();
				obj.email = profile.getEmail();
				obj.id = profile.getId();
				obj.googleToken = googleUser.getAuthResponse().id_token;
				obj.pictureUrl = profile.getImageUrl();
				console.log("google obj : " + obj);
				
				// 구글 로그인 성공 처리
				loginAPI(obj);
			}, function(error) {
				alert(JSON.stringify(error, undefined, 2));
			});
		}
		
		// 페이스북, 구글 API 로그인 성공시 들어오는 부분
		function loginAPI(response) {			
			// 페이스북 측에서 오는 정보로 회원정보 부분을 채워넣음
			$("#uid").val(response.id);
			// 로그인 주소로 POST Submit
			///user/loginPost.do
			$("#loginForm").submit();
		}
	</script>
</body>
</html>