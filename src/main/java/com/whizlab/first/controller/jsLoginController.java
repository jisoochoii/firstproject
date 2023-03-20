package com.whizlab.first.controller;

import com.whizlab.first.service.CustomerService;
import com.whizlab.first.vo.CustomerVO;
import com.whizlab.first.vo.UserVO;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class jsLoginController {
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/")
    public ModelAndView login(ModelAndView model) throws Exception {
        model.setViewName("jslogin");
        return model;
    }


    @RequestMapping("/jsLoginCheck")
    public String LoginCheck(HttpSession session, CustomerVO customer) throws Exception {

        //고객 로그인
        CustomerVO customers = customerService.customerLogin(customer);

        if(customers != null){
            if(customer.getCustomerWebID().equals(customers.getCustomerWebID())){
                session.setAttribute("loginInfo", customers);
                return "redirect:/home";
            }else {
                session.setAttribute("msg", "로그인 실패");
                return "redirect:/";
            }
        }else {
            session.setAttribute("msg", "로그인 실패");
            return "redirect:/";
        }
    }
}
