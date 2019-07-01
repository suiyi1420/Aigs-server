<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/base.jsp" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
    </button>
    <h4 class="modal-title" id="myModalLabel">添加设备</h4>
</div>
<div class="modal-body">
    <form id="addForm" class="container form-horizontal" role="form">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">设备昵称：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" placeholder="请输入昵称"
                       required="required">
            </div>
        </div>
        <div id="password_group" class="form-group">
            <label for="device_num" class="col-sm-2 control-label">设备编码：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="device_num" name="device_num"
                       placeholder="请输入设备编码">
            </div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
    <button type="button" class="btn btn-primary" onclick="addDevice()">确认添加</button>
</div>

<script>
    function addDevice(){
        var formData=$("#addForm").serializeArray();
        $.ajax({
            url:"${path}/device/ajax_add_user_device",
            data:formData,
            success:function(data){
                alert(data.msg);
                $('#Modal').modal('hide');
                window.location.reload();
            }
        });
    }
</script>
