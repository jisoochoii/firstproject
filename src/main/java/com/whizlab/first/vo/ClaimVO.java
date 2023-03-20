package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.security.Timestamp;
import java.util.Date;

@Component
@Getter
@Setter
public class ClaimVO {
    private int claSeq;

    private String claTitle;

    private String claImgPath;

    private String claImgName;

    private String claContent;

    private String claRegiDate;

    private int claRegi;

    private String claStatus;

    private String claReason;

}
