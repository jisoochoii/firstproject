package com.whizlab.first.util;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.*;

@Component
public class FileUtil {
    private String uploadPath = "/image/";
    public List<Map<String, Object>> parseFileInfo(Map<String, Object> map, MultipartFile[] file) throws Exception {

        String boardIDX = String.valueOf(map.get("idx"));
        String creaID = (String) map.get("crea_id");

        List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();

        File target = new File(uploadPath);
        if(!target.exists()) target.mkdirs();

        for(int i=0; i<file.length; i++) {

            String orgFileName = file[i].getOriginalFilename();
            String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
            String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
            Long saveFileSize = file[i].getSize();

            target = new File(uploadPath, saveFileName);
            file[i].transferTo(target);

            Map<String, Object> fileInfo = new HashMap<String, Object>();

            fileInfo.put("BOARD_IDX", boardIDX);
            fileInfo.put("ORG_FILE_NAME", orgFileName);
            fileInfo.put("SAVE_FILE_NAME", saveFileName);
            fileInfo.put("FILE_SIZE", saveFileSize);
            fileInfo.put("CREA_ID", creaID);
            fileList.add(fileInfo);

        }

        return fileList;
    }
}
