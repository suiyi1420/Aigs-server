<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/base.jsp" %>
<!DOCTYPE html >
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link href="${path}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css">
    <style>
        body {
            background-color: #f0f0f0;flex: 1;position: relative;
        }

        .isAuto{
            background: url("${path}/images/isAuto.png") left top no-repeat ;
            background-size:contain ;
            -moz-box-shadow: 0px 0px 15px #000000; /* 老的 Firefox */
            box-shadow: 0px 0px 15px #000000;
        }
        .back {
            padding: 2vw;
            font-size: 8vw;
            color: #616161;
            background-color: #fff;
        }

        .switc {
            padding: 2vw;
            height: 15vw;
            display: flex;
            flex-direction: row;
            margin-top: 3vw;
            background-color: #fff;
        }

        .switc-text {
            display: flex;
            font-size: 5vw;
            align-items: center;
            flex: 1;
            padding: 2vw;
        }

        .switc-box {
            justify-content: flex-end;
        }

        #webcam{padding:0vw;height:75vw;}
        /*#webcam img{height:75vw !important;width:100vw !important;}*/
        .data-state {
            margin-top: 3vw;
            display: flex;
            flex-wrap: wrap;
            padding: 0vw 2.2vw;
            position: relative;
            margin-top: 3vw;
        }
        .title{height:10vw;background-color:#fff;align-items: center;font-size: 4vw;color:#000;display: flex;padding: 0 3vw;margin-top: 3vw;}

        .data-state-item {
            display: flex;
            min-height: 28.3vw;
            flex-direction: column;
            align-items: center;
            width: 28vw;
            margin: 0 1.5vw 3vw 1.5vw;
            background-color: #ffffff;
            padding: 3vw 0;
            position: relative;
        }

        .data-state-item1 {
            height: 26vw;
        }

        .data-state-item-text {
            font-size: 4vw;
            position: absolute;
            bottom: 3vw;
            font-weight: bold;
        }

        .data-state-item-value {
            font-size: 3vw;
            position: absolute;
            bottom: 9vw;
            font-weight: bold;
        }

        .data-state-item-pic {
            margin-bottom: 8vw;
            margin-left: -10vw;
        }

        .data-state-item-right {
            position: absolute;
            right: 2vw;
            top: 3vw;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .data-state-item-right-pic {
        }

        .data-state-item-right-text {
            font-size: 5vw;
            font-weight: bold;
        }

        .data-state-item-right-text2 {
            font-size: 3vw;
            font-weight: bold;
        }

        .data-state-item-right-text3 {
            font-size: 4vw;
            font-weight: bold;
        }

        .cold {
            color: deepskyblue;
        }


        .red {
            color: #cc0000;
        }

        .green2 {
            color: rgb(0, 133, 0);
        }

        .yellow {
            color: gold
        }

        .water {
            color: dodgerblue
        }

        .orange {
            color: #e84002
        }

        .olive {
            color: #808000
        }
        .gray{color:#a8a9ad;}
        .bg-connect{width:100vw;height:calc(100% - 15vw);z-index:1000;background-color:rgba(0,0,0,0.7);position:absolute;left:0;top:15vw;display: flex;justify-content: center;}
        .bg-connect div{background:#fff;width:30vw;height:30vw;display: flex;justify-content: center;align-items: center;position: fixed;top:60vw;}
        #cameraImg{width:100vw;height:75vw;display:none;}
        .switc-reset{background-color: #cc0000;color: #fff;padding: 0vw;
            align-content: center;justify-content: center;height: 34px;display: flex;font-size: 3vw;align-items: center;flex: 1;margin-right: 5px;    border-radius: 1vw;}
        .switc-reset.disable{background-color:#ccc !important;}
        .reshui{background-image:url("${path}/images/reshui.png");background-repeat: no-repeat;background-position:center;width:10vw;height:10vw;background-size: contain;}
        .reshui.active{background-image:url("${path}/images/reshui_o.png") !important;}
        .jiawen{background-image:url("${path}/images/jiawen.png");background-repeat: no-repeat;background-position:center;width:10vw;height:10vw;background-size: contain;}
        .jiawen.active{background-image:url("${path}/images/jiawen_o.png") !important;}
        .right{float:right;}
        .left{float:left;}
        .food_time_list_item_left{width:80%;height:100%;}
        .food_time_list_item_delete{width:20%;height:100%;display: flex;justify-content: center;align-items: center;}
        .food_time_list_item_left_week{width:80%;height:100%;display: flex;align-items: center;}
        .food_time_list_item_left_time{width:20%;height:100%;display: flex;align-items: center;}
        .food_time_list_item{overflow:hidden;margin:0 0 2vw 0;height:13vw;border-bottom: 1px dashed #000;}
        .food_list_bg{background:rgba(0,0,0,0.7);position: absolute;width:100%;height:100%;top:15vw;left:0;display: flex;justify-content: center;align-items: center;}
        .food_time_list{max-height:75vw;overflow: auto;}
    </style>
</head>

<body >
<div class="back"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true" onclick="back()"></span></div>
<div class="bg-connect">
    <div><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i></div>
</div>
<div class="title" style="justify-content:space-between;" onclick="$('#WIFI').modal('toggle')"><span>设置设备Wifi</span><span class="glyphicon glyphicon-chevron-right" aria-hidden="true" ></span></div>
<div class="switc">
    <div class="switc-text">
        <span>自动控制</span>
    </div>
    <div class="switc-box">
        <input type="checkbox" name="my-checkbox" checked data-size="normal" data-on-color="success">
    </div>
</div>
<div class="title"><span>监测状况</span></div>
<div class="data-state">

    <!------------------ 气温监测器------------------------ -->
    <div class="data-state-item data-state-item1 red" id="temp" data-device="temp" data-devicename="气温监测器" data-auto="temp_auto" data-isAuto="">
        <div class="data-state-item-pic fa  fa-2x"></div>
        <span id="temp_text" class="data-state-item-value ">10℃ ~ 20℃</span>
        <span class="data-state-item-text ">气温监测器</span>
        <div class="data-state-item-right">
            <div class="fa  fa-lg data-state-item-right-pic"></div>
            <div class="data-state-item-right-div">
                <span class="data-state-item-right-text ">10</span>
                <span class="data-state-item-right-text2 ">℃</span>
            </div>
        </div>
    </div>
    <!------------------ 光照监测器 ------------------------ -->
    <div class="data-state-item data-state-item1 yellow" id="lamp" data-device="lamp" data-devicename="光照监测器" data-auto="lamp_auto" data-isAuto="">
        <div class="data-state-item-pic fa fa-2x "></div>
        <span id="lamp_text" class="data-state-item-value ">20Lx ~ 100Lx</span>
        <span class="data-state-item-text ">光照监测器</span>
        <div class="data-state-item-right">
            <span class="data-state-item-right-text3 ">白天</span>
            <div class="data-state-item-right-div">
                <span class="data-state-item-right-text ">100</span>
                <span class="data-state-item-right-text2 ">Lx</span>
            </div>
        </div>
    </div>
    <!------------------ 湿度监测器 ------------------------ -->
    <div class="data-state-item data-state-item1 water" id="humidity" data-device="humidity" data-devicename="湿度监测器" data-auto="humidity_auto" data-isAuto="">
        <div class="data-state-item-pic fa fa-tint fa-2x "></div>
        <span id="humidity_text" class="data-state-item-value ">11% ~ 22%</span>
        <span class="data-state-item-text ">湿度监测器</span>
        <div class="data-state-item-right">
            <span class="data-state-item-right-text3 ">舒适</span>
            <div class="data-state-item-right-div">
                <span class="data-state-item-right-text ">11</span>
                <span class="data-state-item-right-text2 ">%</span>
            </div>
        </div>
    </div>
    <!------------------ 水温监测器 ------------------------ -->
    <div class="data-state-item data-state-item1 orange" id="watertemp" data-device="watertemp" data-devicename="水温监测器" data-auto="watertemp_auto" data-isAuto="">
        <div class="data-state-item-pic fa  fa-2x"></div>
        <span id="watertemp_text" class="data-state-item-value ">10℃ ~ 20℃</span>
        <span class="data-state-item-text ">水温监测器</span>
        <div class="data-state-item-right">
            <div class="fa  fa-lg data-state-item-right-pic"></div>
            <div class="data-state-item-right-div">
                <span class="data-state-item-right-text ">10</span>
                <span class="data-state-item-right-text2 ">℃</span>
            </div>
        </div>
    </div>

    <!------------------ 喂食监测器 ------------------------ -->
    <div class="data-state-item data-state-item1 olive" id="food" data-device="food" data-devicename="喂食监测器" data-auto="food_auto" data-isAuto="">
        <div class="data-state-item-pic fa  fa-2x fa-inbox "></div>
        <span id="food_nextTime_text" class="data-state-item-value " onclick="FoodTimeList()">周一 18:00</span>
        <span class="data-state-item-text ">喂食监测器</span>
        <div class="data-state-item-right">
            <span id="food_speed_text" class="data-state-item-right-text3 " data-speed="0" onclick="foodSpeedModal()">慢</span>
            <div class="data-state-item-right-div" onclick="foodSpeedModal()">
                <span class="data-state-item-right-text " id="food_chixu_text">11</span>
                <span class="data-state-item-right-text2 ">s</span>
            </div>

        </div>
    </div>
</div>

<div class="title"><span>外设开关及状态</span></div>

<div class="data-state">
    <!------------------ 空气加热器 ------------------------ -->
    <div class="data-state-item red" id="temp_controller" data-type='temp_pin' data-statusType='temp_status' data-status="0">
        <div class="data-state-item-pic jiawen "></div>
        <span class="data-state-item-text ">空气加热</span>
        <div class="data-state-item-right">
            <span class="data-state-item-right-text3 ">已关闭</span>

        </div>
    </div>

    <!------------------ 灯光控制器 ------------------------ -->
    <div class="data-state-item yellow" id='lamp_controller' data-type='lamp_pin' data-statusType='lamp_status' data-status="0">
        <div class="data-state-item-pic fa fa-lightbulb-o fa-3x "></div>
        <span class="data-state-item-text ">灯光控制器</span>
        <div class="data-state-item-right">
            <span class="data-state-item-right-text3 ">已关闭</span>

        </div>
    </div>

    <!------------------ 喷雾控制器 ------------------------ -->
    <div class="data-state-item water" id='humidity_controller' data-type='penshui_pin' data-statusType='penshui_status' data-status="0">
        <div class="data-state-item-pic fa fa-shower fa-2x "></div>
        <span class="data-state-item-text ">喷雾控制器</span>
        <div class="data-state-item-right">
            <span class="data-state-item-right-text3 ">已关闭</span>

        </div>
    </div>

    <!------------------ 水体加热器 ------------------------ -->
    <div class="data-state-item orange" id="watertemp_controller" data-type='watertemp_pin' data-statusType='watertemp_status' data-status="0">
        <div class="data-state-item-pic reshui"></div>
        <span class="data-state-item-text ">水体加热</span>
        <div class="data-state-item-right">
            <span class="data-state-item-right-text3 ">已关闭</span>

        </div>
    </div>


    <!------------------ 喂食控制器 ------------------------ -->
    <div class="data-state-item gray" id='food_controller' data-type='food_pin' data-statusType='food_status' data-status="0">
         <div class="data-state-item-pic fa fa-inbox fa-2x "></div>
         <span class="data-state-item-text ">喂食控制器</span>
         <div class="data-state-item-right">
             <span class="data-state-item-right-text3 ">已关闭</span>
         </div>
     </div>


</div>

<div class="switc">
    <div class="switc-text">
        <span>视频监控</span>
    </div>
    <div class="switc-reset" onclick="resetCamera()">重启摄像头</div>
    <div class="switc-box">
        <input type="checkbox" name="shipin-checkbox" checked data-size="normal" data-on-color="success">
    </div>

</div>
<div class="switc" id="wangluo" style="display: none">
    <div class="switc-text">
        <span>网络类型</span>
    </div>
    <!--<div class="switc-box">
        <input type="checkbox" name="wangluo-checkbox" checked data-size="normal" data-on-color="success">
    </div>-->
</div>
<!--<div class="switc" id="wangluo_input" style="display: none">
    <div class="input-group">
        <input type="text" class="form-control" placeholder="请输入设备的局域网ip">
        <div class="input-group-btn">
            <button type="button" class="btn btn-primary" onclick="tijiaoUrl()">打开</button>
        </div>

    </div>

</div>-->
<div id="webcam">
    <img id="cameraImg" src=""/>
</div>


<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">
                <form class="form-inline">
                    <div class="form-group">
                        <label for="min">Min:</label>
                        <input type="text" class="form-control" id="min" onkeyup= "this.value=this.value.replace(/[^\d]/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="max">Max:</label>
                        <input type="text" class="form-control" id="max" onkeyup= "this.value=this.value.replace(/[^\d]/g,'')">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-info" onclick="changeMinMax()">确认</button>
            </div>



        </div>
    </div>
</div>
<div class="modal fade" id="WIFI" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="WIFIModalLabel">设备Wifi设置</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline">
                    <div class="form-group">
                        <label for="min">SSID:</label>
                        <input type="text" class="form-control" id="ssid" >
                    </div>
                    <div class="form-group">
                        <label for="max">密码:</label>
                        <input type="text" class="form-control" id="password" >
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-info" onclick="setWifi()">确认</button>
            </div>



        </div>
    </div>
</div>

<div class="modal fade" id="food_time_set" tabindex="1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 1051;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="food_time_setLabel">添加喂食时间</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline" id="food_time_set_form">
                    <label class="checkbox-inline">
                        <input type="checkbox" nane="food_week" value="0"> 日
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="food_week" value="1"> 一
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="food_week" value="2"> 二
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="food_week" value="3"> 三
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="food_week" value="4"> 四
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="food_week" value="5"> 五
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="food_week" value="6"> 六
                    </label>
                    <div class="form-group">
                        <label for="max">时间:</label>
                        <input type="time" class="form-control" name="food_time" >
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-info" onclick="addFootTime()">确认</button>
            </div>



        </div>
    </div>
</div>

<div class="modal fade" id="food_time_list" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="food_time_listLabel">自动喂食时间列表</h4>
            </div>
            <div class="modal-body" style="position: relative;">
                <p style="height:15vw;border-bottom: 1px dashed #000;margin-bottom:0;"><button type="button" class="btn btn-primary" onclick="$('#food_time_set').modal('toggle')">新增时间</button></p>
                <div class="food_list_bg">
                    <div class="fa fa-spinner fa-spin fa-4x " style="color:#fff;"></div>
                </div>
                <div class="food_time_list">

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>



        </div>
    </div>
</div>
<div class="modal fade" id="food_speed_set" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="">喂食速度及持续时间</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline" >
                    <span>喂食速度：</span>
                    <label class="radio-inline">
                        <input type="radio" name="food_speed"  value="0"> 慢
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="food_speed"  value="1"> 快
                    </label>
                    <div class="form-group" style="margin-top:10px;">
                        <label for="food_chixu_time">喂食持续时间:</label>
                        <input type="number" class="form-control" id="food_chixu_time" >
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="setFoodSpeed()">确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>



        </div>
    </div>
</div>
<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="${path}/js/socket.io.js"></script>
<script type="text/javascript" src="${path}/js/jquery.serializejson.min.js"></script>
<script>
    var imageNr = 0; // Serial number of current image
    var finished = new Array(); // References to img objects which have finished downloading
    var paused = true;
    var shipinUrl="";
    var device_status = {};
    var ws = null;
    var auto;
    var ip;
    var device_data = {
        temp: 0,
        sunLight: 0,
        humidity: 0,
        watertemp: 0,
        lamp: false,
        food: false,
        food_speed: 0,
        turangshidu: true,
        min_temp: 0,
        max_temp: 0,
        min_humidity: 0,
        max_humidity: 0,
        min_lamp: 0,
        max_lamp: 0,
        device_status: {
            penshui_status: 0, lamp_status: 0, food_status: 0
        }
    }
    var socket;
    $(document).ready(function () {
        $("[name='my-checkbox']").bootstrapSwitch();
        $("[name='shipin-checkbox']").bootstrapSwitch('state', false);
        //$("[name='wangluo-checkbox']").bootstrapSwitch({'state': true,'onText':'外网','offText':'内网','offColor':'danger'});


        $('input[name="my-checkbox"]').on('switchChange.bootstrapSwitch', function (event, state) {
            console.log(state); // true | false
            var value = state;
            console.log(value);
            var msg;
            if (value) {
                msg = {msg: 'change', key: 'autoClock', value: '1'};
            } else {
                msg = {msg: 'change', key: 'autoClock', value: '0'};
                $("#watertemp,#temp,#lamp,#humidity").removeClass("isAuto");
            }
            var json = JSON.stringify(msg);
            console.log(json);
            if (ws != null) {
                ws.send(json);
            }
        });
        $('input[name="shipin-checkbox"]').on('switchChange.bootstrapSwitch', function (event, state) {
            if(state){//打开
                $("#cameraImg").attr("src","");
                camera();

            }else{//关闭
                socket.emit("response", "closed");
                socket.disconnect(true);

                $("#cameraImg").hide();

            }
        });


        WebSocketTest();
        $("#temp_text,#lamp_text,#humidity_text,#watertemp_text").click(function(e){
            e.stopPropagation();
            var dtype=$(this).parent().attr("data-device");
            var dname=$(this).parent().attr("data-devicename");
            $("#Modal").attr("device",dtype);
            $("#myModalLabel").text(dname);
            $("#Modal input").val("");
            $("#Modal").modal('toggle');
        });
        $("#food_nextTime_text,#food .data-state-item-right").click(function(e){
            e.stopPropagation();
        });
    });
    function resetCamera(){
        var shipinOpen=$('input[name="shipin-checkbox"]').bootstrapSwitch('state');
        if(shipinOpen){
            $("[name='shipin-checkbox']").bootstrapSwitch('state', false);

        }
        var ttime=30;
        function countDown(){
            if(ttime==0){
                $(".switc-reset").attr("onclick","resetCamera()");
                $(".switc-reset").text("重启摄像头");
                $(".switc-reset").removeClass("disable");
                clearInterval(timer);
            }else{
                $(".switc-reset").addClass("disable");
                $(".switc-reset").removeAttr("onclick");
                $(".switc-reset").text("重启摄像头("+ttime+"s)");
            }
            ttime--;
        }
        var timer=setInterval(countDown,1000);
        var msg = {msg: 'resetCamera'};
        console.log(msg);
        var json = JSON.stringify(msg);
        if (ws != null) {
            ws.send(json);
        }
        alert("设备摄像头正在重启，请等待30秒后再次打开。")
    }
    function tijiaoUrl(){
        shipinUrl="http://"+$("#wangluo_input input").val()+":8080/?action=snapshot&n=" + (++imageNr);

        paused=false;
        createImageLayer();
    }
    function changeMinMax(){
        var device=$("#Modal").attr("device");
        if($("#min").val()==""||$("#max").val()==""){
            alert("请输入数值");
        }else{
            var msg = { msg: 'set', type: "device", device: device, min: $("#min").val(), max: $("#max").val() };
            var json = JSON.stringify(msg);
            console.log(json);
            ws.send(json);
            $("#Modal").modal('toggle');
        }

    }
    function setWifi(){
        var ssid=$("#ssid").val();
        var password=$("#password").val();
        if(ssid==""||password==""){
            alert("请输入wifi的SSID和密码");
        }else{
            var msg = { msg: 'setWifi', ssid: ssid, password: password };
            var json = JSON.stringify(msg);
            console.log(json);
            ws.send(json);
            $("#WIFI").modal('toggle');
            alert("Wifi设置成功，请等待设备重启");
            window.location.href='${path}/index';
        }

    }
    function WebSocketTest() {
        if ("WebSocket" in window) {

            // 打开一个 web socket
            ws = new WebSocket("ws://${ip}:8080${path}/websocket/socketServer?isuser=1&deviceid=${deviceid}");

            ws.onopen = function () {
                // Web Socket 已连接上，使用 send() 方法发送数据
                var msg = {msg: 'connect'};
                console.log(msg);
                var json = JSON.stringify(msg);
                //sendMessage(json);
                ws.send(json);
                setTimeout(function(){
                    var nowDate=new Date();
                    var nowTime=nowDate.getFullYear() + '-' + (nowDate.getMonth() + 1) + '-' + nowDate.getDate()+" "+nowDate.getHours()+":"+nowDate.getMinutes()+":"+nowDate.getSeconds();
                    msg = {msg: 'update',version:'${version}'};
                    json = JSON.stringify(msg);
                    ws.send(json);
                    setTimeout(function(){
                        msg = {msg: 'ip'};
                        json = JSON.stringify(msg);
                        ws.send(json);
                    },1000)
                },2000)

                //$(".bg-connect").hide();
            };

            ws.onmessage = function (evt) {
                var data = evt.data;
                try {
                    data = data.replace(/'/g, "\"");
                    console.log(data)
                    data = JSON.parse(data);
                    var msg = data["msg"];
                    var status = data["status"];

                    if(msg=="food_status"){
                        device_status.food_status = parseInt(data.food_status);
                        $("#food").attr("data-status", device_status.food_status);
                        if (device_status.food_status == 0) {
                            $("#food_controller").removeClass("olive").addClass("gray");
                            $("#food_controller .data-state-item-right-text3").text("已关闭");
                        } else {
                            $("#food_controller").removeClass("gray").addClass("olive");
                            $("#food_controller .data-state-item-right-text3").text("已开启");
                        }
                    }
                    if (msg == "get") {

                        auto = data.list["auto"];
                        device_status.lamp_status = parseInt(data.list.status.lamp);

                        device_status.penshui_status = parseInt(data.list.status.penshui);
                        device_status.temp_status = parseInt(data.list.status.temp);
                        device_status.watertemp_status = parseInt(data.list.status.watertemp);
                        var temp = 0, sunLight = 0, humidity = 0, water = 0, lamp = 0, food = 0, turangshidu = 0;
                        if (auto["autoClock"] == 1 || auto["autoClock"]  == "1") {
                            $('input[name="my-checkbox"]').bootstrapSwitch('state', true);
                        } else {
                            $('input[name="my-checkbox"]').bootstrapSwitch('state', false);
                            $("#watertemp,#temp,#lamp,#humidity").removeClass("isAuto");
                        }
                        checkAuto(auto);
                        changeStatus1(auto, device_status);
                        if (data.list.critical.food != null && data.list.critical.food != "") {
                            device_data.food_speed= parseInt(data.list.critical.food.food_speed);
                            device_data.food_running_time= parseInt(data.list.critical.food.food_running_time);
                            device_data.food_chixu= parseInt(data.list.critical.food.food_chixu_time);
                            if(device_data.food_speed=="0"){
                                device_data.food_speed="慢";
                            }else if(device_data.food_speed=="1"){
                                device_data.food_speed="快";
                            }
                            $("#food_speed_text").text(device_data.food_speed);
                            $("#food_chixu_text").text(device_data.food_chixu);
                            var food_running_time=data.list.critical.food.food_running_time;
                            if(food_running_time=="0"){
                                $("#food_nextTime_text").text("无下次喂食时间");
                            }else {
                                $("#food_nextTime_text").text("周" + getWeek(food_running_time.week) + " " + food_running_time.time);
                            }
                        }
                        if (data.list.light != null && data.list.light != "") {//光照
                            device_data.sunLight = parseInt(data.list.light);
                            device_data.min_lamp = parseInt(data.list.critical.lamp.min);
                            device_data.max_lamp = parseInt(data.list.critical.lamp.max);
                            $("#lamp .data-state-item-value").text(device_data.min_lamp + "Lx ~ " + device_data.max_lamp);
                            $("#lamp .data-state-item-right-text").text(device_data.sunLight);
                            if (device_data.sunLight >= device_data.min_lamp) {
                                $("#lamp .data-state-item-right-text3").text("白天");
                                $("#lamp .data-state-item-pic").addClass("fa-sun-o fa-spin").removeClass("fa-moon-o");
                            } else if(device_data.sunLight < device_data.min_lamp){
                                $("#lamp .data-state-item-right-text3").text("黑夜");
                                $("#lamp .data-state-item-pic").addClass("fa-moon-o").removeClass("fa-sun-o fa-spin");
                            }
                        }
                        if (data.list.temp != null && data.list.temp != "") {//空气温度
                            device_data.temp = parseInt(data.list.temp);
                            device_data.min_temp = parseInt(data.list.critical.temp.min);
                            device_data.max_temp = parseInt(data.list.critical.temp.max);
                            $("#temp .data-state-item-value").text(device_data.min_temp + "℃ ~ " + device_data.max_temp + "℃");
                            $("#temp .data-state-item-right-text").text(device_data.temp);
                            if (device_data.temp < device_data.min_temp) {
                                $("#temp .data-state-item-pic").addClass("fa-thermometer-empty cold").removeClass("fa-thermometer-half green2 fa-thermometer-full red");
                                $("#temp .data-state-item-right-pic").addClass("fa-snowflake-o fa-spin cold").removeClass("fa-cloud green2 fa-fire red");
                            } else if (device_data.temp >= device_data.min_temp && device_data.temp <= device_data.max_temp) {
                                $("#temp .data-state-item-pic").removeClass("fa-thermometer-empty cold fa-thermometer-full red").addClass("fa-thermometer-half green2");
                                $("#temp .data-state-item-right-pic").removeClass("fa-snowflake-o fa-spin cold fa-fire red").addClass("fa-cloud green2");
                            } else if (device_data.temp > device_data.max_temp) {
                                $("#temp .data-state-item-pic").removeClass("fa-thermometer-empty cold fa-thermometer-half green2").addClass("fa-thermometer-full red");
                                $("#temp .data-state-item-right-pic").removeClass("fa-snowflake-o fa-spin cold fa-cloud green2").addClass("fa-fire red");
                            }

                        }
                        if (data.list.humidity != null && data.list.humidity != "") {//湿度
                            device_data.humidity = parseInt(data.list.humidity);
                            device_data.min_humidity = parseInt(data.list.critical.humidity.min);
                            device_data.max_humidity = parseInt(data.list.critical.humidity.max);
                            $("#humidity .data-state-item-value").text(device_data.min_humidity + "% ~ " + device_data.max_humidity + "%");
                            $("#humidity .data-state-item-right-text").text(device_data.humidity);
                            if (device_data.humidity < device_data.min_humidity) {
                                $("#humidity .data-state-item-right-text3").text("干燥");
                            } else if (device_data.humidity >= device_data.min_humidity && device_data.humidity <= device_data.max_humidity) {
                                $("#humidity .data-state-item-right-text3").text("舒适");
                            } else if (device_data.humidity > device_data.max_humidity) {
                                $("#humidity .data-state-item-right-text3").text("潮湿");
                            }

                        }
                        if (data.list.watertemp != null && data.list.watertemp != "") {//水温
                            device_data.watertemp = parseInt(data.list.watertemp);
                            device_data.min_watertemp = parseInt(data.list.critical.watertemp.min);
                            device_data.max_watertemp = parseInt(data.list.critical.watertemp.max);
                            $("#watertemp .data-state-item-value").text(device_data.min_watertemp + "℃ ~ " + device_data.max_watertemp + "℃");
                            $("#watertemp .data-state-item-right-text").text(device_data.watertemp);
                            if (device_data.watertemp < device_data.min_watertemp) {
                                $("#watertemp .data-state-item-pic").addClass("fa-thermometer-empty cold").removeClass("fa-thermometer-half green2 fa-thermometer-full red");
                                $("#watertemp .data-state-item-right-pic").addClass("fa-snowflake-o fa-spin cold").removeClass("fa-cloud green2 fa-fire red");
                            } else if (device_data.watertemp >= device_data.min_watertemp && device_data.watertemp <= device_data.max_watertemp) {
                                $("#watertemp .data-state-item-pic").removeClass("fa-thermometer-empty cold fa-thermometer-full red").addClass("fa-thermometer-half green2");
                                $("#watertemp .data-state-item-right-pic").removeClass("fa-snowflake-o fa-spin cold fa-fire red").addClass("fa-cloud green2");
                            } else if (device_data.watertemp > device_data.max_watertemp) {
                                $("#watertemp .data-state-item-pic").removeClass("fa-thermometer-empty cold fa-thermometer-half green2").addClass("fa-thermometer-full red");
                                $("#watertemp .data-state-item-right-pic").removeClass("fa-snowflake-o fa-spin cold fa-cloud green2").addClass("fa-fire red");
                            }

                        }
                        /*if (data.list.turanshidu != null && data.list.turanshidu != "") {
                            if (data.list.turanshidu == "1") {
                                $("#turangshidu .data-state-item-pic").addClass("fa-envira").removeClass("fa-pied-piper");
                                $("#turangshidu .data-state-item-right-text3").text("湿润");
                            } else if (data.list.turanshidu == "0") {
                                $("#turangshidu .data-state-item-pic").addClass("fa-pied-piper").removeClass("fa-envira");
                                $("#turangshidu .data-state-item-right-text3").text("干燥");
                            }
                        }*/


                    } else if (msg == "connect") {
                        $(".bg-connect").hide();
                    } else if (msg == "close") {
                        alert("设备已断开连接");
                        window.location.href='${path}/index';

                    } else if (msg == "notfound") {
                        alert("目标设备当前不在线！！");
                        window.location.href='${path}/index';
                    }else if(msg == "update"){
                        alert("设备代码已更新,请等待设备重启并重新建立连接");
                        window.location.href='${path}/index';
                    }else if(msg=="food_time_list"){//自动喂食时间列表
                        var food_time_list=mergeObject(data["list"]);
                        setFoodHtml(food_time_list)
                    }
                    if(status=="0"){
                        alert(msg);
                    }

                } catch (e) {
                    console.log(e);
                }
            };

            ws.onclose = function () {
                // 关闭 websocket
                alert("连接已关闭...");
            };
        }

        else {
            // 浏览器不支持 WebSocket
            alert("您的浏览器不支持 WebSocket!");
        }
    }

    //检测每个传感器是否自动监控
    function checkAuto(auto){
        $("#temp").attr("data-isAuto",auto.temp_auto);
        $("#lamp").attr("data-isAuto",auto.lamp_auto);
        $("#humidity").attr("data-isAuto",auto.humidity_auto);
        $("#watertemp").attr("data-isAuto",auto.watertemp_auto);
        $("#food").attr("data-isAuto",auto.food_auto);
        if(auto["autoClock"].toString() == "1"){
            $("#watertemp").attr("onclick","changeAuto(this)");
            $("#temp").attr("onclick","changeAuto(this)");
            $("#lamp").attr("onclick","changeAuto(this)");
            $("#humidity").attr("onclick","changeAuto(this)");
            $("#food").attr("onclick","changeAuto(this)");

            if(auto.temp_auto.toString()=="0"){
                $("#temp").removeClass("isAuto");
                $("#temp_controller").attr("onclick", "changeDevice(this)");
            }else{
                $("#temp").addClass("isAuto");
                $("#temp_controller").removeAttr("onclick");
            }
            if(auto.lamp_auto.toString()=="0"){
                $("#lamp").removeClass("isAuto");
                $("#lamp_controller").attr("onclick", "changeDevice(this)");
            }else{
                $("#lamp").addClass("isAuto");
                $("#lamp_controller").removeAttr("onclick");
            }
            if(auto.humidity_auto.toString()=="0"){
                $("#humidity").removeClass("isAuto");
                $("#humidity_controller").attr("onclick", "changeDevice(this)");
            }else{
                $("#humidity").addClass("isAuto");
                $("#humidity_controller").removeAttr("onclick");
            }
            if(auto.watertemp_auto.toString()=="0"){
                $("#watertemp").removeClass("isAuto");
                $("#watertemp_controller").attr("onclick", "changeDevice(this)");
            }else{
                $("#watertemp").addClass("isAuto");
                $("#watertemp_controller").removeAttr("onclick");
            }
            if(auto.food_auto.toString()=="0"){
                $("#food").removeClass("isAuto");
                $("#food_controller").attr("onclick", "changeDevice(this)");
            }else{
                $("#food").addClass("isAuto");
                $("#food_controller").removeAttr("onclick");
            }
        }else{
            $("#watertemp").attr("onclick","");
            $("#temp").attr("onclick","");
            $("#lamp").attr("onclick","");
            $("#humidity").attr("onclick","");
            $("#food").attr("onclick","");
            $("#lamp_controller").attr("onclick", "changeDevice(this)");
            $("#temp_controller").attr("onclick", "changeDevice(this)");
            $("#humidity_controller").attr("onclick", "changeDevice(this)");
            $("#watertemp_controller").attr("onclick", "changeDevice(this)");
            $("#food_controller").attr("onclick", "changeDevice(this)");
        }

    }

    //修改传感器是否自动监控
    function changeAuto(_this){
        _this=$(_this);
        var device_auto=_this.attr("data-auto");
        var device_isAuto=_this.attr("data-isAuto");
        var msg;
        if (device_isAuto==1||device_isAuto=="1"){
            msg={"msg":"changeAuto","type":device_auto,"status":"0"};
            _this.attr("data-isAuto","0");
            _this.removeClass("isAuto");
        }else{
            msg={"msg":"changeAuto","type":device_auto,"status":"1"};
            _this.attr("data-isAuto","1");
            _this.addClass("isAuto");
        }
        var json = JSON.stringify(msg);
        console.log(json);
        ws.send(json);

    }

    function changeStatus1(auto, device_status) {
        $("#lamp_controller").attr("data-status", device_status.lamp_status);

        $("#humidity_controller").attr("data-status", device_status.penshui_status);
        $("#temp_controller").attr("data-status", device_status.temp_status);
        $("#watertemp_controller").attr("data-status", device_status.watertemp_status);
        if (device_status.lamp_status == 0) {
            $("#lamp_controller").removeClass("yellow").addClass("gray");
            $("#lamp_controller .data-state-item-right-text3").text("已关闭");
        } else {
            $("#lamp_controller").removeClass("gray").addClass("yellow");
            $("#lamp_controller .data-state-item-right-text3").text("已开启");
        }

        if (device_status.penshui_status == 0) {
            $("#humidity_controller").removeClass("water").addClass("gray");
            $("#humidity_controller .data-state-item-right-text3").text("已关闭");
        } else {
            $("#humidity_controller").removeClass("gray").addClass("water");
            $("#humidity_controller .data-state-item-right-text3").text("已开启");
        }
        if (device_status.watertemp_status == 0) {
            $("#watertemp_controller .data-state-item-right-text3").text("已关闭");
            $("#watertemp_controller .reshui ").removeClass("active");
            $("#watertemp_controller").removeClass("orange").addClass("gray");
        } else {
            $("#watertemp_controller").removeClass("gray").addClass("orange");
            $("#watertemp_controller .reshui ").addClass("active");
            $("#watertemp_controller .data-state-item-right-text3").text("已开启");
        }
        if (device_status.temp_status == 0) {
            $("#temp_controller").removeClass("red").addClass("gray");
            $("#temp_controller .jiawen ").removeClass("active");
            $("#temp_controller .data-state-item-right-text3").text("已关闭");
        } else {
            $("#temp_controller").removeClass("gray").addClass("red");
            $("#temp_controller .jiawen ").addClass("active");
            $("#temp_controller .data-state-item-right-text3").text("已开启");
        }
    }

    function changeDevice(_this) {
        //var device_status = $(_this).attr("device_status");
        var typ = $(_this).attr("data-type");
        var stat = $(_this).attr("data-status");
        var statusType = $(_this).attr("data-statustype");
        var msg;
        if (stat == 1 || stat == "1") {
            msg = {msg: 'changeDevice', type: typ, status: '0'};
            device_status[statusType] = "0";
            if(statusType=="lamp_status"){
                $("#lamp_controller").removeClass("yellow").addClass("gray");
                $("#lamp_controller .data-state-item-right-text3").text("已关闭");

            }else if(statusType=="penshui_status"){
                $("#humidity_controller").removeClass("water").addClass("gray");
                $("#humidity_controller .data-state-item-right-text3").text("已关闭");
            }else if(statusType=="watertemp_status"){
                $("#watertemp_controller .data-state-item-right-text3").text("已关闭");
                $("#watertemp_controller .reshui ").removeClass("active");
                $("#watertemp_controller").removeClass("orange").addClass("gray");
            }else if(statusType=="temp_status"){
                $("#temp_controller").removeClass("red").addClass("gray");
                $("#temp_controller .jiawen ").removeClass("active");
                $("#temp_controller .data-state-item-right-text3").text("已关闭");
            }

        } else {
            msg = {msg: 'changeDevice', type: typ, status: '1'};
            device_status[statusType] = "1";

            if(statusType=="lamp_status"){
                $("#lamp_controller").removeClass("gray").addClass("yellow");
                $("#lamp_controller .data-state-item-right-text3").text("已开启");
            }else if(statusType=="penshui_status"){
                $("#humidity_controller").removeClass("gray").addClass("water");
                $("#humidity_controller .data-state-item-right-text3").text("已开启");
            }else if(statusType=="watertemp_status"){
                $("#watertemp_controller").removeClass("gray").addClass("orange");
                $("#watertemp_controller .reshui ").addClass("active");
                $("#watertemp_controller .data-state-item-right-text3").text("已开启");
            }else if(statusType=="temp_status"){
                $("#temp_controller").removeClass("gray").addClass("red");
                $("#temp_controller .jiawen ").addClass("active");
                $("#temp_controller .data-state-item-right-text3").text("已开启");
            }else if(statusType=="food_status"){
                $("#food_controller").removeClass("gray").addClass("olive");
                $("#food_controller .data-state-item-right-text3").text("已开启");
            }
        }

        //_this.setData({ device_status: device_status })
        var json = JSON.stringify(msg);
        console.log(json);
        ws.send(json);

    }


    function camera(){
        socket = io.connect('http://${ip}:9000?poster=${userId}&type=1&receiver=${device_num}',params={'poster': '${userId}','type':'1','receiver':'${device_num}'});
        socket.on('connect', function(){
            socket.emit("response", "open")
            //alert("视频连接成功！");
            $("#cameraImg").show();
        });
        socket.on('close', function(data){
            alert("设备摄像服务已关闭！")
            socket.disconnect(true);
            $("#cameraImg").hide();
        });
        socket.on('camera', function(data){
            var img_src=data.replace("http://${ip}","");
            $("#cameraImg").attr("src","data:image/png;base64,"+img_src);
        });
    }
function back(){
    var shipinOpen2=$('input[name="shipin-checkbox"]').bootstrapSwitch('state');
    if(shipinOpen2){
        $("[name='shipin-checkbox']").bootstrapSwitch('state', false);
    }
    ws.close();
    window.location.href='${path}/index';
}
function FoodTimeList(){
    $("#food_time_list").modal('toggle');
    $(".food_list_bg").show()
    var msg={msg:'food_time_list'}
    var f_t_json=JSON.stringify(msg);
    ws.send(f_t_json);
}
function foodSpeedModal(){
    $("#food_speed_set").modal('toggle');
}
function setFoodSpeed(){
    var food_speed=$("input[name='food_speed']:checked").val();
    var food_chixu_time=$("#food_chixu_time").val();
    var msg = { msg: 'setFoodSpeed', food_speed: food_speed, food_chixu_time: food_chixu_time };
    var json = JSON.stringify(msg);
    console.log(json);
    ws.send(json);
    foodSpeedModal();
}
function addFootTime(){
    var f_t=$("input[name='food_time']").val();
    var f_t_l=[];
    var f_t_id="food"+new Date().getTime();
    var f_w_bloon=false;
    var wweekString="";
    if(f_t!=""&&f_t!=null){
        $("input[name='food_week']:checked").each(function(index){

                if(index==0){
                    wweekString=wweekString+getWeek($(this).val());
                }else{
                    wweekString=wweekString+"、"+getWeek($(this).val());
                }
                f_w_bloon=true;
                var f_t_map={id:f_t_id,week:$(this).val(),time:f_t};
                f_t_l.push(f_t_map);

        });
        if(!f_w_bloon){
            alert("星期未选！")
        }else{
            var msg={msg:'addFoodTime',list:f_t_l}
            var f_t_json=JSON.stringify(msg);
            ws.send(f_t_json);
            $("#food_time_set_form")[0].reset();
            $("#food_time_set").modal('toggle');

            $(".food_time_list").append('<div class="food_time_item">' +
                '                    <div class="food_time_list_item" data-id="'+f_t_id+'">' +
                '                        <div class="food_time_list_item_left left">' +
                '                            <div class="food_time_list_item_left_week left">'+wweekString+'</div>' +
                '                            <div class="food_time_list_item_left_time right">'+f_t+'</div>' +
                '                        </div>' +
                '                        <div class="food_time_list_item_delete right" ><button type="button" class="btn btn-danger" onclick="deleteFoodTime(\''+f_t_id+'\',this)">删除</button></div>' +
                '                    </div>' +
                '                </div>')
        }
    }else{
        alert("时间不能未空！")
    }

}
function deleteFoodTime(id,_this){
    _this=$(_this);
    _this.parents(".food_time_item").remove()
    var msg={msg:"deleteFoodTime",id:id}
    var f_t_json=JSON.stringify(msg);
    ws.send(f_t_json);
}
function mergeObject( array ) {//将硬件传输过来的喂食时间数组同一个星期合并。
        var arrayFilted = array;
        for (var af=0;af<arrayFilted.length;af++){
            for(var al=af+1;al<arrayFilted.length;al++){
                if(arrayFilted[af].id==array[al].id){
                    arrayFilted[af].week=arrayFilted[af].week+","+array[al].week;
                    arrayFilted.splice(al,1);
                    al--;
                }
            }
        }
        return arrayFilted;
}
function getWeek(week) {
    var weekObject={"0":"日","1":"一","2":"二","3":"三","4":"四","5":"五","6":"六"}
    return weekObject[week];
}
function setFoodHtml(food_time_list){
    $(".food_list_bg").hide()
    $(".food_time_list").empty();
    for(var fi=0;fi<food_time_list.length;fi++){
        var weeklist=food_time_list[fi].week.split(",");
        weeklistString="";
        for (var wi = 0; wi < weeklist.length; wi++) {
            var weekString=getWeek(weeklist[wi])
            if (wi==0){
                weeklistString=weekString;
            }else{
                weeklistString=weeklistString+"、"+weekString;
            }
        }
        $(".food_time_list").append('<div class="food_time_item">' +
            '                    <div class="food_time_list_item" data-id="'+food_time_list[fi].id+'">' +
            '                        <div class="food_time_list_item_left left">' +
            '                            <div class="food_time_list_item_left_week left">'+weeklistString+'</div>' +
            '                            <div class="food_time_list_item_left_time right">'+food_time_list[fi].time+'</div>' +
            '                        </div>' +
            '                        <div class="food_time_list_item_delete right" ><button type="button" class="btn btn-danger" onclick="deleteFoodTime(\''+food_time_list[fi].id+'\',this)">删除</button></div>' +
            '                    </div>' +
            '                </div>')
    }
}
</script>
</body>
</html>
