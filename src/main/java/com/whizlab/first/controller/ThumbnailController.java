package com.whizlab.first.controller;

import com.whizlab.first.service.ThumbnailService;
import com.whizlab.first.util.PageCreate;
import com.whizlab.first.vo.PageVO;
import com.whizlab.first.vo.ThumbnailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
public class ThumbnailController {
    @Autowired
    private ThumbnailService service;

//    private String uploadPath = "/image/";
    private String uploadPath = "C:\\Users\\mjkim\\IdeaProjects\\first\\src\\main\\webapp\\resources\\image\\";

    @RequestMapping("/tnb")
    public ModelAndView thumbnail(ModelAndView model, PageVO vo) throws Exception {
        PageCreate pc = new PageCreate();
        pc.setPaging(vo);
        pc.setArticleTotalCount(service.getTotal(vo));

        List<ThumbnailVO> tnbList = service.thumbnailList(vo);
        model.addObject("tnbList",tnbList);
        model.addObject("pc", pc);
        model.setViewName("/thumbnail/thumbnailBoard");
        return model;
    }

    @RequestMapping("/writeTnb")
    public ModelAndView writeTnb(ModelAndView model){
        model.setViewName("/thumbnail/thumbnailW");
        return model;
    }

    @RequestMapping("/tnbView")
    public ModelAndView thumbnailView(ModelAndView model, int tnbSeq) throws Exception {
        ThumbnailVO tnbList = service.thumbnailViewList(tnbSeq);
        model.addObject("tnbList",tnbList);
        model.setViewName("/thumbnail/thumbnailM");
        return model;
    }

    @RequestMapping("/tnbInsert")
    public String tnbInsert(ThumbnailVO tnb , MultipartFile file) throws Exception {
        UUID uuid = UUID.randomUUID();
        String fileName = uuid + "_" + file.getOriginalFilename();

        File saveFile = new File(uploadPath, fileName);
        try {
            file.transferTo(saveFile);
            tnb.setTnbImagePath(fileName);
            tnb.setTnbImageName(file.getOriginalFilename());
        }catch (Exception e) {
            System.out.println("등록에 파일업로드 에러");
        }
        if(tnb != null){
            service.thumbnailInsert(tnb);
        }
        return "redirect:/tnb";
    }

    @RequestMapping("/tnbUpdate")
    public String tnbUpdate(ThumbnailVO tnb, MultipartFile files) throws Exception {
        File file = new File(uploadPath, tnb.getTnbImagePath());

        // 위에 주소에 파일이 있으면 삭제하고 새로운 UUID로 파일을 만든다
        if(file.exists()){
            file.delete();

            UUID uuid = UUID.randomUUID();
            String fileName = uuid + "_" + files.getOriginalFilename();
            File saveFile = new File(uploadPath, fileName);
            try {
                files.transferTo(saveFile);
                tnb.setTnbImagePath(fileName);
                tnb.setTnbImageName(files.getOriginalFilename());
            }catch (Exception e) {
                System.out.println("수정에 파일업로드 에러");
            }
        }



        if(tnb != null){
            service.thumbnailUpdate(tnb);
        }

        return "redirect:/tnb";
    }

    @RequestMapping("/tnbDel")
    public String tnbDel(ThumbnailVO tnb) throws Exception {
        int tnbSeq = tnb.getTnbSeq();

        if(tnbSeq != 0){
            service.thumbnailDel(tnbSeq);
        }

        return "redirect:/tnb";
    }
}
