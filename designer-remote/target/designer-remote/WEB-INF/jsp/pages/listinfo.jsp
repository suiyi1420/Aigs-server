<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/base.jsp" %>
<!DOCTYPE html>
<!-- saved from url=(0069)http://v.bootstrapmb.com/2020/6/akeq8103/src/minisidebar/index3.html# -->
<html dir="ltr" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/images/logo-icon.png"/>
    <title>Fallwings智能插排-设备详情</title>

    <!-- Custom CSS -->
    <link href="${path}/css/style.min.css" rel="stylesheet"/>
    <link href="${path}/css/nouislider.min.css" rel="stylesheet"/>
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

        #qiwen_state.on, #qiwen_control.on {
            background: #fc4b6c !important;
        }

        #guangzhao_state.on, #guangzhao_control.on {
            background: #ffb22b !important
        }

        #shidu_state.on, #shidu_control.on {
            background: #1e88e5 !important
        }

        #shuiwen_state.on, #shuiwen_control.on {
            background: #7460ee !important
        }

        #weishi_control.on {
            background: #7460ee !important
        }

        .control, .state {
            background: #6c757d;
        }

    </style>
</head>
<body>

<div id="preloader" class="preloader" style="display: none;">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>
<div id="preloader2" class="preloader" style="display: none;">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>

<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="mini-sidebar"
     data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full" class="show-sidebar">
    <header class="topbar" data-navbarbg="skin6">
        <nav class="navbar top-navbar navbar-expand-md navbar-light">
            <div class="navbar-header" data-logobg="skin6">
                <a class="nav-toggler waves-effect waves-light d-block" style="font-size:25px;" href="${path}/index">
                    <i class="mdi mdi-keyboard-backspace"></i>
                </a>
                <a class="navbar-brand" href="javascript:;">
                    <b class="logo-icon">
                        <img src="${path}/images/logo-icon.png" class="dark-logo">
                        <img src="${path}/images/logo-light-icon.png" class="light-logo">
                    </b>
                    <span class="logo-text">
                            <img src="${path}/images/logo-text.png" class="dark-logo">
                            <img src="${path}/images/logo-light-text.png" class="light-logo">
                        </span>
                </a>
                <a class="topbartoggler d-block waves-effect waves-light" href="javascript:void(0)" data-toggle="modal"
                   data-target="#setting-modal"><i class="mdi mdi-dots-horizontal font-20"></i></a>

            </div>
            <!-- End Logo -->
            <div class="navbar-collapse collapse show" id="navbarSupportedContent" data-navbarbg="skin6">
                <ul class="navbar-nav mr-auto float-left">
                    <li class="nav-item dropdown mega-dropdown">
                        <a class="nav-link dropdown-toggle waves-effect waves-dark text-info" href="javascript:;"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="mdi mdi-wifi"></i>&nbsp;<span class="ip"></span></a></li>
                </ul>
                <ul class="navbar-nav float-right iid">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle waves-effect waves-dark text-info" href="javascript:;"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="mdi mdi-lan"></i>&nbsp;<span class="i-name"></span>
                        </a>

                    </li>
                </ul>
            </div>


        </nav>
    </header>
    <div class="page-wrapper" style="display: block;padding-top: 111px;">


        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <div class="card-group">
                        <!-- Column -->
                        <div class="card2 bg-danger" onclick="openMinMax('qiwen')">
                            <div class="card-body text-center text-white">
                                <span class="display-8"><i class="mdi mdi-settings"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white"></h6></div>
                            </div>
                        </div>
                        <div class="card state" id="qiwen_state" onclick="changeAuto(this,'qiwen')">
                            <div class="card-body text-center text-white">
                                <span class="display-7"><i class="mdi mdi-weather-windy"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white">气温 : <span
                                        id="qiwen_t"></span> °C</h6>
                                </div>
                            </div>
                        </div><!-- Column --><!-- Column -->
                        <div class="card control" id="qiwen_control">
                            <div class="card-body text-center text-white">
                                <span class="display-7"><i class="mdi mdi-power"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white">电源 : <span>已关闭</span></h6>
                                </div>
                            </div>
                        </div><!-- Column -->

                    </div>
                    <div class="card-group">
                        <!-- Column -->
                        <div class="card2 bg-warning" onclick="openMinMax('guangzhao')">
                            <div class="card-body text-center text-white">
                                <span class="display-8"><i class="mdi mdi-settings"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white"></h6></div>
                            </div>
                        </div>
                        <div class="card state" id="guangzhao_state" onclick="changeAuto(this,'guangzhao')">
                            <div class="card-body text-center text-white">
                                <span class="display-7"><i class="mdi mdi-lightbulb-on-outline"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white">光照 : <span
                                        id="guangzhao_t"></span> Lux</h6>
                                </div>
                            </div>
                        </div><!-- Column --><!-- Column -->
                        <div class="card control" id="guangzhao_control">
                            <div class="card-body text-center text-white">
                                <span class="display-7"><i class="mdi mdi-power"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white">电源 : <span>已关闭</span></h6>
                                </div>
                            </div>
                        </div><!-- Column -->

                    </div>
                    <div class="card-group">
                        <div class="card2 bg-info" onclick="openMinMax('shidu')">
                            <div class="card-body text-center text-white">
                                <span class="display-8"><i class="mdi mdi-settings"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white"></h6></div>
                            </div>
                        </div>
                        <!-- Column -->
                        <div class="card state" id="shidu_state" onclick="changeAuto(this,'shidu')">
                            <div class="card-body text-center text-white">
                                <span class="display-7"><i class="mdi mdi-chart-bubble"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white">湿度 : <span
                                        id="shidu_t"></span> %</h6>
                                </div>
                            </div>
                        </div><!-- Column --><!-- Column -->
                        <div class="card control" onclick="" id="shidu_control">
                            <div class="card-body text-center text-white">
                                <span class="display-7"><i class="mdi mdi-power"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white">电源 : <span>已关闭</span></h6>
                                </div>
                            </div>
                        </div><!-- Column -->

                    </div>
                    <div class="card-group">
                        <!-- Column -->
                        <div class="card2 bg-purple" onclick="openMinMax('shuiwen')">
                            <div class="card-body text-center text-white">
                                <span class="display-8"><i class="mdi mdi-settings"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white"></h6></div>
                            </div>
                        </div>
                        <div class="card state" id="shuiwen_state" onclick="changeAuto(this,'shuiwen')">
                            <div class="card-body text-center text-white">
                                <span class="display-7"><i class="mdi mdi-oil-temperature"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white">水温 : <span
                                        id="shuiwen_t"></span> °C</h6>
                                </div>
                            </div>
                        </div><!-- Column --><!-- Column -->
                        <div class="card control" id="shuiwen_control">
                            <div class="card-body text-center text-white">
                                <span class="display-7"><i class="mdi mdi-power"></i></span>
                                <div class="mt-3"><h6 class="font-weight-light text-white">电源 : <span>已关闭</span></h6>
                                </div>
                            </div>
                        </div><!-- Column -->

                    </div>
                    <div class="card-group">
                        <div class="card control" id="weishi_control" onclick="changeState(this,'weishi')">
                            <div class="card-body text-center text-white">
                                <span class="display-6"><i class="mdi mdi-power"></i></span>
                                <div class="mt-3"><h5 class="font-weight-light text-white">喂食 : <span>已打开</span></h5>
                                </div>
                            </div>
                        </div><!-- Column -->

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!----------------------------------------------------------------------->
<footer class="footer">Copyright © 2020 By Fallwings All Rights Reserved.</footer>
<!------------------------------------------------------------------->

<div id="setting-modal" class="modal fade" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-sm modal-right" style="width: 100%;">
        <div class="modal-content" style="height: 100%;">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                <div class="customizer-body ps-container ps-theme-default"
                     data-ps-id="9c967872-c6bb-9698-a6ba-29534ac1cf91">
                    <ul class="nav customizer-tab" role="tablist">
                        <li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill"
                                                href="#pills-home" role="tab" aria-controls="pills-home"
                                                aria-selected="true"><i
                                class="mdi mdi-wifi font-20"></i></a></li>
                        <li class="nav-item"><a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#chat"
                                                role="tab" aria-controls="chat" aria-selected="false"><i
                                class="mdi mdi-cloud-upload font-20"></i></a></li>
                        <li class="nav-item"><a class="nav-link" id="pills-contact-tab" data-toggle="pill"
                                                href="#pills-contact"
                                                role="tab" aria-controls="pills-contact" aria-selected="false"><i
                                class="mdi mdi-star-circle font-20"></i></a></li>
                    </ul>
                    <div class="tab-content" id="pills-tabContent">
                        <!-- Tab 1 -->
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                             aria-labelledby="pills-home-tab">
                            <form id="wifiForm" class="pl-3 pr-3">
                                <div class="form-group">
                                    <label for="ssid">SSID</label>
                                    <input class="form-control" type="text" id="ssid" name="ssid" required=""
                                           placeholder="SSID">
                                </div>
                                <div class="form-group">
                                    <label for="password">WIFI密码</label>
                                    <input class="form-control" type="text" name="password" required="" id="password"
                                           placeholder="wifi密码">
                                </div>

                                <div class="form-group text-center">
                                    <button class="btn btn-rounded btn-primary" type="button" onclick="setWifi()">连接
                                    </button>
                                </div>
                            </form>

                        </div>
                        <!-- End Tab 1 -->
                        <!-- Tab 2 -->
                        <div class="tab-pane fade" id="chat" role="tabpanel" aria-labelledby="pills-profile-tab">
                            <div class="col-sm-12 col-md-6">
                                <div class="card">
                                    <div class="card-body"><h4 class="card-title">版本列表</h4>
                                        <h6 class="card-subtitle">当前版本： <code id="version_total"></code></h6>
                                        <form class="mt-4">
                                            <div class="input-group">
                                                <select class="custom-select" id="versionSelect">
                                                    <c:forEach items="${version}" var="ver">
                                                        <option value="${ver.url}">${ver.version}</option>
                                                    </c:forEach>
                                                </select>
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-secondary" type="button" id="version_button">下载</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <div class="card-body"><h4 class="card-title">版本详情</h4>
                                        <c:forEach items="${version}" var="ver">
                                            <div class="form-group version_tip" style="display: none;">
                                                <small class="form-text text-muted">发布时间：${ver.time}</small>
                                                <textarea class="form-control" rows="3" readonly>${ver.tip}</textarea>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab 2 -->
                        <!-- Tab 3 -->
                        <div class="tab-pane fade p-3" id="pills-contact" role="tabpanel"
                             aria-labelledby="pills-contact-tab">

                        </div>
                        <!-- End Tab 3 -->
                    </div>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div id="minmax-modal" class="modal fade" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
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
                        <label class="text-danger" for="slider" style="font-size:16px;">设置监控范围</label>
                        <div id="slider" style="margin-top:40px;"></div>
                    </div>
                    <div class="form-group text-center" style="margin-top:80px;">
                        <button class="btn btn-rounded btn-primary" type="button" onclick="setMinMax()">设置</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="chat-windows hide-chat"></div>
<script src="${path}/js/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="${path}/js/popper.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
<script src="${path}/js/perfect-scrollbar.jquery.min.js"></script>
<script src="${path}/js/sparkline.js"></script>
<script src="${path}/js/custom.min.js"></script>
<script src="${path}/js/nouislider.min.js"></script>

<div class="jvectormap-tip"></div>
<script>
    var slider = document.getElementById('slider');
    var ws = null;
    var ip = "${ip}", path = "${path}", userId = "${userId}", device_num = "${device_num}", deviceid = "${deviceid}";
    noUiSlider.create(slider, {
        start: [0, 100],
        connect: true,
        range: {
            'min': [0],
            'max': [100]
        },
        tooltips: true,
        pips: {
            mode: 'range',
            stepped: true,
            density: 3
        }
    });

    function WebsocketInit() {
        if ("WebSocket" in window) {
            ws = new WebSocket("ws://" + ip + ":80" + path + "/websocket/socketServer?isuser=1&deviceid=" + deviceid);
            //ws = new WebSocket("ws://www.fallwings.top/aigs/websocket/socketServer?isuser=1&deviceid=10");
            ws.onopen = function () {
                // Web Socket 已连接上，使用 send() 方法发送数据

            };
            ws.onconnect = function () {

            };

            ws.onmessage = function (evt) {

                var data = evt.data;
                data = eval("(" + data + ")");
                console.log(data)
                //data = JSON.parse(data);
                var type = data["type"];
                if (type == "getData") {
                    getData(data);
                } else if (type == "getMinMax") {
                    getMinMax(data);

                }

            };

            ws.onclose = function () {
                // 关闭 websocket
                //alert("连接已关闭...");
                WebsocketInit();
            };
            ws.onerror=function(){
                alert("建立连接错误!");
                window.location.href="${path}/index";
            }
        } else {
            // 浏览器不支持 WebSocket
            alert("您的浏览器不支持 WebSocket!");
        }
    }

    function getState(id, control_value, control_id, auto_value) {
        if (auto_value == "0") {
            $(id).removeClass("on");
            $(id).attr("data", "0");
            $("#" + control_id + "_control").attr("onclick", "changeState(this,'" + control_id + "')");
        } else if (auto_value == "1") {
            $(id).addClass("on");
            $(id).attr("data", "1");
            $("#" + control_id + "_control").attr("onclick", "");
        }
        if (control_value == "1") {
            $("#" + control_id + "_control").addClass("on");
            $("#" + control_id + "_control").attr("data", "1");
            $("#" + control_id + "_control h6 span").text("已打开");
            $("#" + control_id + "_control h5 span").text("已打开");
        } else {
            $("#" + control_id + "_control").removeClass("on");
            $("#" + control_id + "_control").attr("data", "0");
            $("#" + control_id + "_control h6 span").text("已关闭");
            $("#" + control_id + "_control h5 span").text("已关闭");
        }
    }

    function changeState(_this, id) {
        var control_state = $(_this).attr("data");
        var changeData = control_state == "0" ? "1" : "0";
        if (changeData == "1") {
            $(_this).addClass("on");
            $(_this).attr("data", "1");
        } else {
            $(_this).removeClass("on");
            $(_this).attr("data", "0");
        }
        var msg = {s_type: "changeState", type: id, state: changeData};
        var json = JSON.stringify(msg);
        ws.send(json);
    }

    function getData(json) {
        $(".ip").text(json.ip);
        $(".i-name").text(json.mac);
        $("#qiwen_t").text(json.qiwen);
        $("#guangzhao_t").text(json.guangzhao);
        $("#shidu_t").text(json.shidu);
        $("#shuiwen_t").text(json.shiuwen);
        getState("#qiwen_state", json.qiwenState, "qiwen", json.qiwenAuto);
        getState("#shidu_state", json.shiduState, "shidu", json.shiduAuto);
        getState("#guangzhao_state", json.guangzhaoState, "guangzhao", json.guangzhaoAuto);
        getState("#shuiwen_state", json.shuiwenState, "shuiwen", json.shuiwenAuto);
        getState("#weishi_state", json.weishiState, "weishi", json.weishiAuto);
        $("#version_total").text(json.version);
        $("#versionSelect option").each(function(){
            if($(this).text()==json.version) {
                $(this).attr("disable");
            }
        });
        $("#preloader").hide();

    }


    function setMinMax() {
        var type = $("#minmax-modal").attr("data");
        var min = slider.noUiSlider.get()[0];
        var max = slider.noUiSlider.get()[1];
        var msg = {s_type: "setMinMax", type: type, min: min, max: max};
        var json = JSON.stringify(msg);
        ws.send(json);
        $('#minmax-modal').modal('toggle');
    };

    function changeAuto(_this, type) {
        var value;
        if ($(_this).attr("data") == '0') {
            value = "1";
            $(_this).addClass("on");
        } else {
            value = "0";
            $(_this).removeClass("on");
        }
        var msg = {s_type: "setAuto", type: type, auto_value: value};
        var json = JSON.stringify(msg);
        ws.send(json);

    };

    function getMinMax(json) {
        var datatype = json["datatype"];
        slider.noUiSlider.set([parseFloat(json.min), parseFloat(json.max)]);
        if (datatype == "shidu") {
            slider.noUiSlider.updateOptions({range: {"min": 0, "max": 100}})
        } else if (datatype == "guangzhao") {
            slider.noUiSlider.updateOptions({range: {"min": 0, "max": 1000}})
        } else {
            slider.noUiSlider.updateOptions({range: {"min": 10, "max": 40}})
        }

        $('#minmax-modal').attr("data", datatype);
        $('#minmax-modal').modal('toggle');
        $("#preloader2").hide();
    }

    function openMinMax(type) {
        $("#preloader2").show();
        var msg = {s_type: "getMinMax", type: type};
        var json = JSON.stringify(msg);
        ws.send(json);
    }

    function setWifi() {
        var ssid = $("#wifiForm input[name='ssid']").val();
        var password = $("#wifiForm input[name='password']").val();
        var msg = {s_type: "setWifi", ssid: ssid, password: password};
        var json = JSON.stringify(msg);
        ws.send(json);
        $("#wifiForm")[0].reset();
    }

    $(document).ready(function () {
        $("#preloader").show();
        WebsocketInit();
        $(".version_tip").eq(0).show();
        $("#versionSelect").change(function(){
            var ind=$(this).prop('selectedIndex');
            $(".version_tip").siblings("div").hide();
            $(".version_tip").eq(ind).show();
        });
        $("#version_button").click(function(){
            var ind=$("#versionSelect").prop('selectedIndex');
            window.open($("#versionSelect").val());
        });
    });

</script>
</body>
</html>
