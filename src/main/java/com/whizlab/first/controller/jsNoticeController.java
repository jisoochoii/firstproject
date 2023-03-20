package com.whizlab.first.controller;

import com.mysql.cj.protocol.x.Notice;
import com.whizlab.first.service.NoticeService;
import com.whizlab.first.vo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class jsNoticeController {

    @Autowired
    private NoticeService service;

    @RequestMapping("/jsNotice")
    public ModelAndView showNotice(ModelAndView model) throws Exception{
        List<NoticeVO> notice = service.noticeList();


        System.out.println(notice);

        model.addObject("noticeList", notice);
        model.setViewName("/notice/noticeList");
        return model;
    }

    // 공지사항 하나 클릭
    @RequestMapping("/viewNotice")
    public ModelAndView viewNotice(ModelAndView model,@RequestParam int fbSeq) throws Exception{
        if(fbSeq != 0){
            NoticeVO notice = service.getNotice(fbSeq);

            model.addObject("notice", notice);
            model.setViewName("/notice/noticeV");
        }

        return model;
    }

    // 공지사항 작성
    @RequestMapping("/writeNotice")
    public ModelAndView writeNotice(ModelAndView model) throws Exception{
        System.out.println("확인");

        return model;
    }

    // 공지사항 수정


}
