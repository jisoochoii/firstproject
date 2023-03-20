package com.whizlab.first.controller;

import javax.servlet.http.HttpSession;

import com.whizlab.first.service.BizService;
import com.whizlab.first.service.FreeboardService;
import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.FreeboardVO;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.whizlab.first.service.UserService;
import com.whizlab.first.vo.UserVO;

import java.util.List;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	@Autowired
	private FreeboardService service;

	@Autowired
	private BizService bizService;

	@RequestMapping(value = "/home")
	public ModelAndView home(ModelAndView model) throws Exception {
		List<FreeboardVO> fbList = service.fbList();
		model.addObject("fbList", fbList);
		model.setViewName("/main/home");
		return model;
	}

	@RequestMapping("/wait")
	public ModelAndView login(ModelAndView model) throws Exception {
		model.setViewName("login");
		return model;
	}
	
	@RequestMapping(value="/loginCheck")
	public String LoginCheck(HttpSession session, UserVO user) throws Exception {
		UserVO users = userService.UserLogin(user);
		// 비밀번호 복호화
		Boolean pwMatch = BCrypt.checkpw(user.getUserPW(), users.getUserPW());

		if(pwMatch) {
			session.setAttribute("loginInfo", users);
			session.setAttribute("bizCode", users.getUserBizCode());
			return "redirect:/home";
		} else {
			session.setAttribute("msg", "잘못된 아이디 또는 비밀번호입니다! 다시 입력해주세요");
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();

		return "redirect:/";
	}
	
	@RequestMapping(value="/signUp")
	public ModelAndView SignUp(ModelAndView model) throws Exception {
		List<BizVO> bizList = bizService.bizList();

		model.addObject("bizList", bizList);
		model.setViewName("/login/register");
		return model;
	}
	
	@RequestMapping(value="/adminInsert")
	public String adminInsert(ModelAndView model, HttpSession session, UserVO user) throws Exception {
		int idChk = userService.IDCheck(user.getUserID());

		// 중복체크
		if(idChk == 1){
			session.setAttribute("msg","Y");
		}
		// 비밀번호 암호화
		String hashedPw = BCrypt.hashpw(user.getUserPW(), BCrypt.gensalt());
		user.setUserPW(hashedPw);

		if(user != null){
			userService.UserInsert(user);
		}

		return "redirect:/home";
	}

}
