package com.whizlab.first.controller;

import com.whizlab.first.service.FreeboardService;
import com.whizlab.first.vo.FreeboardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class FreeboardController {
    @Autowired
    private FreeboardService service;

    // 테이블에 데이터를 뿌려주는 메서드
    @RequestMapping("/fbList")
    public ModelAndView fbList(ModelAndView model) throws Exception {
        List<FreeboardVO> fbList = service.fbList();
        model.addObject("fbList", fbList);
        model.setViewName("/freeboard/freeboardList");
        return model;
    }

    // 한개의 게시물 보는 메서드
    @RequestMapping("/fbViewList")
    public ModelAndView fbViewList(ModelAndView model, @RequestParam int fbSeq) throws Exception {
        if(fbSeq != 0){
            FreeboardVO fbView = service.fbViewList(fbSeq);

            model.addObject("fbView", fbView);
            model.setViewName("/freeboard/freeboardM");
        }
        return model;
    }

    // 글쓰기하는 게시판으로 가는 메서드
    @RequestMapping("/writeFB")
    public ModelAndView writeFB(ModelAndView model){
        model.setViewName("/freeboard/freeboardW");
        return model;
    }

    @RequestMapping("/fbInsert")
    public String fbInsert(FreeboardVO fb) throws Exception {
        if(fb != null){
            service.fbInsert(fb);
        }

        return "redirect:/home";
    }

    @RequestMapping("/fbUpdate")
    public String fbUpdate(FreeboardVO fb) throws Exception {
        if(fb != null){
            service.fbUpdate(fb);
        }

        return "redirect:/home";
    }

    @RequestMapping("/fbDel")
    public String fbDel(FreeboardVO fb) throws Exception {
        int fbSeq = fb.getFbSeq();

        if(fbSeq != 0){
            service.fbDel(fbSeq);
        }
        return "redirect:/home";
    }
}
