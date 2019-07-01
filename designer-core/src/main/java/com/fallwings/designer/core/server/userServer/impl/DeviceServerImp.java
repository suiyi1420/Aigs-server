package com.fallwings.designer.core.server.userServer.impl;

import com.fallwings.designer.core.dao.DeviceDao;
import com.fallwings.designer.core.module.Device;
import com.fallwings.designer.core.module.User;
import com.fallwings.designer.core.module.Version;
import com.fallwings.designer.core.server.userServer.DeviceServer;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DeviceServerImp implements DeviceServer {
    @Autowired
    private DeviceDao deviceDao;
    @Override
    public User findUser(String deviceId) {
        return deviceDao.findUser(deviceId);
    }

    @Override
    public List<User> findUserList(String deviceId) {
        return deviceDao.findUserList(deviceId);
    }

    @Override
    public Device findByKeyWord(String keyWord) {
        return deviceDao.findByKeyWord(keyWord);
    }

    @Override
    public List<Map<String,Object>>findUserDevice(String keyWord) {
        return deviceDao.findUserDevice(keyWord);
    }

    @Override
    public void addUserDevice(Map<String, Object> map) {
        deviceDao.addUserDevice(map);
    }

    @Override
    public String findUserDeviceByAll(Map<String, Object> map) {
        return deviceDao.findUserDeviceByAll(map);
    }

    @Override
    public int addDevice(Device device) {
        return deviceDao.addDevice(device);
    }

    @Override
    public void editUserDevice(Map<String, Object> map) {
        deviceDao.editUserDevice(map);
    }

    @Override
    public void deleteUserDevice(Map<String, Object> map) {
        deviceDao.deleteUserDevice(map);
    }

    @Override
    public void editDevice(Device device) {
        deviceDao.editDevice(device);
    }

    @Override
    public Version getVersion() {
        return deviceDao.getVersion();
    }
}
