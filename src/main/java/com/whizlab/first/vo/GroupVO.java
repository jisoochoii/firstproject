package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class GroupVO {
    private int groupSeq;
    private String groupName;
    private String groupUsage;
    private int groupRegi;
    private Timestamp groupRegiDate;
    private int groupEditor;
    private Timestamp groupEditDate;
}
