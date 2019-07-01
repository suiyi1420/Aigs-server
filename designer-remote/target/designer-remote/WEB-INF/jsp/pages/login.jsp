<%--
  Created by IntelliJ IDEA.
  User: zero
  Date: 2018/10/11
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/base.jsp" %>

<!DOCTYPE HTML >

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link href="${path}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style>
        html{width:100%;height:100%;}
        body{align-items: center;background:url("${path}/images/1.png") center -20px no-repeat ;background-size: cover;height:100%;}
        form{background-color:#fff;width:80vw;padding-top:15px;padding-bottom:15px;border-radius: 2vw;}
        .title{background:url("${path}/images/login_title.png") no-repeat ;background-size: cover;width:80vw;height:20vw;margin: 16vw auto 20px auto;}
        .ico{background:url("${path}/images/login_ico.png") no-repeat ;background-size: cover;width:80vw;height:37vw;margin: 5vw auto 0 auto;}
    </style>
</head>
<body>
<div class="title"></div>
<form class="container form-horizontal" role="form" >
    <div class="form-group">
        <label for="account" class="col-sm-2 control-label">邮箱：</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="account" name="account" placeholder="请输入邮箱" required="required">
        </div>
    </div>
    <div id="password_group" class="form-group">
        <label for="password" class="col-sm-2 control-label">密码：</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" >
        </div>
    </div>
    <div id="yzm_group" class="form-group" style="display: none;">
        <label for="yzm" class="col-sm-2 control-label">验证码：</label>
        <div class="col-sm-10">
            <div class="input-group">
                <input type="text" class="form-control" id="yzm" name="yzm" placeholder="请输入验证码" >
                <span class="input-group-btn">
                    <button id="sendidcode" class="btn btn-default" type="button" >获取验证码</button>
                </span>
            </div>
        </div>
    </div>
    <div class=" btn-group btn-group-justified" role="group" style="margin-bottom:15px;">
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-success" onclick="slelctLogin(1,this)">帐号密码</button>
        </div>

        <div class="btn-group" role="group">
            <button type="button" class="btn btn-default" onclick="slelctLogin(2,this)">邮箱验证码</button>
        </div>
    </div>

    <div class="btn-group btn-group-justified" role="group"style="margin-bottom:15px;">
        <div class="btn-group">
            <button type="button" class="btn btn-primary" onclick="login()">登录</button>
        </div>
    </div>
    <div class="btn-group btn-group-justified" role="group">
        <div class="btn-group">
            <a href="${path}/regist" class="btn btn-warning" >注册</a>
        </div>
    </div>
</form>
<div class="ico"></div>
<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${path}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        if ($.cookie("account") != ""||$.cookie("account") !=null) {
            $("#account").val($.cookie("account"));
            $("#password").val($.cookie("password"));
        }
    });

    function slelctLogin(type,_this){
        if(type==1){
            $("#password_group").show();
            $("#yzm_group").hide();
            $("#yzm_group input").val("");
        }else if(type==2){
            $("#password_group").hide();
            $("#password_group input").val("");
            $("#yzm_group").show();
        }
        $(_this).parents(".btn-group-justified").find("button").removeClass("btn-success").addClass("btn-default");
        $(_this).removeClass("btn-default").addClass("btn-success");
    }
    function login() {
        var data=$("form").serializeArray();
        $.ajax({
            url:"${path}/ajax_login",
            data:data,
            type:"post",
            success:function(response){
                if(response.status==1){
                    var account = $("#account").val();
                    var password = $("#password").val();
                    $.cookie("account", account, { expires: 30 });
                    $.cookie("password", password, { expires: 30 });
                    window.location.href="${path}/index";
                }else if(response.status==0){
                    alert(response.msg);
                }
            }
        })
    }
    $("#sendidcode").click(function(){
        if($("#account").val() == ""){
            $("#sendidcode").attr("disabled","disabled");
            $("#sendidcode").text("邮箱地址未填");
            setTimeout(function(){
                $("#sendidcode").removeAttr("disabled");
                $("#sendidcode").text("发送验证码");
            },900);
            return;
        }
        var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if(!myreg.test($("#account").val())){
            $("#sendidcode").attr("disabled","disabled");
            $("#sendidcode").val("邮箱格式错误");
            setTimeout(function(){
                $("#sendidcode").removeAttr("disabled");
                $("#sendidcode").val("发送验证码");
            },900);
            return;
        }
        $("#sendidcode").text("正在发送");
        $("#sendidcode").attr("disabled","disabled");
        $.ajax({
            url:"${path}/sendIdCode",
            type:"GET",
            //发送数据的第一种格式，字符串...
            data:{"mail":$("#account").val(),type:"login"},

            success:function(data){
                var time=30;
                function countDown(){

                    if(time==0){
                        $("#sendidcode").removeAttr("disabled");
                        $("#sendidcode").text("发送验证码");
                        clearInterval(timer);
                    }else{
                        $("#sendidcode").text("已发送("+time+"s)");
                    }
                    time--;
                }
                var timer=setInterval(countDown,1000);


            },
            error:function(){
                $("#sendidcode").text("验证码发送失败");
            }
        });
    });
</script>
</body>
</html>

