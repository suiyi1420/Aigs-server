package com.fallwings.designer.web.server.sockets;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class SocketListener implements ServletContextListener {

    private MyThread myThread;
    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        if (myThread!=null&&myThread.isInterrupted()) {
            myThread.interrupt();
        }

    }

    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        String str =null;
        if (str==null&&myThread==null) {
            myThread=new MyThread();
            myThread.start();//servlet上下文初始化时启动socket
        }
    }


    /*
     * 自定义一个Class线程类继承自线程类，重写run()方法，用于从后台获取处理数据
     *
     */
    class MyThread extends Thread{
        public void run() {
            while (!this.isInterrupted()) {//线程未中断执行循环
                try {
                    Thread.sleep(2000);//每隔2000ms执行一次


                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                //----------------------开始执行---------------------
                System.out.println("TIME:"+System.currentTimeMillis());

                SocketServer ss=new SocketServer();
                try {
                    ss.startAction();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

            }
        }
    }

}
