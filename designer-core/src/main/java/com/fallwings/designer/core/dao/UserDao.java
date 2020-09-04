package com.fallwings.designer.core.dao;

import com.fallwings.designer.core.module.Device;
import com.fallwings.designer.core.module.User;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

public interface UserDao {
    User findByKeyWord(String keyWord);
    User findById(String keyWord);
    User findByKeyWord2(User user);
    Device findDevice(String userId);
    boolean saveUserByWebChat(User user);
    boolean updateUser(User user);
}
