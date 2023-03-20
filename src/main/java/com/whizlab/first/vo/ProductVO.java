package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Component
@Getter
@Setter
public class ProductVO {
    private int prodSeq              ;
    private int prodBizArea          ;
    private int prodBizCode          ;
    private int prodCustomerCode     ;
    private int prodCode             ;
    private String prodName             ;
    private String prodDealStartDate    ;
    private String prodDealEndDate      ;

    private int prodArea             ;
    private int prodItem             ;
    private int prodClassified       ;
    private int prodWebArea          ;
    private int prodPicking          ;

    private int prodBasicUnit        ;
    private String prodTax              ;
    private String prodBoxAmount        ;
    private String prodMinAmount        ;

    private int prodDelivery         ;
    private String prodManageCode       ;
    private String prodSName            ;
    private String prodExpiration       ;
    private String prodLocation         ;
    private String prodBarcode          ;

    private String prodStock            ;
    private String prodStockAmount      ;
    private String prodStockDate        ;
    private String prodSetWeb           ;
    private String prodSetProd          ;
    private String prodSetZero          ;

    private String prodManufacturer     ;
    private int prodOriginal            ;
    private String prodStandard         ;
    private String prodBoxWeight        ;
    private String prodEINum            ;

    private String prodNote             ;

    private String prodDel              ;
    private int prodUsage               ;

    private int prodRegi                ;
    private String prodRegiDate         ;
    private int prodEditor              ;
    private String prodEditDate         ;

    private String prodRegister;
    private String prodEdit;
    private String bizName;
}


