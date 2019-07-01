package com.fallwings.designer.core.module;

import com.baomidou.mybatisplus.annotations.TableName;

@TableName("device")
public class Device {
    private Integer deviceid;
    private String device_num;
    private String status;
    private String online;
    private String video_url;

    public Device() {
    }

    public Device(Integer deviceid, String device_num, String status, String online) {
        this.deviceid = deviceid;
        this.device_num = device_num;
        this.status = status;
        this.online = online;
    }

    public String getVideo_url() {
        return video_url;
    }

    public void setVideo_url(String video_url) {
        this.video_url = video_url;
    }

    public String getOnline() {
        return online;
    }

    public void setOnline(String online) {
        this.online = online;
    }

    public Integer getDeviceid() {
        return deviceid;
    }

    public void setDeviceid(Integer deviceid) {
        this.deviceid = deviceid;
    }

    public String getDevice_num() {
        return device_num;
    }

    public void setDevice_num(String device_num) {
        this.device_num = device_num;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
