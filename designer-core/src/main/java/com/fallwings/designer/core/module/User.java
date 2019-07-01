package com.fallwings.designer.core.module;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("user")
public class User {
    private String userid;
    private String account;
    private String password;
    private String is_webchat;
    private String status;
    private String user_name;
    private String user_pic;
    private String online;

    public User() {
    }

    public User(String userid, String account, String is_webchat, String status, String user_name, String user_pic) {
        this.userid = userid;
        this.account = account;
        this.is_webchat = is_webchat;
        this.status = status;
        this.user_name = user_name;
        this.user_pic = user_pic;
    }

    public User(String userid, String account, String password, String is_webchat, String status, String user_name, String user_pic, String online) {
        this.userid = userid;
        this.account = account;
        this.password = password;
        this.is_webchat = is_webchat;
        this.status = status;
        this.user_name = user_name;
        this.user_pic = user_pic;
        this.online = online;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOnline() {
        return online;
    }

    public void setOnline(String online) {
        this.online = online;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIs_webchat() {
        return is_webchat;
    }

    public void setIs_webchat(String is_webchat) {
        this.is_webchat = is_webchat;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_pic() {
        return user_pic;
    }

    public void setUser_pic(String user_pic) {
        this.user_pic = user_pic;
    }
}
