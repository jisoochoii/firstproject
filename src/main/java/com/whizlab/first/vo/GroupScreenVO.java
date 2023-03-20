package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class GroupScreenVO {
    private int sgSeq;
    private int sgGroupSeq;
    private int sgScreenSeq;
    private String sgAuth;
    private int sgRegi;
    private Timestamp sgRegiDate;
    private int sgEditor;
    private Timestamp sgEditDate;

    private String sgRegister;
    private String sgEdit;
    private String screenName;
    private String screenPath;

}
