package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class ScreenVO {
    private int screenSeq;
    private String screenName;
    private String screenPath;
    private String screenUsage;
    private int screenRegi;
    private Timestamp screenRegiDate;
    private int screenEditor;
    private Timestamp screenEditDate;

    private String screenRegister;
    private String screenEdit;
}
