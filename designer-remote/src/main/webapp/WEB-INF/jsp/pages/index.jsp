<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/base.jsp" %>
<!DOCTYPE html>
<!-- saved from url=(0069)http://v.bootstrapmb.com/2020/6/akeq8103/src/minisidebar/index3.html# -->
<html dir="ltr" lang="en">
<head>
    <meta name="generator"
          content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/images/logo-icon.png"/>
    <title>Fallwings智能插排-设备列表</title>

    <!-- Custom CSS -->
    <link href="${path}/css/style.min.css" rel="stylesheet"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING:Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        body {
            min-height: 100vh
        }

        .jqstooltip {
            position: absolute;
            left: 0px;
            top: 0px;
            visibility: hidden;
            background: rgb(0, 0, 0) transparent;
            background-color: rgba(0, 0, 0, 0.6);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
            -ms-filter: & quot;
            progid: DXImageTransform . Microsoft . gradient(startColorstr = #99000000, endColorstr = #99000000) & quot;;
            color: white;
            font: 10px arial, san serif;
            text-align: left;
            white-space: nowrap;
            padding: 5px;
            border: 1px solid white;
            z-index: 10000;
        }

        .jqsfield {
            color: white;
            font: 10px arial, san serif;
            text-align: left;
        }
    </style>
</head>
<body>
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader" style="display: none;">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="mini-sidebar"
     data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full" class="show-sidebar">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <header class="topbar" data-navbarbg="skin6">
        <nav class="navbar top-navbar navbar-expand-md navbar-light">
            <div class="navbar-header" data-logobg="skin6">
                <a class="nav-toggler waves-effect waves-light d-block d-md-none" style="font-size:25px;"
                   href="${path}/logout">
                    <i class="mdi mdi-login"></i>
                </a>
                <a class="navbar-brand" href="javascript:;">
                    <!-- Logo icon -->
                    <b class="logo-icon">
                        <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                        <!-- Dark Logo icon -->
                        <img src="${path}/images/logo-icon.png" class="dark-logo">
                        <!-- Light Logo icon -->
                        <img src="${path}/images/logo-light-icon.png" class="light-logo">
                    </b>
                    <!--End Logo icon -->
                    <!-- Logo text -->
                    <span class="logo-text">
                            <!-- dark Logo text -->
                            <img src="${path}/images/logo-text.png" class="dark-logo">
                        <!-- Light Logo text -->
                            <img src="${path}/images/logo-light-text.png" class="light-logo">
                        </span>
                </a>
                <a style="font-size:16px;" class="topbartoggler d-block d-md-none waves-effect waves-light" href=""
                   aria-expanded="false"></a>

            </div>
            <!-- End Logo -->
            <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">


                <ul class="navbar-nav mr-auto float-left">
                    <!-- This is  -->
                    <li class="nav-item">
                        <a class="nav-link sidebartoggler d-none d-md-block waves-effect waves-dark"
                           style="font-size:16px;" href="${path}/logout">
                            <i class=" mdi mdi-logout"></i></a>
                    </li>
                </ul>

            </div>
        </nav>
    </header>
    <div class="page-wrapper" style="display: block;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body bg-info rounded-top">
                            <h4 class="text-white card-title">我的设备列表</h4>
                            <h6 class="card-subtitle text-white mb-0 op-5">点击设备进入设备控制界面</h6>
                        </div>
                        <div class="card-body p-2">
                            <div class="message-box contact-box position-relative mt-2">
                                <h2 class="add-ct-btn position-absolute">
                                    <button type="button"
                                            class="btn btn-circle btn-lg btn-success waves-effect waves-dark"
                                            data-toggle="modal" data-target="#add-modal">+
                                    </button>
                                </h2>

                                <div class="message-widget contact-widget position-relative scrollable ps-container ps-theme-default ps-active-y"
                                     style="min-height: 360px;" data-ps-id="aa4b9286-8781-ea10-0387-66f418b5151e">

                                    <div id="list">
                                        <!-- Message -->

                                    </div>
                                    <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: -19px;">
                                        <div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Row -->
            <!-- Row -->
        </div>
        <div id="add-modal" class="modal fade" tabindex="-1" role="dialog"
             style="display: none;" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center mt-2 mb-4">
                            <a href="index.html" class="text-success">
											<span>
												<img class="mr-2" src="${path}/images/logo-icon.png" alt="" height="18">
												<img src="${path}/images/logo-text.png" alt="" height="18">
											</span>
                            </a>
                        </div>
                        <form id="addForm" class="pl-3 pr-3">
                            <div class="form-group">
                                <label for="name">设备昵称</label>
                                <input class="form-control" type="text" id="name" name="name"
                                       required="" placeholder="请输入设备昵称">
                            </div>
                            <div class="form-group">
                                <label for="device_num">设备编码</label>
                                <input class="form-control" type="text" name="device_num"
                                       required="" id="device_num" placeholder="请输入设备编码">
                            </div>

                            <div class="form-group text-center">
                                <button class="btn btn-rounded btn-primary" type="button"
                                        onclick="addDevice()">添加
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="edit-modal" class="modal fade" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center mt-2 mb-4">
                            <a href="javascript:;" class="text-success">
											<span>
												<img class="mr-2" src="${path}/images/logo-icon.png" alt="" height="18">
												<img src="${path}/images/logo-text.png" alt="" height="18">
											</span>
                            </a>
                        </div>
                        <form id="editForm" class="pl-3 pr-3">
                            <input class="form-control" type="hidden" name="deviceid">
                            <div class="form-group">
                                <label for="name2">设备昵称</label>
                                <input class="form-control" type="text" id="name2" name="name" required=""
                                       placeholder="请输入设备昵称">
                            </div>
                            <div class="form-group">
                                <label for="device_num2">设备编码</label>
                                <input class="form-control" type="text" name="device_num" required="" id="device_num2"
                                       readonly>
                            </div>

                            <div class="form-group text-center">
                                <button class="btn btn-rounded btn-primary" type="button" onclick="editDevice(this)">
                                    修改
                                </button>
                            </div>
                        </form>
                    </div>
                </div><!-- /.modal-content --></div><!-- /.modal-dialog --></div>

        <div id="delete-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="fill-danger-modalLabel"
             style="display: none;" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content modal-filled bg-danger">
                    <div class="modal-header"><h4 class="modal-title  text-white" id="fill-danger-modalLabel">警告！ </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <p>该设备将会从列表中移除，是否继续该操作？</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-outline-light" onclick="delDevice(this)">继续删除</button>
                    </div>
                </div><!-- /.modal-content --></div><!-- /.modal-dialog --></div>

    </div>
</div>
<footer class="footer">Copyright © 2020 By Fallwings All Rights Reserved.
</footer>
<div class="chat-windows hide-chat"></div>
<script src="${path}/js/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="${path}/js/popper.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
<script>
    function addDevice() {
        var formData = $("#addForm").serializeArray();
        $.ajax({
            url: "${path}/device/ajax_add_user_device",
            data: formData,
            success: function (data) {
                alert(data.msg);
                $('#add-modal').modal('hide');
                window.location.reload();
            }
        });
    }

    function editToggle(_this) {
        var _this = $(_this).parent();

        var deviceid = _this.attr("deviceid");
        var name = _this.attr("device_name");
        var device_num = _this.attr("device_num");
        $('#edit-modal').find("input[name='name']").val(name);
        $('#edit-modal').find("input[name='deviceid']").val(deviceid);
        $('#edit-modal').find("input[name='device_num']").val(device_num);
        $('#edit-modal').modal('toggle');
    }

    function deleteToggle(_this) {
        var _this = $(_this).parent();

        var deviceid = _this.attr("deviceid");
        $('#delete-modal').find(".btn-outline-light").attr("deviceid", deviceid);
        $('#delete-modal').modal('toggle');
    }

    function delDevice(_this) {
        var _this = $(_this);
        $.ajax({
            url: "${path}/device/ajax_delete_user_device",
            data: {deviceid: _this.attr("deviceid")},
            success: function (data) {
                if (data.status == "1")
                    window.location.reload();
            }
        });
    }

    function editDevice(_this) {
        var _this = $(_this).parents("form");
        var deviceid = _this.find("input[name='deviceid']").val();
        var name = _this.find("input[name='name']").val();
        $.ajax({
            url: "${path}/device/ajax_edit_user_device",
            data: {deviceid: deviceid, name: name},
            success: function (data) {
                window.location.reload();
            }
        });
    }

    $(document).ready(function () {
        $.ajax({
            url: "${path}/device/find_user_device",
            data: {},
            success: function (data) {
                $("#list").empty()
                $.each(data, function (index) {
                    $("#list").append(
                        '<a href="${path}/device/listinfo?device_num=' + data[index].device_num + '" deviceid="' + data[index].deviceid + '" device_name="' + data[index].name + '" device_num="' + data[index].device_num + '"class="py-3 px-2 border-bottom d-block text-decoration-none">' +
                        ' <div class="user-img position-relative d-inline-block mr-2">' +
                        '<span class="round text-white d-inline-block text-center rounded-circle bg-info">' + parseInt(index + 1) + '</span></div>' +
                        '<div class="mail-contnet d-inline-block align-middle">' +
                        '<h5 class="my-1" >' + data[index].name + '</h5>' +
                        '<span class="mail-desc font-12 text-truncate overflow-hidden text-nowrap d-block">设备编码:' + data[index].device_num + '</span>' +
                        '</div>' +
                        '<div class="user-img position-relative d-inline-block mr-2 dd1" style="float:right;" onclick="deleteToggle(this)">' +
                        '<span class="d-inline-block text-center " style="width:30px;height:45px;line-height:45px;font-size: 30px;color: #fc4b6c;">' +
                        '<i class="mdi mdi-delete"></i>' +
                        '</span>' +
                        '</div>' +
                        '<div class="user-img position-relative d-inline-block mr-2 dd1" style="float:right;" onclick="editToggle(this)">' +
                        '<span class="d-inline-block text-center " style="width:30px;height:45px;line-height:45px;font-size: 30px;color: #009efb;">' +
                        '<i class="mdi mdi-pencil-box-outline"></i>' +
                        '</span>' +
                        '</div>' +
                        '</a>'
                    );
                });
                $(".dd1").click(function (e) {
                    e.preventDefault();
                });
            }
        });
    });
</script>

<div class="jvectormap-tip"></div>
</body>
</html>
