package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class UserGroupVO {
    private int ugSeq;
    private int ugGroupSeq;
    private int ugUserSeq;
    private int ugRegi;
    private Timestamp ugRegiDate;
    private int ugEditor;
    private Timestamp ugEditDate;

    private String groupName;
    private String userName;
    private String groupSeq;
    private String userSeq;
}
