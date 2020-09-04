package com.fallwings.designer.remote.server.webSocket;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Websocket处理器
 */
@Component
public class WebSocketHandler extends TextWebSocketHandler {

    //已建立连接的产品
    private static final Map<String, Object> sessionList = new HashMap<>();
    //设备所对应的用户（一对多）
    private static final Map<String, List<String>> deviceUserMap = new HashMap<>();



    /**
     * 处理前端发送的文本信息
     * js调用websocket.send时候，会调用该方法
     *
     * @param session session对象
     * @param message 消息
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message){
        String poster = session.getAttributes().get("poster").toString();//获取发送方
        String receiver = session.getAttributes().get("receiver").toString();//获取发送方
        String type = session.getAttributes().get("type").toString();//获取用户还是设备的标识
        System.out.println(message.toString());
        if(!sessionList.containsKey(poster)){
            if (type.equals("0")) {//建立连接的是设备
                List<String>list=new ArrayList<>();
                deviceUserMap.put(poster,list);
            }
            sessionList.put(poster, session);
        }

        sendMessageToUser(receiver, message, poster, type);
    }


    /**
     * 当新连接建立的时候，被调用
     * 连接成功时候，会触发页面上onOpen方法
     *
     * @param webSocketSession websocket对象
     * @throws Exception 错误对象
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {

        String type = webSocketSession.getAttributes().get("type").toString();//连接类型：0设备 1用户
        String poster = webSocketSession.getAttributes().get("poster").toString();//获取发送方
        String receiver;
        sessionList.put(poster, webSocketSession);//链接加入链接池中

        if (type.equals("0")) {//建立连接的是设备
            String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            System.out.println(date);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("msg", "sysTime");
            jsonObject.put("sysTime", date);
            webSocketSession.sendMessage(new TextMessage(jsonObject.toJSONString()));//设备建立连接后首先服务器给设备发送日期信息，用户更新设备日期
            List<String>list=new ArrayList<>();
            deviceUserMap.put(poster,list);
            /*if(!deviceUserMap.isEmpty()&&!deviceUserMap.containsKey(poster)){//设备连接表不为空并且表中不存在设备的KEY值,创建对象
                List<String>list=new ArrayList<>();
                deviceUserMap.put(poster,list);
            }*/
        } else {//建立连接的是用户，则查询设备的会话列表中是否存在该用户的会话，不存在就添加
            receiver=webSocketSession.getAttributes().get("receiver").toString();//获取接收送方
            if(!deviceUserMap.isEmpty() && deviceUserMap.containsKey(receiver)){//设备表中存在设备KEY值，则设备在线
                List<String>list=deviceUserMap.get(receiver);
                if(list.size()>0) {//该设备已有用户与之建立连接
                    for (String string : list) {//遍历查询是否存在当前用户
                        if(!string.equals(poster)){//不存在当前用户，添加
                            list.add(poster);
                            break;
                        }
                    }
                }else{//该设备没有用户与之建立连接，则直接添加
                    list.add(poster);
                }
                deviceUserMap.put(receiver,list);
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("msg", "connect");
                sendMessageToUser(receiver, new TextMessage(jsonObject.toJSONString()), poster, type);
                jsonObject = new JSONObject();
                jsonObject.put("msg", "isSend");
                jsonObject.put("isSend", "1");
                sendMessageToUser(receiver, new TextMessage(jsonObject.toJSONString()), poster, type);
            } else {//设备不存在(不在线)，发送不在线消息提示

                JSONObject jsonObject = new JSONObject();
                jsonObject.put("status", "0");
                jsonObject.put("msg", "当前设备不在线！");
                webSocketSession.sendMessage(new TextMessage(jsonObject.toJSONString()));
            }

        }


        System.out.println(poster + "已连接");

    }

    /**
     * 当连接关闭时被调用
     *
     * @param session session对象
     * @param status 状态
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status){
        String poster = session.getAttributes().get("poster").toString();//获取发送方
        String receiver = session.getAttributes().get("receiver").toString();//获取接收方
        String type = session.getAttributes().get("type").toString();//获取用户还是设备的标识
        JSONObject jsonObject = new JSONObject();
        if (type.equals("0")) {//建立连接的是设备

            jsonObject.put("msg", "close");
            jsonObject.put("poster", poster);
            sendMessageToUser(receiver, new TextMessage(jsonObject.toJSONString()), poster, type);
            deviceUserMap.remove(poster);//直接删除设备-用户表下该设备下的所有连接

        } else {//建立连接的是用户
            jsonObject.put("msg", "close");
            jsonObject.put("poster", poster);
            if(deviceUserMap.containsKey(receiver)) {
                List<String> list = deviceUserMap.get(receiver);
                if (list.size() > 0){
                    Iterator<String> it = list.iterator();
                    while (it.hasNext()) {
                        String str = it.next();
                        if (poster.equals(str)) {
                            it.remove();
                        }
                    }
                }
                if(list.size() > 0){
                    jsonObject.put("msg", "isSend");
                    jsonObject.put("isSend", "1");
                    sendMessageToUser(receiver, new TextMessage(jsonObject.toJSONString()), poster, type);
                }else{
                    jsonObject.put("msg", "isSend");
                    jsonObject.put("isSend", "0");
                    sendMessageToUser(receiver, new TextMessage(jsonObject.toJSONString()), poster, type);
                }
            }
        }


        removeSession(poster);//在连接池中删除该设备或者用户
        System.out.println("链接关闭："+poster);
    }

    /**
     * 传输错误时调用
     *
     * @param session session
     * @param exception exception
     */
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception)  {


    }

    /**
     * 移除对应的session会话
     *
     * @param poster 用户名或者产品
     */
    private void removeSession(String poster) {
        if (!sessionList.isEmpty()) {
            sessionList.remove(poster);
        }


    }



    /**
     * 给某个用户发送消息
     *
     * @param receiver receiver
     * @param message message
     */
    private void sendMessageToUser(String receiver, TextMessage message, String poster, String type) {
        if (!sessionList.isEmpty()){
            if (type.equals("1")) {//如果发送方是用户，直接发送
                if (sessionList.containsKey(receiver)) {//存在接收者的websocket会话
                    WebSocketSession webSocketSession = (WebSocketSession) sessionList.get(receiver);
                    try {
                        if (webSocketSession.isOpen()) {
                            webSocketSession.sendMessage(message);
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            } else if (type.equals("0")) {//发送方是设备（一对多），则遍历对应的所有用户，再发送
                if (!deviceUserMap.isEmpty()){
                    if (deviceUserMap.containsKey(poster)){
                        List<String>list=deviceUserMap.get(poster);
                        for (String s:list){
                            if (sessionList.containsKey(s)){
                                WebSocketSession webSocketSession = (WebSocketSession) sessionList.get(s);
                                try {
                                    webSocketSession.sendMessage(message);
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }

                        }
                    }
                }
            }
        }


    }
}
