package com.fallwings.designer.remote.controller;


import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 测试类
 */

@Controller
@RequestMapping("/websocket")
public class WebSocketController {


    @RequestMapping("/login")
    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session=request.getSession();
        String username=null;
        username=(String)session.getAttribute("currentUser");
        if(username==null){
            username = request.getParameter("username");
        }
        System.out.println(username + "登录");

        session.setAttribute("SESSION_USERNAME", username);
        response.sendRedirect("websocket.jsp");
    }

    @RequestMapping("/send")
    @ResponseBody
    public String send(String productId,String message) {

        //infoHandler().sendMessageToUser(productId,1, new TextMessage(message));
        return null;
    }

}
