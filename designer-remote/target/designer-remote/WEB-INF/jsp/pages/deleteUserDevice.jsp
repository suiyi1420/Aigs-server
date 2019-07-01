<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/base.jsp" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
    </button>
    <h4 class="modal-title" id="myModalLabel">警告！</h4>
</div>
<div class="modal-body">
    <p class="bg-danger" style="text-align: center;padding:2vw;">是否确定删除该设备？</p>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
    <button type="button" class="btn btn-danger" onclick="delDevice()">确认删除</button>
</div>

<script>
    function delDevice(){

        $.ajax({
            url:"${path}/device/ajax_delete_user_device",
            data:{deviceid:${deviceid}},
            success:function(data){
                alert(data.msg);
                $('#Modal').modal('hide');
                window.location.reload();
            }
        });
    }
</script>