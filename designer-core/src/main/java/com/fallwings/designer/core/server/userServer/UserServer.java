package com.fallwings.designer.core.server.userServer;

import com.fallwings.designer.core.module.Device;
import com.fallwings.designer.core.module.User;

public interface UserServer {
    User findByKeyWord(String keyWord);
    User findById(String keyWord);
    User findByKeyWord2(User user);
    boolean saveUserByWebChat(User user);
    Device findDevice(String userId);
}
