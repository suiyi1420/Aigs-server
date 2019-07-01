
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/base.jsp" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
    </button>
    <h4 class="modal-title" id="myModalLabel">修改设备</h4>
</div>
<div class="modal-body">
    <form class="container form-horizontal" role="form">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">设备昵称：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" placeholder="请输入昵称"
                       required="required">
            </div>
        </div>

    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
    <button type="button" class="btn btn-primary" onclick="addDevice()">确认修改</button>
</div>
<script>
    function addDevice(){
        $.ajax({
            url:"${path}/device/ajax_edit_user_device",
            data:{deviceid:${deviceid},name:$("#name").val()},
            success:function(data){
                alert(data.msg);
                $('#Modal').modal('hide');
                window.location.reload();
            }
        });
    }
</script>