package com.fallwings.designer.remote.server.webSocket;



import com.fallwings.designer.core.module.Device;
import com.fallwings.designer.core.module.User;
import com.fallwings.designer.core.module.Version;
import com.fallwings.designer.core.server.VersionServer;
import com.fallwings.designer.core.server.userServer.DeviceServer;
import com.fallwings.designer.core.server.userServer.UserServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * WebSocket握手拦截器
 */
@Component
public class WebSocketHandshakeInterceptor implements HandshakeInterceptor {
    @Autowired
    private UserServer userServer;
    @Autowired
    private DeviceServer deviceServer;

    public static WebSocketHandshakeInterceptor webSocketHandshakeInterceptor;

    @PostConstruct
    public void init() {
        webSocketHandshakeInterceptor=this;
        webSocketHandshakeInterceptor.deviceServer=this.deviceServer;
        webSocketHandshakeInterceptor.userServer=this.userServer;
    }

    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler, Map<String, Object> attributes) throws Exception {
        if (request instanceof ServletServerHttpRequest) {
            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
            HttpSession session=servletRequest.getServletRequest().getSession(false);
            String isuser=servletRequest.getServletRequest().getParameter("isuser");
            String deviceNum=servletRequest.getServletRequest().getParameter("deviceNum");
            if(isuser!=null&&isuser.equals("1")) {//用户发起的请求
                String deviceid=servletRequest.getServletRequest().getParameter("deviceid");
                String userId = (String) session.getAttribute("userId");
                User user=webSocketHandshakeInterceptor.userServer.findById(userId);
                if (user != null ) {
                    attributes.put("poster", user.getUserid());//发送方
                    attributes.put("receiver", deviceid);//接收方
                    attributes.put("type", 1);//接收方
                }
            }else{//设备发起的请求
                Device device=webSocketHandshakeInterceptor.deviceServer.findByKeyWord(deviceNum);//获取设备的全部信息
                Integer deviceId=0;
                if(device!=null){
                    attributes.put("type", 0);//接收方
                    deviceId=device.getDeviceid();
                    List<User> userList=webSocketHandshakeInterceptor.deviceServer.findUserList(deviceId+"");
                    attributes.put("poster", deviceId);
                    if(userList.size()>0) {
                        attributes.put("receiver", userList);
                    }else{
                        attributes.put("receiver", null);
                    }
                }

            }
        }
        return true;
    }

    public void afterHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler, Exception e) {
        System.out.println("After Handshake");
    }

}
