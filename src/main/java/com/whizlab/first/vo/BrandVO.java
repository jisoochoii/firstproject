package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class BrandVO {
    private int brandSeq;
    private int brandBizCode;
    private int brandCategory;
    private int brandCode;
    private String brandName;
    private int brandEndTime;
    private int brandDeadline;
    private int brandMinCost;
    private String brandUsage;
    private int brandRegi;
    private Timestamp brandRegiDate;
    private int brandEditor;
    private Timestamp brandEditDate;

    private String category;
    private String register;
    private String edit;
}
