<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/base.jsp" %>
<!DOCTYPE html >
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link href="${path}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style>
        body {
            padding: 2vw;
        }
        .logout {
            height: 14vw;
            width: 100%;
            display: flex;
            flex-direction: row;
        }
        .logout p {
            height: 100%;
            align-items: center;
            font-weight: bold;
            display: flex;
            flex: 1;
        }
        .logout .buttn {
            height: 100%;
            align-items: center;
            font-weight: bold;
            font-size: 4vw;
            display: flex;
            justify-content: center;
        }
        .line {
            height: 14vw;
            width: 100%;
            background-color: #ededed;
            display: flex;
            flex-direction: row;
        }

        .line-text {
            height: 100%;
            font-size: 6vw;
            color: green;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin-left: 2vw;
            flex: 1;
        }

        .add {
            height: 100%;
            font-size: 6vw;
            align-items: center;
            color: green;
            font-weight: bold;
            display: flex;
            justify-content: flex-end;
            margin-right: 2vw;
            flex: 1;
        }

        .list-item-box {
            display: flex;
            flex-direction: row;
            overflow: hidden;
            height: 14vw;
            border-bottom: 1px solid #ededed;
            width: 100%;
            font-size: 4vw;
        }

        .item-left {
            width: 70%;
            height: 100%;
            line-height: 14vw;
            display: flex;
            align-items: center;
            flex-direction: row;
        }

        .item-left .num {
            height: 8vw;
            width: 8vw;
            background-color: green;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }

        .item-left .name {
            height: 100%;
            width: calc(100% - 8vw);
            line-height: 14vw;
            text-indent: 2vw;
        }

        .list-item-right {
            width: 30%;
            display: flex;
            height: 100%;
            flex-direction: row;
        }

        .editor, .del {
            display: flex;
            flex: 1;
            color: #fff;
            justify-content: center;
            align-items: center;
        }

        .editor {
            background-color: skyblue;
        }

        .del {
            background-color: #cc0000;
        }
    </style>
</head>

<body>
<div class="logout">
    <p>欢迎使用爱龟助手</p>
    <div class="buttn"><button type="button" class="btn btn-danger" onclick="window=location.href='${path}/logout'">退出登录</button></div>
</div>
<div class="line">
    <div class="line-text">设备列表</div>
    <div class="add"><span class="glyphicon glyphicon-plus" aria-hidden="true" onclick="openModal('${path}/device/add_user_device')"></span></div>
</div>
<div class="list-item">

</div>


<%@ include file="/WEB-INF/jsp/modal.jsp" %>
<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/js/common.js"></script>
<script>
    $(document).ready(function(){
        getList();
    });
    function getList(){
        $.ajax({
            url:"${path}/device/find_user_device",
            data:{},
            success:function(data){
                $(".list-item").empty()
                $.each(data,function (index) {
                    $(".list-item").append('<div class="list-item-box">' +
                        '        <div class="item-left" onclick="window.location.href=\'${path}/device/listinfo?device_num='+data[index].device_num+'\'">' +
                        '            <div class="num">'+parseInt(index+1)+'</div>' +
                        '            <div class="name">'+data[index].name+'</div>' +
                        '        </div>' +
                        '        <div class="list-item-right">' +
                        '            <div class="editor" onclick="openModal(\'${path}/device/edit_user_device?deviceid='+data[index].deviceid+'\')">编辑</div>' +
                        '            <div class="del" onclick="openModal(\'${path}/device/delete_user_device?deviceid='+data[index].deviceid+'\')">删除</div>' +
                        '        </div>' +
                        '    </div>');
                })
            }
        })
    }
</script>
</body>
</html>
