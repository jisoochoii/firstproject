package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class CommonCodeVO {
    private int commonCodeSeq;
    private int commonCodeType;
    private int commonCodeNumber;
    private String commonCodeName;
    private String commonCodeValue;
    private String commonCodeUsage;
    private int commonCodeOrder;
    private int commonCodeRegi;
    private Timestamp commonCodeRegiDate;
    private int commonCodeEditor;
    private Timestamp commonCodeEditDate;
}
