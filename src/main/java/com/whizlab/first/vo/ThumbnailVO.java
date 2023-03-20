package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class ThumbnailVO {
    private int tnbSeq;
    private String tnbTitle;
    private String tnbImageName;
    private String tnbImagePath;
    private String tnbContent;
    private int tnbRegi;
    private Timestamp tnbRegiDate;
    private int tnbEditor;
    private Timestamp tnbEditDate;
    private String tnbDel;

    private String tnbRegister;
    private String tnbEdit;
}
