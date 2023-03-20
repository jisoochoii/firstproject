package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class CustomerVO {
    private int customerSeq                     ;

    private int customerBizArea                 ; // 거래처구분
    private int customerBizCode                 ; // 사업장코드
    private String customerBrandCode            ; // 브랜드코드
    private int customerCode                    ; // 거래처코드
    private String customerName                 ; // 거래처명
    private int customerCenterCode              ; // 센터코드

    private String customerBizNumber            ; // 사업자번호
    private String customerBizCEO               ; // 대표자
    private String customerJuMinNumber          ; // 주민번호
    private String customerBizType              ; // 업태
    private String customerBizItem              ; // 업종
    private String customerSName                ; // 거래처 약칭
    private String customerPayCategory          ; // 거래구분
    private String customerPayMethod            ; // 거래방법

    private String customerPhone                ; // 전화번호
    private String customerMobile               ; // 휴대폰번호
    private String customerFAX                  ; // FAX
    private String customerEmail                ; // 이메일
    private String customerEmailDetail          ; // 이메일 상세

    private String customerBank                 ; // 은행명
    private String customerBankAccount          ; // 계좌번호
    private String customerBankNominee          ; // 명의자
    private String customerVirtualBank          ; // 가상계좌
    private String customerVirtualBankAccount   ; // 가상계좌번호
    private String customerVirtualBankNominee   ; // 가상계좌 명의자
    private String customerVirtualBankDeposit   ; // 가상계좌 입금자

    private String customerWebID                ; // 웹 아이디
    private String customerWebPW                ; // 웹 비밀번호

    private String customerPostCode             ; // 우편번호
    private String customerAddress              ; // 주소
    private String customerAddressDetail        ; // 주소 상세

    private String customerGuaranteeNumber      ; // 증권번호
    private String customerGuaranteeType        ; // 담보종류
    private String customerGuaranteeAmount      ; // 담보금액
    private String customerGuaranteeStartDate   ; // 담보시작일
    private String customerGuaranteeEndDate     ; // 담보종료일
    private String customerGuaranteeBondLimit   ; // 채권한도여부
    private String customerGuaranteeBondAmount  ; // 채권한도금액

    private int customerSaleUnit                ; // 판매단가
    private int customerDiscount                ; // DC율
    private String customerDealStartDate        ; // 거래시작일
    private String customerDealEndDate          ; // 거래종료일

    private int customerUsage                   ; // 사용여부
    private String customerNote                 ; // 비고

    private String customerManager              ; // 담당자
    private String customerManagerPhone         ; // 담당자 전화번호
    private String customerManagerMobile        ; // 담당자 휴대폰번호
    private String customerManagerEmail         ; // 담당자 이메일
    private String customerManagerEmailDetail   ; // 딤당자 이메일 상세

    private String customerDeliveryManager      ; // 배송담당자(courierSeq)

    private String customerStockCome            ; // 발주후 입고일수
    private String customerDeliveryMon          ; // 월요일
    private String customerDeliveryTue          ; // 화요일
    private String customerDeliveryWed          ; // 수요일
    private String customerDeliveryThu          ; // 목요일
    private String customerDeliveryFri          ; // 금요일
    private String customerDeliverySat          ; // 토요일
    private String customerDeliverySun          ; // 일요일
    private String customerDeliveryEvery        ; // 수시
    private String customerDeliveryEOD          ; // 격일배송여부
    private String customerAutoOrder            ; // 자동발주여부
    private String customerDel                  ; // 삭제여부

    private int customerRegi                    ; // 등록자
    private Timestamp customerRegiDate          ; // 등록일자
    private int customerEditor                  ; // 수정자
    private Timestamp customerEditDate          ; // 수정일자

    private String customerRegister             ; // 등록자명
    private String customerEdit                 ; // 수정자명

    private String bizName                      ; // 사업장명
    private String brandName                    ; // 브랜드명
    private String centerName                   ; // 센터명
    private String bizAreaName                  ; // 거래처구분명
    private String courierName                  ; // 기사명
    private String courierMobile                ; // 기사 전화번호
    private String brandEndTime                 ; // 기사 전화번호
}