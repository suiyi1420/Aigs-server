package com.fallwings.designer.remote.controller;


import com.fallwings.designer.core.unit.CommonClass;
import com.fallwings.designer.core.unit.MailUtil;
import net.sf.json.JSONObject;
import com.fallwings.designer.core.module.User;
import com.fallwings.designer.core.server.userServer.UserServer;
import com.fallwings.designer.core.unit.AesCbcUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

public class UserController {

    @Autowired
    private UserServer userServer;

    public static String GETlogin(String u) {
        String result = "";
        BufferedReader in = null;

        try {

            URL realUrl = new URL(u);
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            connection.connect();

            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }

            in = new BufferedReader(new InputStreamReader(connection.getInputStream()));

            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求失败");
            e.printStackTrace();
        } finally {
            try {
                if (in != null) {
                    in.close();

                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        return result;

    }

    @GetMapping(value="/")
    public String root(){

        return "/pages/index";

    }
    @GetMapping(value="/index")
    public String index(Model model,HttpSession session){
        if(session.getAttribute("userId")==null){
            return "redirect:/login";
        }else {
            return "/pages/index";
        }
    }

    @GetMapping(value="/login")
    public String loginIndex(Model model){
        return "/pages/login";
    }



    @RequestMapping(value="/webchat",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object startApp(String encryptedData, String iv, String code,HttpSession session) {
        Map map = new HashMap<>();

        if (code == null || code.length() == 0) {

            map.put("status", 0);
            map.put("msg", "code是空的");
            // System.out.println("code" + code);
            return map;
        }

        System.out.println(code);
        String wxappid = "wxb29d6acd6f80e01f";//liyede2008@163.com的小程序号
        String wxSecret = "be6251b28f9e112f340451f4ce0f70c0";
        String grant_type = "authorization_code";

        String u = "https://api.weixin.qq.com/sns/jscode2session?appid=" + wxappid + "&secret=" + wxSecret
                + "&js_code=" + code + "&grant_type=authorization_code";
        ;
        String s = UserController.GETlogin(u);
        //将这个拼接出来的url打印出来看一下
        System.out.println(u);
        System.out.println(s);
        JSONObject json=JSONObject.fromObject(s);

        System.out.println("这里是openid和session_key" + json);
        String session_key = (String) json.get("session_key");
        String openid = (String) json.get("openid");

        try {
            System.out.println("进入解密成功程序");
            String result = AesCbcUtil.decrypt(encryptedData, session_key, iv, "utf-8");
            JSONObject resultJson = JSONObject.fromObject(result);
            //nickName :微信昵称   city ：微信城市    province ：微信省份   avatarUrl ：微信头像
            String nickName=resultJson.getString("nickName"),city=resultJson.getString("city"),
                    province=resultJson.getString("province"),avatarUrl=resultJson.getString("avatarUrl");

            System.out.println(resultJson);
            if (null != result && result.length() > 0) {
                User user=userServer.findByKeyWord(openid);
                if(user==null){
                    User newUser=new User(new Date().getTime()+"",openid,"1","0",nickName,avatarUrl);
                    userServer.saveUserByWebChat(newUser);
                }
                session.setAttribute("userId",openid);
                String sessionId=session.getId();
                map.put("status", 1);
                map.put("msg", "解密成功");
                HashMap userinfo = new HashMap<>();
                userinfo.put("session_id", sessionId);
                map.put("userInfo", userinfo);
            }

        } catch (Exception e) {
            System.out.println("解密失败");
            System.out.println(e);
        }
        return map;
    }

    @RequestMapping(value="reflashsession",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object reFlashSession(HttpServletRequest request) {
        Map<String,Object> map=new HashMap<>();
        map.put("status","1");
        return map;
    }

    @RequestMapping(value="sendIdCode",method = {RequestMethod.GET,RequestMethod.POST})
    public void AjaxSendIdCode(String mail,String type, HttpServletResponse response, HttpServletRequest request)throws IOException, MessagingException {
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("utf-8");
        int idcode = (int)(Math.random()*100000);
        String text = Integer.toString(idcode);

        MailUtil mailUtil=null;
        if (type.equals("regist")){
            mailUtil  = new MailUtil(mail,"爱龟助手平台注册验证");
            request.getSession().setAttribute("regist_yzm", text);
        }else if (type.equals("login")){
            mailUtil  = new MailUtil(mail,"爱龟助手平台登录验证");
            request.getSession().setAttribute("login_yzm", text);
        }

        mailUtil.sendMail( text);
        out.write("success");

    }

    @RequestMapping(value="regist",method = {RequestMethod.GET})
    public String regist(Model model){
        return "/pages/regist";
    }
    @RequestMapping(value="ajax_regist",method = {RequestMethod.POST})
    @ResponseBody
    public Object ajax_regist(User user, String idcode,HttpServletRequest request){
        Map<String,Object> map=new HashMap<>();
        if(user.getAccount()!= null){
            if(!request.getSession().getAttribute("regist_yzm").equals(idcode)){

                request.getSession().setAttribute("idcodeMsg", "验证码错误！");
                map.put("status",0);
                map.put("msg","验证码错误！");
            }else{
                User user1=userServer.findByKeyWord(user.getAccount());
                if(user1!= null ){
                    request.getSession().setAttribute("usernameMsg", "该邮箱已注册！");
                    map.put("status",0);
                    map.put("msg","该邮箱已注册！");

                }else{
                    System.out.println(idcode);
                    String create_time=new Date().getTime()+"";
                    user.setUserid(create_time);
                    user.setIs_webchat("0");
                    user.setStatus("0");
                    user.setPassword(CommonClass.getMd5(user.getAccount()+"aigs"+user.getPassword()+new Date().getTime()));
                    userServer.saveUserByWebChat(user);
                    map.put("status",1);
                    map.put("msg","注册成功！");
                }
            }


        }else{
            map.put("status",0);
            map.put("msg","账号不可为空！");
        }
        return map;
    }

    @RequestMapping(value="ajax_login",method = {RequestMethod.POST})
    @ResponseBody
    public Object ajax_login(User user,String yzm,HttpSession session){
        User user1=userServer.findByKeyWord(user.getAccount());
        Map<String,Object> map=new HashMap<>();
        if(user1!=null){
            if (!user.getPassword().equals("")&&user.getPassword()!=null){
                user.setPassword(CommonClass.getMd5(user.getAccount()+"aigs"+user.getPassword()+user1.getUserid()));
                User user2=userServer.findByKeyWord2(user);
                if(user2!=null){
                    session.setAttribute("userId",user2.getUserid());
                    map.put("status",1);
                }else{
                    map.put("msg","密码错误！");
                    map.put("status",0);
                }
            }
            if(yzm!=null&&!yzm.equals("")){
                if(yzm.equals(session.getAttribute("login_yzm"))){
                    session.setAttribute("userId",user1.getUserid());
                    map.put("status",1);
                }else{
                    map.put("msg","请输入正确的验证码！");
                    map.put("status",0);
                }
            }
        }else{
            map.put("msg","账号不存在！");
            map.put("status",0);
        }
        return map;
    }

    @RequestMapping(value="logout",method = {RequestMethod.GET})
    public String logout(Model model,HttpSession session){
        session.invalidate();
        return "/pages/login";
    }

}
