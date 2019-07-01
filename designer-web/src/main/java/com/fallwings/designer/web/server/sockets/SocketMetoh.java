package com.fallwings.designer.web.server.sockets;

import com.alibaba.fastjson.JSONObject;
import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.ConnectListener;
import com.corundumstudio.socketio.listener.DataListener;
import com.corundumstudio.socketio.listener.DisconnectListener;
import com.fallwings.designer.core.module.Device;
import com.fallwings.designer.core.module.User;

import java.util.*;

public class SocketMetoh implements ConnectListener,DisconnectListener,DataListener<Object> {
    private SocketIOServer server;
    //已建立连接的产品
    private static final Map<String, Object> sessionList = new HashMap<>();
    //设备所对应的用户（一对多）
    private static final Map<String, List<String>> deviceUserMap = new HashMap<>();

    public SocketMetoh(SocketIOServer server){
        this.server = server;
        this.server.addEventListener("message", Object.class, new DataListener<Object>() {
            @Override
            public void onData(SocketIOClient client, Object data, AckRequest ackRequest) {
                //System.out.println(data.toString());
                Map<String, List<String>> paramsList=client.getHandshakeData().getUrlParams();
                String poster = paramsList.get("poster").get(0).toString();//获取发送方
                String receiver = paramsList.get("receiver").get(0).toString();//获取发送方
                String type = paramsList.get("type").get(0).toString();//获取用户还是设备的标识
                String message_type="message";
                if(type.equals("0")){
                    sendMessageToUser(receiver, data, poster, type,message_type);
                }

                //server.getBroadcastOperations().sendEvent("camera", data);

            }
        });
    }
    @Override
    public void onConnect(SocketIOClient client) {
//        Integer clientSize = server.getAllClients().size();
        Map<String, List<String>> paramsList=client.getHandshakeData().getUrlParams();
        Map<String, Object> sessionMap = new HashMap<>();

        String type = paramsList.get("type").get(0).toString();
        String poster = paramsList.get("poster").get(0).toString();//获取发送方
        System.out.println(poster+"已连接!");
        String receiver;
        sessionList.put(poster, client);//链接加入链接池中

        if (type.equals("0")) {//建立连接的是设备
            List<String>list=new ArrayList<>();
            deviceUserMap.put(poster,list);
        } else {//建立连接的是用户，则查询设备的会话列表中是否存在该用户的会话，不存在就添加
            receiver = paramsList.get("receiver").get(0).toString();//获取发送方
            if(deviceUserMap.containsKey(receiver)&&!deviceUserMap.isEmpty()){//设备表中存在设备KEY值，则设备在线
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

            } else {//设备不存在(不在线)，发送不在线消息提示

                JSONObject jsonObject = new JSONObject();
                jsonObject.put("status", "0");
                jsonObject.put("msg", "设备摄像头服务未连接！");
                client.sendEvent(jsonObject.toJSONString());
            }
        }
    }

    @Override
    public void onDisconnect(SocketIOClient client) {
        //Integer clientSize = server.getAllClients().size();
        //System.out.println("刚离开一个客户端，总共有" + clientSize + "客户端连接成功。");
        Map<String, List<String>> paramsList=client.getHandshakeData().getUrlParams();
        String poster = paramsList.get("poster").get(0).toString();//获取发送方
        String receiver ="";//获取发送方
        String type = paramsList.get("type").get(0).toString();//获取用户还是设备的标识
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "cameraclose");
        jsonObject.put("poster", poster);
        String message_type="close";
        sendMessageToUser(receiver, jsonObject.toJSONString(), poster, type,message_type);

        if (type.equals("0")) {//建立连接的是设备

            deviceUserMap.remove(poster);//直接删除设备-用户表下该设备下的所有连接

        } else {//建立连接的是用户
            receiver =paramsList.get("receiver").get(0).toString();//获取接收方
            if(deviceUserMap.containsKey(receiver)) {
                List<String>list=deviceUserMap.get(receiver);
                if (list.size() > 0) {
                    Iterator<String> it = list.iterator();
                    while (it.hasNext()) {
                        String str = (String) it.next();
                        if (poster.equals(str)) {
                            it.remove();
                        }
                    }
                }
            }
        }
        removeSession(poster);//在连接池中删除该设备或者用户

        System.out.println("链接关闭："+poster);
    }

   /* @Override
    public void onData(SocketIOClient client, String data, AckRequest ackSender)
            throws Exception {

        System.out.println("刚有一个数据从客户端过来" + data);
        Map<String, List<String>> paramsList=client.getHandshakeData().getUrlParams();
        String poster = paramsList.get("poster").get(0).toString();//获取发送方
        String receiver = paramsList.get("receiver").get(0).toString();//获取发送方
        String type = paramsList.get("type").get(0).toString();//获取用户还是设备的标识
        if (type.equals("0")) {//建立连接的是设备
            String message_type="camera";
            sendMessageToUser(receiver, data, poster, type,message_type);
        }else{
            String message_type="message";
            sendMessageToUser(receiver, data, poster, type,message_type);
        }

    }*/
    @Override
    public void onData(SocketIOClient socketIOClient, Object o, AckRequest ackRequest) throws Exception {
        System.out.println("刚有一个数据从客户端过来\n" );
        Map<String, List<String>> paramsList=socketIOClient.getHandshakeData().getUrlParams();
        String poster = paramsList.get("poster").get(0).toString();//获取发送方
        String receiver = "";
        String type = paramsList.get("type").get(0).toString();//获取用户还是设备的标识
        if (type.equals("0")) {//建立连接的是设备
            String message_type="camera";
            sendMessageToUser(receiver, o.toString(), poster, type,message_type);
        }else{
            receiver =paramsList.get("receiver").get(0).toString();//获取接收方
            String message_type="response";
            sendMessageToUser(receiver, o.toString(), poster, type,message_type);
        }
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
     * @param receiver
     * @param message
     */
    public void sendMessageToUser(String receiver, Object message, String poster, String type,String massage_type) {
        if (!sessionList.isEmpty()){
            if (type.equals("1")) {//如果发送方是用户，直接发送
                if (sessionList.containsKey(receiver)) {//存在接收者的websocket会话
                    SocketIOClient client = (SocketIOClient) sessionList.get(receiver);
                    if (client!=null) {
                        client.sendEvent(massage_type,message);
                    }
                }
            }else if (type.equals("0")) {//发送方是设备（一对多），则遍历对应的所有用户，再发送
                if (!deviceUserMap.isEmpty()) {
                    if (deviceUserMap.containsKey(poster)) {
                        List<String>list=deviceUserMap.get(poster);
                        for (String s:list) {
                            if (sessionList.containsKey(s)) {
                                SocketIOClient client = (SocketIOClient) sessionList.get(s);//拿到用户的会话
                                client.sendEvent(massage_type,message);
                            }
                        }
                    }
                }
            }
        }
    }


}
