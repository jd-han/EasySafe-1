<%@ page language="java" contentType="text/html; charset=utf-8"
     pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<!-- 구글 로그인 -->
<link href="https://fonts.googleapis.com/css?family=Roboto"
     rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<!-- <script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="129490733099-cbhgf7srukhsjjs31stn7mtcdes5l47s.apps.googleusercontent.com"> -->
<style type="text/css">
.customGPlusSignIn {
     display: inline-block;
     background: white;
     color: #444;
     width: 125px;
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
     background: url('https://www.google.com/favicon.ico') transparent 1px
          50% no-repeat;
     display: inline-block;
     vertical-align: middle;
     width: 42px;
     height: 42px;
}
span.buttonText {
     vertical-align: middle;
     font-size: 24px;
     font-weight: bold;
     /* Use the Roboto font that is loaded in the <head> */
     font-family: 'Roboto', sans-serif;
}
</style>
</head>
<body>
     <%@ include file="../nav.jsp"%>
     <div class="container" id="main">
          <div class="col-md-5">
              <img height="600px" width="500px" alt="easysafe"
                   src="${pageContext.request.contextPath}/resources/media/img/clear.png">
              <img height="100%" width="100%" alt="너구리냠냠"
                   src="${pageContext.request.contextPath}/resources/media/img/omnomnom_nobg.png">
          </div>
          <div class="col-md-5">
              <div class="panel panel-default">
                   <div class="panel-heading">
                        <h4>가입 정보 입력</h4>
                   </div>
                   <div class="panel-body" style="width: 100%;">
                        <form action="registerForm.do" method="POST" id="registForm">
                             <button id="FBloginBtn" style="background: none; border: none;"
                                  class="fb-login-button center-block"
                                  data-scope="public_profile,email" data-max-rows="1"
                                  data-size="xlarge" data-show-faces="false"
                                  data-auto-logout-link="true" onlogin="checkLoginState();"></button>
                             <!-- 구글 로그인 버튼 -->
                             <!-- <div style="background: none; border: none;" class="g-signin2 center-block" data-onsuccess="onSignIn();"></div> -->
                             <button id="gSignInWrapper" class="center-block"
                                  style="background: none; border: none;" onclick="return false;">
                                  <div id="googleLoginBtn" class="customGPlusSignIn">
                                      <span class="icon"></span> <span class="buttonText">로그인</span>
                                  </div>
                                  <div id="googleLogoutBtn" class="customGPlusSignIn">
                                      <span class="icon"></span> <span class="buttonText">로그아웃</span>
                                  </div>
                             </button>
                             <br>
                             <!--<img alt="" src="" id="FBimage" />-->
                             <div class="alert alert-warning" style="text-align: center;"
                                  id="status"></div>
                        
                             <div style= "width: 90%;margin: auto;">
                                  <div class="apihidden">
                                      ID&nbsp;<span class="label label-danger"
                                           style="margin-bottom: 10px">필수</span>
                                      <div class="input-group">
                                           <input type="text" id="joinId" name="uid" class="form-control"
                                                placeholder="ID를 입력하세요" /> <span class="input-group-btn">
                                                <button id="checkDuplicateId" class="btn btn-success">중복확인</button>
                                           </span>
                                      </div>
                                      <div class="alert alert-success" id="isDuplicateId"></div>
                                      패스워드&nbsp;<span class="label label-danger">필수</span> <input
                                           type="password" id="joinPass" name="upw"
                                           class="form-control input" placeholder="패스워드를 입력하세요" /> 패스워드
                                      확인 <input type="password" id="checkPass"
                                           class="form-control input" placeholder="패스워드를 확인하세요" />
                                  </div>
                                  <div class="alert alert-danger" id="isCheckPass"></div>
                                  이름&nbsp;<span class="label label-danger">필수</span> <input
                                      type="text" id="joinName" name="uname" class="form-control"
                                      placeholder="이름을 입력하세요" /> <br>
<!--                                   <div class="alert alert-danger" id="isName"></div> -->
                                  이메일&nbsp;<span class="label label-danger">필수</span>
                                  <div class="input-group text-center">
                                      <input type="text" id="joinEmail" name="umail"
                                           class="form-control input" placeholder="Email을 입력하세요" /> <span
                                           class="input-group-btn">
                                           <button id="checkDuplicateEmail" class="btn btn-success">중복확인</button>
                                      </span>
                                  </div>
                                  <div class="alert alert-danger" id="isDuplicateEmail"></div>
                             </div>
                             <div class="pull-right">
                                  <button id="resetBtn" class="btn btn-lg btn-danger">다시입력</button>
                                  <a id="submitLink" class="btn btn-lg btn-primary">가입하기</a>
                             </div>
                             </form>
                   </div>
              </div>
          </div>
                   <div class="col-md-2"></div>
     </div>
     <script type="text/javascript">
          $(document).ready(function() {
              $("#curPage").html("회원가입");
              $("#isDuplicateId").css("visibility", "hidden");
              $("#isCheckPass").css("visibility", "hidden");
              $("#isDuplicateEmail").css("visibility", "hidden");
              $("#isName").css("visibility", "hidden");
              startApp(); // 구글 로그인 관련 초기화
              $("#googleLogoutBtn").hide();
              document.getElementById('status').innerHTML = "외부 API로 로그인하면<br> 따로 아이디와 비밀번호를 입력할 필요가 없습니다";
          });
          // 페이스북 로그인 부분
          // This is called with the results from from FB.getLoginStatus().
          function statusChangeCallback(response) {
              console.log('statusChangeCallback');
              console.log(response);
              // The response object is returned with a status field that lets the
              // app know the current login status of the person.
              // Full docs on the response object can be found in the documentation
              // for FB.getLoginStatus().
              if (response.status === 'connected') {
                   // 페이스북 로그인 성공
                   FB.api('/me', function(response) {
                        console.log('Successful login for FB: ' + response.name);
                        console.dir("FB response : " + response);
                        loginAPI(response);
                        $("#googleLoginBtn").hide();
                        $("#googleLogoutBtn").hide();
                   });
              } else if (response.status === 'not_authorized') {
                   // 페이스북 로그아웃 앱
                   //document.getElementById('status').innerHTML = 'Please login to this app.';
              } else {
                   // 페이스북 로그아웃
                   logoutAPI();
              }
          }
          // This function is called when someone finishes with the Login
          // Button.  See the onlogin handler attached to it in the sample
          // code below.
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
              // Now that we've initialized the JavaScript SDK, we call
              // FB.getLoginStatus().  This function gets the state of the
              // person visiting this page and can return one of three states to
              // the callback you provide.  They can be:
              //
              // 1. Logged into your app ('connected')
              // 2. Logged into Facebook, but not your app ('not_authorized')
              // 3. Not logged into Facebook and can't tell if they are logged into
              //    your app or not.
              //
              // These three cases are handled in the callback function.
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
          // 페이스북, 구글 API 로그인 성공시 들어오는 부분
          function loginAPI(response) {
              //$("#FBimage").show();
              $(".apihidden").hide();
              //$("#FBimage").attr("src", "http://graph.facebook.com/" + response.id + "/picture");
              document.getElementById('status').innerHTML = response.name
                        + " 님, 접속 성공";
              //$("#confirmbtn").attr("disabled", false);
              // 페이스북 측에서 오는 정보로 회원정보 부분을 채워넣음
              $("#joinId").val(response.id);
              $("#joinEmail").val(response.email);
              $("#joinName").val(response.name);
              // API 가입 설정
              $.ajax({
                   url : "../user/onAPIRegist.do",
                   type : "POST"
              }).done(function(result) {
                   console.log("API 가입 여부 : " + result);
              });
              idChk();
              emailChk();
          }
          // API 로그아웃 처리부분
          function logoutAPI() {
              //$("#FBimage").hide();
              $(".apihidden").show();
              $("#joinId").val("");
              $("#joinEmail").val("");
              $("#joinName").val("");
              document.getElementById('status').innerHTML = "외부 API로 로그인하면<br> 따로 아이디와 비밀번호를 입력할 필요가 없습니다";
              //$("#confirmbtn").attr("disabled", true);
              // API 가입 해제
              $.ajax({
                   url : "../user/offAPIRegist.do",
                   type : "POST"
              }).done(function(result) {
                   console.log("API 가입 여부 : " + result);
              });
              idChk();
              emailChk();
              $("#FBloginBtn").show();
              $("#googleLoginBtn").show();
              $("#googleLogoutBtn").hide();
          }
          // 구글 로그인 부분
          /* function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
            var id_token = googleUser.getAuthResponse().id_token;
            alert(id_token);
            console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
            console.log('Name: ' + profile.getName());
            console.log('Image URL: ' + profile.getImageUrl());
            console.log('Email: ' + profile.getEmail());
          }; */
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
                   // document.getElementById('name').innerText = "Signed in: " +
                   // googleUser.getBasicProfile().getName();
                   var obj = {};
                   obj.name = profile.getName();
                   obj.email = profile.getEmail();
                   obj.id = profile.getId();
                   obj.googleToken = googleUser.getAuthResponse().id_token;
                   obj.pictureUrl = profile.getImageUrl();
                   console.log("google obj : " + obj);
                   // 구글 로그인 성공 처리
                   loginAPI(obj);
                   $("#FBloginBtn").hide();
                   $("#googleLoginBtn").hide();
                   $("#googleLogoutBtn").show();
                   /*$.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/common/member/join/',
                        headers : {
                             "Content-Type" : "application/json; charset=UTF-8"
                        },
                        dataType : 'json',
                        data : JSON.stringify(obj)
                   }).done(function(data){
                        console.log(data)
                        location.reload();
                   });*/
              }, function(error) {
                   alert(JSON.stringify(error, undefined, 2));
              });
          }
          // 구글 로그아웃 처리
          $("#googleLogoutBtn").click(function() {
              var auth2 = gapi.auth2.getAuthInstance();
              auth2.signOut().then(function() {
                   console.log('Google User signed out.');
                   logoutAPI();
              });
          });
          // 아이디 중복여부 체크
          $("#checkDuplicateId").click(function() {
              idChk();
              return false;
          });
          function idChk() {
              $.ajax({
                   url : "../user/checkId.do",
                   type : "POST",
                   data : {
                        "id" : $("#joinId").val()
                   }
              }).done(
                        function(result) {
                             console.log(result);
                             $("#isDuplicateId").css("visibility", result.show);
                             $("#isDuplicateId").removeClass(result.removeClass)
                                       .addClass(result.addClass);
                             $("#isDuplicateId").html(result.msg);
                        });
          }
          // 비밀번호, 비번확인 입력시마다 호출되어 일치 여부 판단
          $(":password").change(function() {
              passChk();
          });
          function passChk() {
              $.ajax({
                   url : "../user/checkPass.do",
                   type : "POST",
                   data : {
                        "oriPass" : $("#joinPass").val(),
                        "checkPass" : $("#checkPass").val()
                   }
              }).done(function(result) {
                   console.log(result);
                   $("#isCheckPass").css("visibility", result.show);
                   $("#isCheckPass").html(result.msg);
              });
          }
          $("#checkDuplicateEmail").click(function() {
              emailChk();
              return false;
          });
          function emailChk() {
              $.ajax({
                   url : "../user/checkEmail.do",
                   type : "POST",
                   data : {
                        "email" : $("#joinEmail").val()
                   }
              }).done(
                        function(result) {
                             console.log(result);
                             $("#isDuplicateEmail").css("visibility", result.show);
                             $("#isDuplicateEmail").removeClass(result.removeClass)
                                       .addClass(result.addClass);
                             $("#isDuplicateEmail").html(result.msg);
                        });
          }
          // 이름 입력 체크하면서 회원가입 실행
          $("#submitLink").click(
                   function() {
                        $.ajax({
                             url : "../user/registerForm.do",
                             type : "POST",
                             data : {
                                  "uid" : $("#joinId").val(),
                                  "upw" : $("#joinPass").val(),
                                  "umail" : $("#joinEmail").val(),
                                  "uname" : $("#joinName").val()
                             }
                        }).done(
                                  function(result) {
                                       console.log(result);
                                      if (result == 'NO') {
                                           $("#isName").css("visibility", "visible");
                                           $("#isName").removeClass("alert-success")
                                                     .addClass("alert-danger");
                                           $("#isName").html("이름을 입력하세요");
                                      } else {
                                           alert("회원가입이 성공적으로 완료되었습니다.");
                                           self.location = "/index.do";
                                      }
                                  });
                   });
          $("#resetBtn").click(function() {
              $("#joinId").val("");
              $("#joinPass").val("");
              $("#checkPass").val("");
              $("#joinEmail").val("");
              $("#joinName").val("");
              idChk();
              passChk();
              emailChk();
              return false;
          });
     </script>
</body>
</html>