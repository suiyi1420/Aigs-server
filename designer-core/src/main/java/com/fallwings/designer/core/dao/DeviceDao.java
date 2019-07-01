package com.fallwings.designer.core.dao;

import com.fallwings.designer.core.module.Device;
import com.fallwings.designer.core.module.User;
import com.fallwings.designer.core.module.Version;

import java.util.List;
import java.util.Map;

public interface DeviceDao {
    User findUser(String deviceId);
    List<User> findUserList(String deviceId);
    Device findByKeyWord(String keyWord);
    List<Map<String,Object>> findUserDevice(String keyWord);
    void addUserDevice(Map<String,Object> map);
    String findUserDeviceByAll(Map<String,Object> map);
    int addDevice(Device device);
    void editUserDevice(Map<String,Object> map);
    void deleteUserDevice(Map<String,Object> map);
    void editDevice(Device device);
    Version getVersion();
}
