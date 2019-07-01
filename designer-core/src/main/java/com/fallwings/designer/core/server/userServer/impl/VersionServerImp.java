package com.fallwings.designer.core.server.userServer.impl;

import com.fallwings.designer.core.module.Version;
import com.fallwings.designer.core.server.VersionServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VersionServerImp implements VersionServer {
    @Autowired
    private VersionServer versionServer;
    @Override
    public Version getVersion() {
        return versionServer.getVersion();
    }
}
