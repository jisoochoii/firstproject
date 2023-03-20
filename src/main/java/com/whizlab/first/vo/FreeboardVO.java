package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class FreeboardVO {
    private int fbSeq;
    private String fbTitle;
    private String fbContent;
    private int fbRegi;
    private Timestamp fbRegiDate;
    private int fbEditor;
    private Timestamp fbEditDate;

    private String fbRegister;
    private String fbEdit;
}
