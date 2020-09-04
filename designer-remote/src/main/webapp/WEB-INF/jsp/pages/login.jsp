<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/base.jsp" %>

<!DOCTYPE html>
<html dir="ltr">
  <head>
    <meta name="generator"
    content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/images/logo-icon.png" />
    <title>Fallwings-登录</title>
    <!-- Custom CSS -->
	<!--<link href="http://v.bootstrapmb.com/2020/6/akeq8103/dist/css/style.min.css" rel="stylesheet" />-->
	<link href="${path}/css/style.min.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING:Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
  </head>
  <body>
    <div class="main-wrapper">
      <!-- ============================================================== -->
      <!-- Preloader - style you can find in spinners.css -->
      <!-- ============================================================== -->
      <div class="preloader">
        <div class="lds-ripple">
          <div class="lds-pos"></div>
          <div class="lds-pos"></div>
        </div>
      </div>
      <!-- ============================================================== -->
      <!-- Preloader - style you can find in spinners.css -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Login box.scss -->
      <!-- ============================================================== -->
      <div class="auth-wrapper d-flex no-block justify-content-center align-items-center"
      style="background:url(${path}/images/login-register.jpg) no-repeat center center; background-size: cover;">
        <div class="auth-box p-4 bg-white rounded">
          <div id="loginform">
            <div class="logo">
              <h3 class="box-title mb-3">登录</h3>
            </div>
            <!-- Form -->
            <div class="row">
              <div class="col-12">
				<ul class="nav nav-pills bg-nav-pills nav-justified mb-3">
				<li class="nav-item">
					<a href="#pwd" data-toggle="tab" aria-expanded="false" class="nav-link rounded-0 active">
					<span class="d-lg-block">密码登录</span>
					</a>
					</li>
				<li class="nav-item">
					<a href="#yzm" data-toggle="tab" aria-expanded="true" class="nav-link rounded-0 ">
					<span class="d-lg-block">验证码登录</span>
					</a>
					</li>
				
				</ul>
			  
				<div class="tab-content">
					<div class="tab-pane show active" id="pwd">
						<form class="form-horizontal mt-3 form-material" >
						  <div class="form-group mb-3">
							<div class="">
							  <input class="form-control" type="email" required="" id="account" name="account" placeholder="邮箱地址" />
							</div>
						  </div>
						  <div class="form-group mb-4">
							<div class="">
							  <input class="form-control" type="password" required="" id="password" name="password" placeholder="密码" />
							</div>
						  </div>
						  <div class="form-group">
							<div class="d-flex">
							  <div class="checkbox checkbox-info pt-0">
							  <input id="checkbox-signup" type="checkbox" class="material-inputs chk-col-indigo" /> 
							  <label for="checkbox-signup">记住帐号</label></div>
							  <div class="ml-auto">
								<a href="javascript:void(0)" id="to-recover" class="text-muted float-right">忘记密码?</a>
							  </div>
							</div>
						  </div>
						  <div class="form-group text-center mt-4">
							<div class="col-xs-12">
							  <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="button" onclick="login(this)">登录</button>
							</div>
						  </div>
						  
						  <div class="form-group mb-0 mt-4">
							<div class="col-sm-12 justify-content-center d-flex">
							  <p>还没有帐号? 
							  <a href="${path}/regist" class="text-info font-weight-normal ml-1">立即注册</a></p>
							</div>
						  </div>
						</form>
					
					</div>
					<div class="tab-pane " id="yzm">
						<form class="form-horizontal mt-3 form-material">
						  <div class="input-group mb-3">
							
							  <input class="form-control is-valid" type="email" required="" id="account2" name="account" placeholder="邮箱地址" aria-label="" aria-describedby="basic-addon1"/>
							  <div class="input-group-append"><button class="btn btn-info" type="button" onclick="sendCode(this,'login')">获取验证码</button></div>
							
						  </div>
						  <div class="form-group mb-4">
							<div class="">
							  <input class="form-control" type="text" required="" name="yzm" placeholder="请填写验证码" />
							</div>
						  </div>
						  
						  <div class="form-group text-center mt-4">
							<div class="col-xs-12">
							  <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="button" onclick="login(this)">登录</button>
							</div>
						  </div>
						  
						  <div class="form-group mb-0 mt-4">
							<div class="col-sm-12 justify-content-center d-flex">
							  <p>还没有帐号? 
							  <a href="${path}/regist" class="text-info font-weight-normal ml-1">立即注册</a></p>
							</div>
						  </div>
						</form>
					
					</div>
				</div>
			  
                
              </div>
            </div>
          </div>
          <div id="recoverform">
			<div class="logo">
			  <h3 class="font-weight-medium mb-3 bak" style="color:#fc4b6c;"><i class="ti-arrow-left" aria-hidden="true"></i>&nbsp;返回</h3>
            </div>
            <div class="logo">
              <h3 class="font-weight-medium mb-3">重置密码</h3>
              <span class="text-muted">重置密码的验证码将会发送至您的邮箱</span>
            </div>
            <div class="row mt-3 form-material">
              <!-- Form -->
              <form class="col-12">
                <!-- email -->
                <div class="input-group mb-3">
                  
                    <input class="form-control is-valid" type="email" name='account' required="" placeholder="邮箱地址" aria-label="" aria-describedby="basic-addon1"/>
					<div class="input-group-append"><button class="btn btn-info" type="button" onclick="sendCode(this,'forget')">获取验证码</button></div>
                  
                </div>
				<div class="form-group"><input type="password" name="password" class="form-control"  placeholder="请输入新密码" required></div>
				<div class="form-group"><input type="password" name="repassword" class="form-control"  placeholder="请再次输入新密码" required></div>
				<div class="form-group"><input type="text" name="idcode" class="form-control" placeholder="请输入验证码"></div>
                <!-- pwd -->
                <div class="row mt-3">
                  <div class="col-12">
                    <button class="btn btn-block btn-lg btn-primary text-uppercase" type="button" onclick="forget(this)">重置密码</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      
    </div>
   
    <!--<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>-->
    <script src="${path}/js/jquery.min.js"></script>
	<!--<script src="https://cdn.bootcdn.net/ajax/libs/popper.js/2.4.4/cjs/popper.min.js"></script>-->
    <script src="${path}/js/popper.min.js"></script>
	<!--<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>-->
    <script src="${path}/js/bootstrap.min.js"></script>
	<!--<script src="https://cdn.bootcdn.net/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>-->
	<script type="text/javascript" src="${path}/js/jquery.cookie.js"></script>
    
    <script>
$('[data-toggle="tooltip"]').tooltip();$(".preloader").fadeOut();//

$('#to-recover').on("click",function(){$("#loginform").slideUp();$("#recoverform").fadeIn()});
$('.bak').on("click",function(){$("#recoverform").slideUp();$("#loginform").fadeIn()});
$(document).ready(function () {
        if ($.cookie("account") != ""||$.cookie("account") !=null) {
            $("#account").val($.cookie("account"));
            $("#password").val($.cookie("password"));
        }
    });
	
function login(_this) {
	var _this=$(_this);
        var data=_this.parents("form").serializeArray();
        $.ajax({
            url:"${path}/ajax_login",
            data:data,
            type:"post",
            success:function(response){
                if(response.status==1){
                    var account = $("#account").val();
                    var password = $("#password").val();
					if($("#checkbox-signup").is(":checked")){
						$.cookie("account", account, { expires: 30 });
						$.cookie("password", password, { expires: 30 });
					}
                    window.location.href="${path}/index";
                }else if(response.status==0){
                    alert(response.msg);
                }
            }
        })
    }
function sendCode(_this,typee){
	var _this=$(_this);
	var account=_this.parents("form").find("input[name='account']");
    if(account.val() != ""){
        var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if(!myreg.test(account.val())){
            alert("邮箱格式错误");
        }
        _this.text("正在发送");
        _this.attr("disabled","disabled");
        $.ajax({
            url:"${path}/sendIdCode",
            type:"GET",
            //发送数据的第一种格式，字符串...
            data:{"mail":account.val(),type:typee},

            success:function(data){
                var time=30;
                function countDown(){

                    if(time==0){
                        _this.removeAttr("disabled");
                        _this.text("发送验证码");
                        clearInterval(timer);
                    }else{
                        _this.text("已发送("+time+"s)");
                    }
                    time--;
                }
                var timer=setInterval(countDown,1000);


            },
            error:function(){
                _this.text("验证码发送失败");
            }
        });
	}
}
function forget(_this){
	var _this=$(_this).parents("form");
	var pass1=_this.find("input[name='password']").val();
	var pass2=_this.find("input[name='repassword']").val();
	if(pass1!=pass2){
		alert("两次密码输入不匹配!");
	}else{
		var data=_this.serializeArray();
        $.ajax({
            url:"${path}/ajax_forget",
            data:data,
            type:"post",
            success:function(response){
                if(response.status==1){
                    alert("密码修改成功!");
                    window.location.href="${path}/login";
                }else if(response.status==0){
                    alert(response.msg);
                }
            }
        })
	}
	
	
}
</script>
  </body>
</html>
