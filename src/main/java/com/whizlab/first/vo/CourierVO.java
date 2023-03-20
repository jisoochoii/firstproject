package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.sql.Timestamp;

@Component
@Getter
@Setter
public class CourierVO {
    private int         courierSeq          ;
    private int         courierBizCode      ;
    private int         courierCode         ;
    private int         courierCenter       ;
    private String      courierName         ;

    private String      courierPhone        ;
    private String      courierMobile       ;
    private String      courierWorkDistance ;
    private String      courierJoinDate     ;

    private String      courierPostCode     ;
    private String      courierAddress      ;
    private String      courierAddressDetail;

    private String      courierBelong       ;
    private String      courierContact      ;
    private String      courierManager      ;

    private String      courierCarOwner     ;
    private String      courierCarNumber    ;
    private String      courierCarModel     ;
    private String      courierCarModelYear ;
    private String      courierCarTonnage   ;
    private String      courierCarColor     ;
    private String      courierCarTemp      ;

    private int         courierUsage        ;
    private String      courierNote         ;

    private String      courierDel          ;
    private int         courierRegi         ;
    private int         courierEditor       ;
    private Timestamp   courierEditDate     ;
    private Timestamp   courierRegiDate     ;

    private String      courierRegister     ;
    private String      courierEdit         ;
    private String      emailCommon         ;
    private String      usageCommon         ;
    private String      centerName          ;
    private String      centerCode          ;
}


