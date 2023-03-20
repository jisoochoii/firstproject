package com.whizlab.first.controller;

import com.whizlab.first.service.MenuService;
import com.whizlab.first.vo.MenuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MenuController {
    @Autowired
    private MenuService service;

    @RequestMapping("/menu")
    public ModelAndView menu(ModelAndView model) throws Exception{
        List<MenuVO> menu = service.menuList();
        List<MenuVO> menuUpper = service.menuUpperList();
        model.addObject("menuList", menu);
        model.addObject("menuUpperList", menuUpper);
        model.setViewName("/menu/menuList");
        return model;
    }

    @RequestMapping("/insertMenu")
    public String insertMenu(MenuVO menu) throws Exception{
        System.out.println(menu.getMenuPath());
        if(menu != null){
            service.insertMenu(menu);
        }

        return "redirect:/menu";
    }
}
