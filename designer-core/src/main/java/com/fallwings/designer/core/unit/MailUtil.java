package com.fallwings.designer.core.unit;

import java.security.Security;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
    static Properties props;
    static Message msg;
    static Transport transport;



    public MailUtil(String mail, String title) {
        try {
            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
            //设置邮件会话参数
            props = new Properties();
            //邮箱的发送服务器地址
            props.setProperty("mail.smtp.host", "smtp.163.com");
            props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
            props.setProperty("mail.smtp.socketFactory.fallback", "false");
            //邮箱发送服务器端口,这里设置为465端口
            props.setProperty("mail.smtp.port", "465");
            props.setProperty("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.auth", "true");
            final String username = "liyede2008";
            final String password = "liyede2008";
            //获取到邮箱会话,利用匿名内部类的方式,将发送者邮箱用户名和密码授权给jvm
            Session session = Session.getDefaultInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });
            //通过会话,得到一个邮件,用于发送
            msg = new MimeMessage(session);
            //设置发件人
            msg.setFrom(new InternetAddress("liyede2008@163.com"));
            //设置收件人,to为收件人,cc为抄送,bcc为密送
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail, false));
            msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(mail, false));
            msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(mail, false));
            msg.setSubject(title);
            //设置邮件消息
            //msg.setText(message);
            //设置发送的日期
            //msg.setSentDate(new Date());

            //调用Transport的send方法去发送邮件
            //Transport.send(msg);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    /**
     * 得到邮箱地址邮箱内容发送。
     *
     * @param text 邮箱内容
     * @throws AddressException
     * @throws MessagingException
     */

    public void sendMail(String text) throws AddressException, MessagingException{
        msg.setText(text);
        transport.send(msg);
    }


}

