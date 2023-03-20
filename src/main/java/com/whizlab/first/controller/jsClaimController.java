package com.whizlab.first.controller;

import com.whizlab.first.dao.NoticeDAO;
import com.whizlab.first.service.ClaimService;
import com.whizlab.first.vo.ClaimVO;
import com.whizlab.first.vo.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class jsClaimController {

    @Autowired
    private ClaimService service;

    @RequestMapping("/claimBoard")
    public ModelAndView claimBoard(HttpSession session, ModelAndView model) throws Exception{
        // customerCode 가져오기
        CustomerVO customer = new CustomerVO();
        customer = (CustomerVO) session.getAttribute("loginInfo");
        int claCustomer = customer.getCustomerCode();


        List<ClaimVO> claimList = service.claimList(claCustomer);

        model.addObject("claimList", claimList);
        model.setViewName("/claim/claimBoard");
        return model;
    }

    @RequestMapping("/writeClaim")
    public ModelAndView writeClaim(ModelAndView model) throws Exception{

        model.setViewName("/claim/writeClaim");
        return model;
    }

    @RequestMapping("/claimInsert")
    public String claimInsert(MultipartFile file, HttpServletRequest req, HttpSession session, ClaimVO claimVO, ModelAndView model) throws Exception{
        // customerCode 가져오기
        CustomerVO customer = new CustomerVO();
        customer = (CustomerVO) session.getAttribute("loginInfo");
        int claCustomer = customer.getCustomerCode();


        /* MAX claSeq 가져오기*/
        int maxClaSeq = service.getMaxClaSeq();

        /* 확장자 뽑아내서 파일이름 만들어주기 */
        int pos = file.getOriginalFilename().lastIndexOf(".");
        String ext = file.getOriginalFilename().substring(pos);
        String fileName = claCustomer + maxClaSeq + ext; //

        System.out.println("fileName은"+fileName);

        /* 저장 폴더 생성*/

        /* 회원가입 성공시 기업별로 /res/img/기업코드로 폴더 생성*/
        //String path = req.getSession().getServletContext().getRealPath("/resources/img/")+cb.getCoCode();


        /* 저장 폴더 경로 설정 */
        String path = req.getSession().getServletContext().getRealPath("/resources/image/")+claCustomer;
        File uploadPath = new File(path);
        if (!uploadPath.exists()) uploadPath.mkdirs();
        System.out.println("저장폴더경로"+path);
        try {
            /* 최종 경로로 파일 저장 */
            File realPath = new File(path,fileName);
            file.transferTo(realPath);

            /* VO에 파일 정보 SET */
            claimVO.setClaImgName(file.getOriginalFilename());
            claimVO.setClaRegi(claCustomer);
            claimVO.setClaImgPath("/image/"+claCustomer+"/"+fileName);


        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        if(claimVO.getClaImgPath() != null){

            service.claimInsert(claimVO);
        }

        return "redirect:/claimBoard";
    }

    @RequestMapping("/viewClaim")
    public ModelAndView viewClaim(ModelAndView model,int claSeq) throws Exception{
        ClaimVO viewClaim = service.viewClaim(claSeq);

        model.addObject("claimInfo", viewClaim);
        model.setViewName("/claim/viewClaim");

        return model;
    }
}
