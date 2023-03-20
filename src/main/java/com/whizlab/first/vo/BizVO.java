package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class BizVO {
    private int bizSeq;
    private int bizCategory;            // 운영구분 (도매/위탁)
    private int bizCode;                // 사업장코드
    private String bizName;             // 사업장명

    // 기초 정보
    private String bizNumber;           // 사업자번호
    private String bizRegiNumber;       // 등록번호
    private String bizCEO;              // 대표자
    private String bizStatus;           // 업태
    private String bizItem;             // 종목

    // 주소 정보
    private String bizPostCode;            // 우편번호
    private String bizAddress;          // 주소
    private String bizAddressDetail;    // 상세주소

    // 계좌 정보
    private int bizBankName;            // 은행명
    private String bizBankNumber;       // 계좌번호
    private String bizNominee;          // 명의자

    // 추가 정보
    private String bizPhone;            // 전화번호
    private String bizMobile;           // 휴대번호
    private String bizFAX;              // FAX
    private String bizEmail;            // 이메일
    private String bizEmailDetail;      // 이메일 상세

    // 비고
    private String bizNote;             // 비고
    private String bizNoteUsage;        // 비고 사용여부

    // 담당자 정보
    private String bizManager;          // 담당자명
    private String bizManagerPhone;     // 담당자전화번호

    // 가상계좌 연동 정보
    private String bizLinkageID;        // 연동 아이디
    private String bizLinkageKey;       // 연동 비밀번호

    private String bizDel;
    private String bizRegi;
    private String bizEditor;

    private Timestamp bizRegiDate;
    private Timestamp bizEditDate;

    private String catCommon;
    private String bankCommon;
    private String emailCommon;
}

