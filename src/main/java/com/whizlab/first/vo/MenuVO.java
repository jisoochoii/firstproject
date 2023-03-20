package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class MenuVO {
    private int menuSeq;
    private int menuUpperSeq;
    private String menuName;
    private String menuPath;
    private String menuType;
    private String menuCustomPath;
    private String menuDel;
    private String menuUsage;
    private int menuOrderID;
    private int menuLevelID;
    private int menuRegi;
    private Timestamp menuRegiDate;
    private int menuEditor;
    private Timestamp menuEditDate;
}
