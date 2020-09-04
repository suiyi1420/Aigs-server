package com.fallwings.designer.web.server.sockets;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.DataListener;


public class SocketServer {
    public void startAction() throws InterruptedException {
        Configuration config = new Configuration();
        config.setHostname("0.0.0.0");
        config.setPort(8000);

        final SocketIOServer server = new SocketIOServer(config);
        SocketMetoh socketMetoh=new SocketMetoh(server);
        server.addConnectListener(socketMetoh);
        server.addDisconnectListener(socketMetoh);
        server.addListeners(socketMetoh);
        server.addEventListener("camera", Object.class,socketMetoh);
        server.addEventListener("response", Object.class,socketMetoh);
        /*server.addEventListener("response", Object.class, new DataListener<Object>() {
            @Override
            public void onData(SocketIOClient client, Object data, AckRequest ackRequest) {
                //System.out.println(data.toString());
                server.getBroadcastOperations().sendEvent("response", data);

            }
        });*/

        server.start();

        Thread.sleep(Integer.MAX_VALUE);

        server.stop();



    }



}
