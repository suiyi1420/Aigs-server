package com.fallwings.designer.remote.controller;

import com.fallwings.designer.core.module.Device;
import com.fallwings.designer.core.module.User;
import com.fallwings.designer.core.module.Version;
import com.fallwings.designer.core.server.userServer.DeviceServer;
import com.fallwings.designer.core.server.userServer.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/device")
public class DeviceController {
    @Autowired
    private DeviceServer deviceServer;
    @Autowired
    private UserServer userServer;

    @RequestMapping(value="find_user_device",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public List<Map<String,Object>> findUserDevice(HttpSession session){
        String userId= (String) session.getAttribute("userId");
        return deviceServer.findUserDevice(userId);
    }
    @RequestMapping(value="ajax_add_user_device",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object ajaxAddUserDevice(HttpSession session,String device_num,String name){
        String userId= (String) session.getAttribute("userId");
        //User user=userServer.findByKeyWord(userAccount);
        Map<String ,Object> map2=new HashMap<>();
        map2.put("userid",userId);
        Device device=deviceServer.findByKeyWord(device_num);
        if(device==null){
            device=new Device(1,device_num,"0","0");
            int deviceid=deviceServer.addDevice(device);
            map2.put("deviceid",device.getDeviceid());
        }else{
            map2.put("deviceid",device.getDeviceid());
        }
        String user_device_Id=deviceServer.findUserDeviceByAll(map2);
        Map<String ,Object> map=new HashMap<>();
        if(user_device_Id!=null&&!user_device_Id.equals("")){
            map.put("status",0);
            map.put("msg","设备已存在!");
            return map;
        }else{
            Map<String ,Object> map1=new HashMap<>();
            map1.put("userid",userId);
            map1.put("deviceid",device.getDeviceid());
            map1.put("name",name);
            map1.put("creat_time",new Date());
            deviceServer.addUserDevice(map1);
            map.put("status",1);
            map.put("msg","设备添加成功!");
            return map;
        }

    }

    @RequestMapping(value="ajax_edit_device",method = {RequestMethod.POST})
    @ResponseBody
    public void editDevice(Device device){
        deviceServer.editDevice(device);
    }

    @RequestMapping(value="ajax_edit_user_device",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object ajaxeDitUserDevice(HttpSession session,String name,String deviceid){
        String userId= (String) session.getAttribute("userId");
        Map<String,Object> map=new HashMap<>();
        map.put("userid",userId);
        map.put("deviceid",deviceid);
        map.put("name",name);
        deviceServer.editUserDevice(map);
        map=new HashMap<>();
        map.put("msg","修改成功!");
        return map;
    }
    @RequestMapping(value="ajax_delete_user_device",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object ajaxDeleteUserDevice(HttpSession session,String name,String deviceid){
        String userId= (String) session.getAttribute("userId");
        //User user=userServer.findByKeyWord(userAccount);
        Map<String,Object> map=new HashMap<>();
        map.put("userid",userId);
        map.put("deviceid",deviceid);
        deviceServer.deleteUserDevice(map);
        map=new HashMap<>();
        map.put("status",1);
        return map;
    }

    @RequestMapping(value="edit_user_device",method = {RequestMethod.GET})
    public String editUserDevice(Model model,String deviceid){
        model.addAttribute("deviceid",deviceid);
        return "/pages/editUserDevice";
    }
    @RequestMapping(value="delete_user_device",method = {RequestMethod.GET})
    public String deleteUserDevice(Model model,String deviceid){
        model.addAttribute("deviceid",deviceid);
        return "/pages/deleteUserDevice";
    }
    @RequestMapping(value="add_user_device",method = {RequestMethod.GET})
    public String addUserDevice(){
        return "/pages/addUserDevice";
    }

    @RequestMapping(value="listinfo",method = {RequestMethod.GET})
    public String listInfo(Model model,String device_num,HttpSession session){
        List<Version> version=deviceServer.getVersion();
        Integer deviceid=deviceServer.findByKeyWord(device_num).getDeviceid();
        model.addAttribute("deviceid",deviceid);
        model.addAttribute("version",version);
        model.addAttribute("device_num",device_num);
        model.addAttribute("userId",session.getAttribute("userId"));
        return "/pages/listinfo";
    }
}
