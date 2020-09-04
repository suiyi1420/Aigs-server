package com.fallwings.designer.core.server.userServer.impl;

import com.fallwings.designer.core.dao.UserDao;
import com.fallwings.designer.core.module.Device;
import com.fallwings.designer.core.module.User;
import com.fallwings.designer.core.server.userServer.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServerImpl implements UserServer {
    @Autowired
    private UserDao userDao;


    @Override
    public User findByKeyWord(String keyWord) {
        return userDao.findByKeyWord(keyWord);
    }

    @Override
    public User findById(String keyWord) {
        return userDao.findById(keyWord);
    }

    @Override
    public User findByKeyWord2(User user) {
        return userDao.findByKeyWord2(user);
    }

    @Override
    public boolean saveUserByWebChat(User user) {
        userDao.saveUserByWebChat(user);
        return true;
    }

    @Override
    public Device findDevice(String userId) {
        return userDao.findDevice(userId);
    }
    @Override
    public boolean updateUser(User user){userDao.updateUser(user); return true;}


}
