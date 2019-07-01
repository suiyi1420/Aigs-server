<%@ include file="/base.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <script src="js/jquery.min.js" ></script>
</head>
<body>

<input id="send" />
<button id="sendBtn" value="send"></button>
<div id="message"></div>
<script>
    var curePath=window.document.location.href;
    var pathName=window.document.location.pathname;

var ws = null;
function openWebSocket(){

if ('WebSocket' in window) {
ws = new WebSocket("ws://${basePath2}/websocket/socketServer?webSocketId=liyede&toWebSocketId=000001");
} else {
ws = new SockJS("http://localhost:8080/sockjs/socketServer?webSocketId=liyede&toWebSocketId=000001");
}
ws.onopen = function () {

};

ws.onmessage = function (event) {
$("#message").text(event.data)
};
ws.onclose = function (event) {

};
}
$(document).ready(function(){
    openWebSocket();

})
    $("#sendBtn").click(function(){
        var obj={msg:$("#send").val()};
        ws.send(JSON.stringify(obj));
    })
</script>
</body>
</html>
