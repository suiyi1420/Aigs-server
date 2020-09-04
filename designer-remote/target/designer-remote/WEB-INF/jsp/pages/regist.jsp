<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/base.jsp" %>
<!DOCTYPE html>
<html dir="ltr">
  <head>
    
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/images/logo-icon.png" />
    <title>Fallwings-注册</title>
    <!-- Custom CSS -->
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
                <div>
                    <div class="logo">
                        <h3 class="box-title mb-3">注册</h3>
                    </div>
                    <!-- Form -->
                    <div class="row">
                        <div class="col-12">
                            <form class="form-horizontal mt-3 form-material" >
                                <div class="form-group mb-3">
                                    <div class="input-group col-xs-12">
                                        <input class="form-control" name="account" id="account" type="email" required="" placeholder="邮箱">
										<div class="input-group-append"><button class="btn btn-info" type="button" onclick="sendCode(this)">获取验证码</button></div>
                                    </div>
                                </div>
                                <div class="form-group mb-3 ">
                                    <div class="col-xs-12">
                                        <input class="form-control" type="password" id="password" name="password" required="" placeholder="密码">
                                    </div>
                                </div>
								<div class="form-group mb-3">
                                    <div class="col-xs-12">
                                        <input class="form-control" type="password" id="repassword" required="" placeholder="确认密码">
                                    </div>
                                </div>
                                <div class="form-group mb-3 ">
                                    <div class="col-xs-12">
                                        <input class="form-control" type="text" required="" name="user_name" placeholder="昵称">
                                    </div>
                                </div>
                                <div class="form-group mb-3 ">
                                    <div class="col-xs-12">
                                        <input class="form-control" type="text" required="" name="idcode" id="idcode" placeholder="验证码">
                                    </div>
                                </div>
                                
                                <div class="form-group text-center mb-3">
                                    <div class="col-xs-12">
                                        <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="button" onclick="regist()">注册</button>
                                    </div>
                                </div>
                                <div class="form-group mb-0 mt-2 ">
                                    <div class="col-sm-12 text-center ">
                                        已经拥有帐号? <a href="${path}/login " class="text-info ml-1 ">立即登录</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
      </div>

    </div>

    <script src="${path}/js/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${path}/js/popper.min.js"></script>
    <script src="${path}/js/bootstrap.min.js"></script>

    <script>
$('[data-toggle="tooltip"]').tooltip();$(".preloader").fadeOut();//

$('#to-recover').on("click",function(){$("#loginform").slideUp();$("#recoverform").fadeIn()});
$('.bak').on("click",function(){$("#recoverform").slideUp();$("#loginform").fadeIn()});


function sendCode(_this){
	var _this=$(_this);
            if($("#account").val() == ""){
                _this.attr("disabled","disabled");
                _this.text("邮箱地址未填");
                setTimeout(function(){
                    _this.removeAttr("disabled");
                    _this.text("发送验证码");
                },900);
                return;
            }
            var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if(!myreg.test($("#account").val())){
                _this.attr("disabled","disabled");
                _this.val("邮箱格式错误");
                setTimeout(function(){
                    _this.removeAttr("disabled");
                    _this.val("发送验证码");
                },900);
                return;
            }
            _this.text("正在发送");
            _this.attr("disabled","disabled");
            $.ajax({
                url:"${path}/sendIdCode",
                type:"GET",
                //发送数据的第一种格式，字符串...
                data:{"mail":$("#account").val(),type:"regist"},

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
		
function regist(){
	var pass1=$("#password").val();
	var pass2=$("#repassword").val();
	if(pass1!=pass2){
		alert("两次密码输入不匹配!");
	}else{
            var data=$("form").serializeArray();
            $.ajax({
                url:"${path}/ajax_regist",
                data:data,
                type:"post",
                success:function(response){
                    if (response.status==0){
                        alert(response.msg);
                    } else{
                        alert(response.msg);
                        window.location.href="${path}/login";
                    }
                }
            })
        }
	}
</script>
  </body>
</html>
