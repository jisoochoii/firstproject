package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class MainCommonVO {
    private int mcCommonCodeSeq;
    private String mcCommonCodeName;
    private String mcCommonCodeUsage;
    private int mcCommonCodeRegi;
    private Timestamp mcCommonCodeRegiDate;
    private int mcCommonCodeEditor;
    private Timestamp mcCommonCodeEditDate;
}
