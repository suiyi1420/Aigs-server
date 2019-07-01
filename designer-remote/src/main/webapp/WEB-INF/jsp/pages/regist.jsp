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

<html >
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link href="${path}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
    html{width:100%;height:100%;}
    body{display: flex;align-items: center;background:url("${path}/images/1.png") center top no-repeat;background-size: cover;height:100%;flex-direction: column;}
    form{background-color:#fff;width:80vw;padding-top:15px;padding-bottom:15px;}
    .title{background:url("${path}/images/login_title.png") no-repeat ;background-size: cover;width:80vw;height:20vw;margin-top:20vw;margin-bottom: 5vw;}
    .ico{background:url("${path}/images/login_ico.png") no-repeat ;background-size: cover;width:80vw;height:37vw;margin-top:5vw;}
</style>
</head>
<body>


<div class="title"></div>
<form class="container form-horizontal" role="form" >
    <div class="form-group">
        <label for="account" class="col-sm-2 control-label">邮箱：</label>
        <div class="col-sm-10">
            <div class="input-group">
                <input type="email" class="form-control" id="account" name="account" placeholder="请输入邮箱" required="required">
                <span class="input-group-btn">
                        <button id="sendidcode" class="btn btn-default" type="button" >获取验证码</button>
                </span>
            </div>
        </div>
    </div>
    <div id="password_group" class="form-group">
        <label for="password" class="col-sm-2 control-label">密码：</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" >
        </div>
    </div>
    <div class="form-group">
        <label for="user_name" class="col-sm-2 control-label">昵称：</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="user_name" name="user_name" placeholder="请输入昵称" >
        </div>
    </div>
    <div class="form-group" >
        <label for="idcode" class="col-sm-2 control-label">验证码：</label>
        <div class="col-sm-10">
                <input type="text" class="form-control" id="idcode" name="idcode" placeholder="请输入验证码" >

        </div>
    </div>
    <div class=" btn-group btn-group-justified" role="group" style="margin-bottom:15px;">
        <div class="btn-group" role="group">
            <button id="regist_btn" type="button" class="btn btn-success" >立即注册</button>
        </div>

        <div class="btn-group" role="group">
            <a href="/aigs/login" class="btn btn-danger" >返回登录</a>
        </div>
    </div>

    </form>
<div class="ico"></div>

<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${path}/js/uikit.min.js"></script>
<script type="text/javascript">
    $(function(){

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
                data:{"mail":$("#account").val(),type:"regist"},

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

        $("#regist_btn").click(function(){
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
        });
    });
</script>
</body>
</html>

