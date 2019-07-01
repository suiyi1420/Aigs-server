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
    <link href="${path}/css/listinfo.css" rel="stylesheet" type="text/css">
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
<script type="text/javascript" src="${path}/js/listinfo.js"></script>
<script>
var ip="${ip}",path="${path}",userId="${userId}",device_num="${device_num}",version="${version}",deviceid=${deviceid};
</script>
</body>
</html>
