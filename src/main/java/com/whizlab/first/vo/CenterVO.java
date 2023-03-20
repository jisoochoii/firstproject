package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class CenterVO {
    private int centerSeq;              // 센터 Seq
    private int centerCode;             // 센터 코드
    private String centerName;          // 센터명

    private String centerSName;         // 센터약칭
    private String centerType;          // 센터타입
    private String centerTemp;          // 센터 보관온도

    private int centerBizCode;          // 사업장Seq
    private String centerBizNumber;     // 센터 사업자번호
    private String centerBizCEO;        // 센터 대표자
    private String centerBizStatus;     // 센터 업종
    private String centerBizItem;       // 센터 업태

    private String centerPostCode;      // 센터 우편번호
    private String centerAddress;       // 센터 주소
    private String centerAddressDetail; // 센터 주소 상세

    private String centerPhone;         // 센터 전화번호
    private String centerMobile;        // 센터 핸드폰번호
    private String centerFAX;           // 센터 FAX
    private String centerEmail;         // 센터 이메일
    private String centerEmailDetail;   // 센터 이메일 상세

    private String centerNote;          // 센터 비고
    private int centerNoteUsage;        // 센터 비고사용여부

    private String centerDel;           // 센터 삭제여부
    private int centerRegi;             // 센터 등록자
    private Timestamp centerRegiDate;   // 센터 등록일자
    private int centerEditor;           // 센터 수정자
    private Timestamp centerEditDate;   // 센터 수정일자

    private String centerRegister;      // 센터 등록자명
    private String centerEdit;          // 센터 수정자명

    private String emailCommon;
    private String usageCommon;
}



