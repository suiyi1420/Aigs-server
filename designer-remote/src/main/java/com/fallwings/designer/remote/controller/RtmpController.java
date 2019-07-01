package com.fallwings.designer.remote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

@Controller
public class RtmpController {
    /**
     * 添加
     * @param file
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/rtmp/{deviceid}")
    public Object saveCK(InputStream file, HttpServletRequest request, @PathVariable String deviceid) throws Exception{

        InputStreamReader isr = new InputStreamReader(file);
        BufferedReader br = new BufferedReader(isr);
        String line="1";
        while ((line = br.readLine()) != null) ;


        //获取文件名
       // String fileName = file.getOriginalFilename();
        //文件扩展名
        //String extName = fileName.substring(fileName.lastIndexOf("."));

        //System.out.println("file.getOriginalFilename()"+file.getOriginalFilename());

        //mv.setViewName("redirect:list.do?CK_BELONG="+request.getParameter("ck_belong"));
        return null;
    }

}
