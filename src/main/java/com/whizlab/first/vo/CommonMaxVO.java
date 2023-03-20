package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Component
@Getter
@Setter
public class CommonMaxVO {
    private int cmnSeq;
    private int cmnMainCode;
    private int cmnCommonTypeMaxNum;
    private String cmnType;
}
