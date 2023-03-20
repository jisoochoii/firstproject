<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<input type="hidden" id="customerSeq">
<div class="panel panel-inverse">
    <div class="panel-body">
        <%-- 사업장 폼  --%>
        <form id="formId" method="post" action="${pageContext.request.contextPath}/insertCustomer">
            <input type="hidden" id="customerEditor" name="customerEditor" value="${loginInfo.userSeq}">
            <input type="hidden" id="customerRegi" name="customerRegi" value="${loginInfo.userSeq}">
            <div class="row">
                <%-- 첫번째 줄 필수정보/기초정보 --%>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <legend class="m-b-15">필수정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="customerBizArea" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 거래처구분</label>
                                <select id="customerBizArea" name="customerBizArea" class="form-control col-md-8" >
                                    <option hidden>거래처 구분을 선택해주세요</option>
                                    <c:forEach items="${categoryList}" var="cate">
                                        <option value="${cate.commonCodeNumber}">${cate.commonCodeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerBizCode" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 사업장명</label>
                                <select id="customerBizCode" name="customerBizCode" class="form-control col-md-8" disabled>
                                    <option value="0" hidden>거래처구분을 먼저 선택해주세요</option>
                                    <c:forEach items="${bizList}" var="biz">
                                        <option value="${biz.bizCode}">${biz.bizName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerBrandCode" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 브랜드명</label>
                                <select id="customerBrandCode" name="customerBrandCode" class="form-control col-md-8" disabled>
                                    <option value="0" hidden>사업장명을 먼저 선택해주세요</option>
                                    <c:forEach items="${brandList}" var="brand">
                                        <option value="${brand.brandCode}">${brand.brandName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerCode"class="col-form-label col-md-3">거래처코드</label>
                                <input id="customerCode" type="text" class="form-control col-md-8" readonly>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerName" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 거래처명</label>
                                <input id="customerName" name="customerName" type="text" class="form-control col-md-8" >
                            </div>

                            <div class="form-group row m-b-15">
                                <label for="customerCenterCode" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 기본센터</label>
                                <select id="customerCenterCode" name="customerCenterCode" class="form-control col-md-8" disabled>
                                    <option value="0" hidden>사업장명을 먼저 선택해주세요</option>
                                    <c:forEach items="${centerList}" var="cent">
                                        <option value="${cent.centerCode}">${cent.centerName}</option>
                                    </c:forEach>
                                </select>
                            </div>


                        </div>

                        <div class="col-lg-6">
                            <legend class="m-b-15">기초정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="customerBizNumber" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 사업자번호</label>
                                <input id="customerBizNumber" name="customerBizNumber" type="tel" class="form-control col-md-8"
                                       maxlength="12" oninput="business_num(this.value,'customerBizNumber')">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerBizCEO" class="col-form-label col-md-3">대표자</label>
                                <input id="customerBizCEO" name="customerBizCEO" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerJuMinNumber" class="col-form-label col-md-3">주민번호</label>
                                <input id="customerJuMinNumber" name="customerJuMinNumber" type="text" class="form-control col-md-8 regiNum" maxlength="14">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerBizType" class="col-form-label col-md-3">업태</label>
                                <input id="customerBizType" name="customerBizType" type="text" class="form-control col-md-8" >
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerBizItem" class="col-form-label col-md-3">종목</label>
                                <input id="customerBizItem" name="customerBizItem" type="text" class="form-control col-md-8">
                            </div>

                            <div class="form-group row m-b-15">
                                <label for="customerSName" class="col-form-label col-md-3">거래처 약칭</label>
                                <input id="customerSName" name="customerSName" type="text" class="form-control col-md-8" >
                            </div>

                            <div class="form-group row m-b-15">
                                <label for="customerPayCategory" class="col-form-label col-md-3">결제구분</label>
                                <select id="customerPayCategory" name="customerPayCategory" class="form-control col-md-8" disabled>
                                    <option value="0" hidden>결제구분을 선택해주세요</option>
                                    <c:forEach items="${paymentList}" var="payment">
                                        <option value="${payment.commonCodeNumber}">${payment.commonCodeName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group row m-b-15">
                                <label for="customerPayMethod" class="col-form-label col-md-3">결제방법</label>
                                <select id="customerPayMethod" name="customerPayMethod" class="form-control col-md-8" disabled>
                                    <option value="0" hidden>결제방법을 선택해주세요</option>
                                    <c:forEach items="${payMethodList}" var="method">
                                        <option value="${method.commonCodeNumber}">${method.commonCodeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <%-- 두번째 줄 주소정보/배송정보 --%>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <legend class="m-b-15">주소정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="customerPostCode" class="col-form-label col-md-3">우편번호</label>
                                <input id="customerPostCode" name="customerPostCode" type="text" class="form-control col-md-5">
                                <a id="searchPost" type="text" class="btn btn-success col-md-3" href="javascript:DaumPostcode()">주소찾기</a>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerAddress" class="col-form-label col-md-3">주소</label>
                                <input id="customerAddress" name="customerAddress" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerAddressDetail" class="col-form-label col-md-3">상세주소</label>
                                <input id="customerAddressDetail" name="customerAddressDetail" type="text" class="form-control col-md-8">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <legend class="m-b-15">배송정보</legend>
                            <input type="hidden" id="customerDeliveryManager" name="customerDeliveryManager">
                            <div class="form-group row m-b-15">
                                <label for="center" class="col-form-label col-md-3">배송센터</label>
                                <input id="center" type="text" class="form-control col-md-5" disabled>
                                <a id="searchCenter" class="btn btn-success col-md-3" href="javascript:SearchModal();">검색</a>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="deliveryManager" class="col-form-label col-md-3">배송담당자</label>
                                <input id="deliveryManager" type="tel" class="form-control col-md-8 phoneNumber" maxlength="13" readonly>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="contact" class="col-form-label col-md-3">핸드폰번호</label>
                                <input id="contact" type="text" class="form-control col-md-8" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- 세번째 줄 계좌정보/담보정보 --%>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <legend class="m-b-15">계좌정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="customerBank" class="col-form-label col-md-3">은행</label>
                                <select id="customerBank" name="customerBank" class="form-control col-md-8" >
                                    <option value="0" hidden>은행을 선택해주세요</option>
                                    <c:forEach items="${bankList}" var="bank">
                                        <option value="${bank.commonCodeNumber}">${bank.commonCodeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerBankAccount" class="col-form-label col-md-3">계좌번호</label>
                                <input id="customerBankAccount" name="customerBankAccount" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerBankNominee" class="col-form-label col-md-3">명의자</label>
                                <input id="customerBankNominee" name="customerBankNominee" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerVirtualBank" class="col-form-label col-md-3">가상계좌</label>
                                <input id="customerVirtualBank" name="customerVirtualBank" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerVirtualBankAccount" class="col-form-label col-md-3">가상계좌번호</label>
                                <input id="customerVirtualBankAccount" name="customerVirtualBankAccount" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerVirtualBankNominee" class="col-form-label col-md-3">명의자</label>
                                <input id="customerVirtualBankNominee" name="customerVirtualBankNominee" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerVirtualBankDeposit" class="col-form-label col-md-3">입금자</label>
                                <input id="customerVirtualBankDeposit" name="customerVirtualBankDeposit" type="text" class="form-control col-md-8">
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <legend class="m-b-15">담보정보</legend>
                            <input type="hidden" name="customerDeliveryManager">
                            <div class="form-group row m-b-15">
                                <label for="customerGuaranteeNumber" class="col-form-label col-md-3">증권번호</label>
                                <input id="customerGuaranteeNumber" name="customerGuaranteeNumber" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerGuaranteeType" class="col-form-label col-md-3">담보종류</label>
                                <select id="customerGuaranteeType" name="customerGuaranteeType" class="form-control col-md-8" >
                                    <option value="0" hidden>담보종류를 선택해주세요</option>
                                    <c:forEach items="${guaranteeList}" var="guar">
                                        <option value="${guar.commonCodeNumber}">${guar.commonCodeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerGuaranteeAmount" class="col-form-label col-md-3">담보금액</label>
                                <input id="customerGuaranteeAmount" name="customerGuaranteeAmount" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerGuaranteeStartDate" class="col-form-label col-md-3">담보시작일</label>
                                <input id="customerGuaranteeStartDate" name="customerGuaranteeStartDate" type="date" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerGuaranteeEndDate" class="col-form-label col-md-3">담보종료일</label>
                                <input id="customerGuaranteeEndDate" name="customerGuaranteeEndDate" type="date" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <input id="customerGuaranteeBondLimit" name="customerGuaranteeBondLimit" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                                <label for="customerGuaranteeBondLimit" class="col-form-label col-md-3">채권한도여부</label>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerGuaranteeBondAmount" class="col-form-label col-md-3">채권한도금액</label>
                                <input id="customerGuaranteeBondAmount" name="customerGuaranteeBondAmount" type="text" class="form-control col-md-8">
                            </div>
                        </div>
                    </div>
                </div>
                <%-- 네번째 줄 로그인정보/판매정보 --%>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <legend class="m-b-15">로그인정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="customerWebID" class="col-form-label col-md-3">아이디</label>
                                <input id="customerWebID" name="customerWebID" type="text" class="form-control col-md-8" readonly>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerWebPW" class="col-form-label col-md-3">비밀번호</label>
                                <div class="col-md-8">
                                    <input id="customerWebPW" name="customerWebPW" type="password" data-toggle="password" data-placement="after" class="form-control" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <legend class="m-b-15">판매정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="customerSaleUnit" class="col-form-label col-md-3">판매단가</label>
                                <select id="customerSaleUnit" name="customerSaleUnit" class="form-control col-md-8" >
<%--                                    <option hidden>판매단가를 선택해주세요</option>--%>
                                    <c:forEach items="${saleUnitList}" var="sale">
                                        <option value="${sale.commonCodeNumber}">${sale.commonCodeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerDiscount" class="col-form-label col-md-3">DC율</label>
                                <select id="customerDiscount" name="customerDiscount" class="form-control col-md-8" >
                                    <option value="0">0%</option>
                                    <c:forEach items="${discountList}" var="dis">
                                        <option value="${dis.commonCodeNumber}">${dis.commonCodeName}%</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerDealStartDate" class="col-form-label col-md-3">거래시작일</label>
                                <input id="customerDealStartDate" name="customerDealStartDate" type="date" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="customerDealEndDate" class="col-form-label col-md-3">거래종료일</label>
                                <input id="customerDealEndDate" name="customerDealEndDate" type="date" class="form-control col-md-8" value="2999-12-31">
                            </div>
                        </div>
                    </div>
                </div>
                <%-- 아코디언 추가정보/거래처담당/기타정보 --%>
                <div class="col-lg-12">
                    <div class="card-accordion" id="accordion">
                        <%-- 추가정보 정보 --%>
                        <div class="card">
                            <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseOne">추가정보</div>
                            <div id="collapseOne" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="form-group row m-b-15">
                                        <label for="customerPhone" class="col-form-label col-md-2">전화번호</label>
                                        <input id="customerPhone" name="customerPhone" type="tel" class="form-control col-md-10 phoneNumber" maxlength="13">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="customerMobile" class="col-form-label col-md-2">휴대전화번호</label>
                                        <input id="customerMobile" name="customerMobile" type="tel" class="form-control col-md-10 phoneNumber" maxlength="13">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="customerFAX" class="col-form-label col-md-2">FAX 번호</label>
                                        <input id="customerFAX" name="customerFAX" type="tel" class="form-control col-md-10 phoneNumber" maxlength="13" >
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="customerEmail" class="col-form-label col-md-2">이메일</label>
                                        <input id="customerEmail" name="customerEmail" class="form-control col-md-3">
                                        <span class="col-xs-1"><i class="fas fa-lg fa-fw m-r-10 fa-at"></i></span>
                                        <input id="email2" class="form-control col-md-3" >
                                        <input type="hidden" id="customerEmailDetail" name="customerEmailDetail" class="form-control col-md-3">
                                        <span class="col-xs-1"></span>
                                        <select id="selectEmail" class="form-control col-md-3" >
                                            <option value="direct">직접입력</option>
                                            <c:forEach items="${emailList}" var="email">
                                                <option value="${email.commonCodeNumber}">${email.commonCodeName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- 거래처 담당 --%>
                        <div class="card">
                            <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseTwo">거래처 담당</div>
                            <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="form-group row m-b-15">
                                        <label for="customerManager" class="col-form-label col-md-3">담당자</label>
                                        <input id="customerManager" name="customerManager" type="text" class="form-control col-md-8">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="customerManagerPhone" class="col-form-label col-md-3">담당자 전화번호</label>
                                        <input id="customerManagerPhone" name="customerManagerPhone" type="tel" class="form-control col-md-8 phoneNumber" maxlength="13">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="customerManagerMobile" class="col-form-label col-md-3">담당자 휴대전화번호</label>
                                        <input id="customerManagerMobile" name="customerManagerMobile" type="tel" class="form-control col-md-8 phoneNumber" maxlength="13">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="customerManagerEmail" class="col-form-label col-md-2">담당자이메일</label>
                                        <input id="customerManagerEmail" name="customerManagerEmail" class="form-control col-md-3">
                                        <span class="col-xs-1"><i class="fas fa-lg fa-fw m-r-10 fa-at"></i></span>
                                        <input id="email3" class="form-control col-md-3" >
                                        <input type="hidden" id="customerManagerEmailDetail" name="customerEmailDetail" class="form-control col-md-3">
                                        <span class="col-xs-1"></span>
                                        <select id="selectEmail3" class="form-control col-md-3" >
                                            <option value="direct">직접입력</option>
                                            <c:forEach items="${emailList}" var="email">
                                                <option value="${email.commonCodeNumber}">${email.commonCodeName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- 기타정보 정보 (비고) --%>
                        <div class="card">
                            <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseThree">기타정보</div>
                            <div id="collapseThree" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="form-group row m-b-15">
                                        <span class="col-md-5">비고</span>
                                        <label for="customerUsage" class="col-form-label col-md-3">사용구분</label>
                                        <select id="customerUsage" name="customerUsage" class="form-control col-md-3">
                                            <c:forEach items="${usageList}" var="use">
                                                <option value="${use.commonCodeNumber}">${use.commonCodeName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <textarea class="col-lg-12" id="customerNote" name="customerNote" cols="50" rows="10"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- 발주정보 --%>
            <div class="row">
                <%-- 주문마감/입고일수/격일배송/자동발주 --%>
                <div class="col-lg-6">
                    <div class="form-group row m-b-15">
                        <label for="deadline" class="col-form-label col-md-3">주문마감시간</label>
                        <input id="deadline" type="text" class="form-control col-md-9">
                    </div>
                    <div class="form-group row m-b-15">
                        <label for="customerStockCome" class="col-form-label col-md-3">주문마감시간</label>
                        <input id="customerStockCome" name="customerStockCome" type="text" class="form-control col-md-9">
                    </div>
                    <div class="form-group row m-b-15">
                        <input id="customerDeliveryEOD" name="customerDeliveryEOD" type="checkbox" class="form-control col-md-2" onchange="VerifyCheck(this)" value="N">
                        <label for="customerDeliveryEOD" class="col-form-label col-md-3">격일배송여부</label>
                        <input id="customerAutoOrder" name="customerAutoOrder" type="checkbox" class="form-control col-md-2" onchange="VerifyCheck(this)" value="N">
                        <label for="customerAutoOrder" class="col-form-label col-md-3">자동발주여부</label>
                    </div>
                </div>
                <%-- 배송요일 --%>
                <div class="col-lg-6">
                    <div class="note note-secondary m-b-15">
                        <h4>배송요일</h4>
                        <div class="row col-lg-12 m-b-15">
                            <input id="customerDeliveryMon" name="customerDeliveryMon" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                            <label for="customerDeliveryMon" class="col-form-label col-md-2 m-b-15">월요일</label>

                            <input id="customerDeliveryTue" name="customerDeliveryTue" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                            <label for="customerDeliveryTue" class="col-form-label col-md-2 m-b-15">화요일</label>

                            <input id="customerDeliveryWed" name="customerDeliveryWed" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                            <label for="customerDeliveryWed" class="col-form-label col-md-2 m-b-15">수요일</label>

                            <input id="customerDeliveryThu" name="customerDeliveryThu" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                            <label for="customerDeliveryThu" class="col-form-label col-md-2 m-b-15">목요일</label>

                            <input id="customerDeliveryFri" name="customerDeliveryFri" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                            <label for="customerDeliveryFri" class="col-form-label col-md-2 m-b-15">금요일</label>

                            <input id="customerDeliverySat" name="customerDeliverySat" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                            <label for="customerDeliverySat" class="col-form-label col-md-2 m-b-15">토요일</label>

                            <input id="customerDeliverySun" name="customerDeliverySun" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                            <label for="customerDeliverySun" class="col-form-label col-md-2 m-b-15" style="color: red">일요일</label>

                            <input id="customerDeliveryEvery" name="customerDeliveryEvery" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                            <label for="customerDeliveryEvery" class="col-form-label col-md-2 m-b-15" style="color: blue;">수시</label>
                        </div>
                    </div>
                </div>
            </div>
            <%-- 버튼 (저장/수정/삭제) --%>
            <div class="row">
                <div class="col-md-12 text-left">
                    <button class="btn btn-primary" id="saveBtn">저장</button>
                    <button class="btn btn-success" id="updateBtn">수정</button>
                    <button class="btn btn-danger" id="deleteBtn">삭제</button>
                </div>
            </div>
        </form><%-- 사업장 폼 끝 --%>

    </div>
</div>

<%-- 오른쪽에 있는 사이드바 --%>
<div class="theme-panel theme-panel-lg">
    <a href="javascript:;" data-click="theme-panel-expand" class="theme-collapse-btn">
        <i class="fa fa-angle-double-left"></i>
    </a>
    <div class="theme-panel-content">
        <div class="result-container">
            <div class="form-group row col-md-12 m-b-15">
                <div class="row col-md-6">
                    <label for="categorySelect" class="col-form-label col-md-4">운영구분</label>
                    <div class="col-md-8">
                        <select id="categorySelect" class="form-control col-md-8">
                            <option value="0">전체</option>
                            <c:forEach items="${catList}" var="cat">
                                <option value="${cat.commonCodeNumber}">${cat.commonCodeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row col-md-6">
                    <label for="usageSelect" class="col-form-label col-md-4">사용구분</label>
                    <div class="col-md-8">
                        <select id="usageSelect" class="form-control col-md-8">
                            <option value="0">전체</option>
                            <c:forEach items="${usageList}" var="us">
                                <option value="${us.commonCodeNumber}">${us.commonCodeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group row col-md-12 m-b-15">
                <div class="row col-md-6">
                    <label for="customerSelect" class="col-form-label col-md-4">거래처 구분</label>
                    <div class="col-md-8">
                        <select id="customerSelect" class="form-control col-md-8">
                            <option value="0">전체</option>
                            <c:forEach items="${categoryList}" var="category">
                                <option value="${category.commonCodeNumber}">${category.commonCodeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group row col-md-12 m-b-15">
                <label for="searchBizName" class="col-form-label col-md-2">사업장명</label>
                <input id="searchBizName" type="text" class="form-control col-md-8">
            </div>
            <div class="form-group row col-md-12 m-b-15">
                <label for="searchBrandName" class="col-form-label col-md-2">브랜드명</label>
                <input id="searchBrandName" type="text" class="form-control col-md-8">
            </div>
            <div class="form-group row col-md-12 m-b-15">
                <label for="searchCustomerName" class="col-form-label col-md-2">거래처명</label>
                <input id="searchCustomerName" type="text" class="form-control col-md-8">
                <div class="input-group-append">
                    <button id="searchCustomerBtn" type="button" class="btn btn-base">
                        <i class="fa fa-search fa-fw"></i> 검색
                    </button>
                </div>
            </div>
            <table id="sideTable" class="table table-bordered">
                <thead>
                <tr>
                    <th>사업장명</th>
                    <th>거래처명</th>
                    <th>구분</th>
                </tr>
                </thead>
                <tbody id="sideTableTBody">
                <c:forEach items="${customerList}" var="customer">
                    <tr>
                        <td><input type="hidden" value="${customer.customerSeq}">${customer.bizName}</td>
                        <td><input type="hidden" value="${customer.customerBizCode}">${customer.customerName}</td>
                        <td>${customer.bizAreaName}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div><%-- 오른쪽에 있는 사이드바 끝 --%>

<%-- 배송기사 삭제시 보이는 모달 창 --%>
<div class="modal fade" id="SearchModal" tabindex="-1" role="dialog" aria-labelledby="modalLabels" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-weight-bold text-primary" id="modalLabels">배송기사 검색</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fas fa-lg fa-fw m-r-10 fa-times"></i></span>
                </button>
            </div>
            <div class="modal-body text-gray-800">
                <div class="form-group row">
                    <label for="selector" class="col-form-label col-md-3">배송센터</label>
                    <select id="selector" class="form-control col-md-8">
                        <option value="0">전체</option>
                        <c:forEach items="${centerList}" var="center">
                            <option value="${center.centerCode}">${center.centerName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group">
                    <input type="text" name="keyword" class="form-control col-md-10" placeholder="기사명으로 검색해주세요">
                    <div class="input-group-append">
                        <button id="searchCourierBtn" type="button" class="btn btn-base">
                            <i class="fa fa-search fa-fw"></i> 검색
                        </button>
                    </div>
                </div>
                <hr>
                <div class="col-lg-12">
                    <table id="courierTable" class="table table-bordered">
                        <thead>
                        <tr>
                            <th>배송담당자</th>
                            <th>배송센터</th>
                            <th>핸드폰번호</th>
                        </tr>
                        </thead>
                        <tbody id="userBody">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $(document).ready(function() {
        $("#updateBtn").hide();
        $("#deleteBtn").hide();
        document.getElementById("customerDealStartDate").value = new Date().toISOString().substring(0, 10);
    });


    $("#formId").submit(function() {
        if($("#customerBizArea").val() == null || $("#customerBizArea").val() == ''){
            swal("입력오류", "거래처구분을 선택해주세요", "warning");
            $("#customerBizArea").focus();
            return false;
        }

        if($("#customerBizCode").val() == null || $("#customerBizCode").val() == ''){
            swal("입력오류", "사업장명을 선택해주세요", "warning");
            $("#customerBizCode").focus();
            return false;
        }

        if($("#customerName").val() == null || $("#customerName").val() == ''){
            swal("입력오류", "거래처명을 입력해주세요", "warning");
            $("#customerName").focus();
            return false;
        }

        if($("#customerCenterCode").val() == null || $("#customerCenterCode").val() == ''){
            swal("입력오류", "기본센터를 선택해주세요", "warning");
            $("#customerCenterCode").focus();
            return false;
        }

        if($("#customerSaleUnit").val() == null || $("#customerSaleUnit").val() == ''){
            swal("입력오류", "판매단가를 선택해주세요", "warning");
            $("#customerCenterCode").focus();
            return false;
        }

        // if($("#customerWebID").val() == null || $("#customerWebID").val() == ''){
        //     swal("입력오류", "아이디를 입력해주세요", "warning");
        //     $("#customerWebID").focus();
        //     return false;
        // }
        //
        // if($("#customerWebPW").val() == null || $("#customerWebPW").val() == ''){
        //     swal("입력오류", "비밀번호를 입력해주세요", "warning");
        //     $("#customerWebPW").focus();
        //     return false;
        // }

        if($("#customerBizArea option:selected").val() == 9){
            if($("#customerDeliveryManager").val() == null || $("#customerDeliveryManager").val() == ''){
                swal("입력오류", "배송담당자를 검색하여 선택해주세요", "warning");
                $("#customerCenterCode").focus();
                return false;
            }
        }

        if($("#selectEmail option:selected").val() == "direct"){
            $("#customerEmailDetail").val($("#email2").val());
        }else{
            $("#customerEmailDetail").val($("#selectEmail option:selected").val());
        }

        if($("#selectEmail3 option:selected").val() == "direct"){
            $("#customerManagerEmail").val($("#email3").val());
        }else{
            $("#customerManagerEmail").val($("#selectEmail3 option:selected").val());
        }
    })

    $("#updateBtn").click (function (e){
        let customerSeq = $("#customerSeq").val();
        let customerCode = $("#customerCode").val();
        $("#formId").attr("action", "${pageContext.request.contextPath}/updateCustomer");
        $("#formId").attr("method", "POST")
        $("#formId").append('<input type="hidden" name="customerSeq" value="'+customerSeq+'">');
        $("#formId").append('<input type="hidden" name="customerCode" value="'+customerCode+'">');
        $("#formId").submit();
    })

    $("#deleteBtn").click (function (e){
        let customerSeq = $("#customerSeq").val();

        $("#formId").attr("action", "${pageContext.request.contextPath}/deleteCustomer");
        $("#formId").attr("method", "POST")
        $("#formId").append('<input type="hidden" name="customerSeq" value="'+customerSeq+'">');
        $("#formId").submit();
    })

    // 전화번호 정규식 (자동 하이픈(-))
    $(document).on("keyup", ".phoneNumber", function() {
        $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
    });

    // 주민번호 정규식 (자동 하이픈(-))
    $(document).on("keyup", ".regiNum", function() {
        $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/^(\d{0,6})(\d{0,7})$/g, '$1-$2').replace(/-{1,2}$/g, ''));
    });

    // 사업자번호 정규식 (자동 하이픈(-))
    function business_num(str, id) {
        str = str.replace(/[^0-9]/g, '');
        let tmp = '';
        if( str.length < 4){
            $("#"+id).val(str);
        }else if(str.length < 6){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            $("#"+id).val(tmp);
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 2);
            tmp += '-';
            tmp += str.substr(5);
            $("#"+id).val(tmp);
        }
    }

    // 다음 주소찾기
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("customerAddress").value = extraAddr;

                } else {
                    document.getElementById("customerAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('customerPostCode').value = data.zonecode;
                document.getElementById("customerAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("customerAddressDetail").focus();
            }
        }).open();
    }

    // 셀렉에 있는 이메일
    $('#selectEmail').change(function(){
        $("#selectEmail option:selected").each(function () {
            if($(this).val()== 'direct'){            //직접입력일 경우
                $("#email2").val('');                //값 초기화
                $("#email2").attr("disabled",false); //활성화
            }else{ //직접입력이 아닐경우
                $("#email2").val($(this).text());    //선택값 입력
                $("#customerEmailDetail").val($(this).val());    //선택값 입력
                $("#email2").attr("disabled", true);  //비활성화
            }
        });
    });

    $('#selectEmail3').change(function(){
        $("#selectEmail3 option:selected").each(function () {
            if($(this).val()== 'direct'){            //직접입력일 경우
                $("#email3").val('');                //값 초기화
                $("#email3").attr("disabled",false); //활성화
            }else{ //직접입력이 아닐경우
                $("#email3").val($(this).text());    //선택값 입력
                $("#customerManagerEmailDetail").val($(this).val());    //선택값 입력
                $("#email3").attr("disabled", true);  //비활성화
            }
        });
    });

    // 모달창을 열어준다, 키보드는 사용할수없다
    function SearchModal(){
        $("#SearchModal").modal("show", {keyboard : false});
    }

    // checkbox가 checked이라면 'Y'값을 value로 주고
    // checked가 아닐라면 'N'값을 value에 건네준다
    function VerifyCheck(checkbox){
        let checked = checkbox.checked;

        if(checked){
            checkbox.value = 'Y';
        }else{
            checkbox.value = 'N';
        }
    }

    // 배송센터를 변경시, 테이블의 값을 변경한다
    $("#selector").change(function (){
        let select = $("#selector option:selected").val();
        console.log("here");
        $.ajax({
            url: "${pageContext.request.contextPath}/searchCenters",
            type: "POST",
            dataType : 'json',
            data : {"selector" : select},
            success : function (response) {
                let html = '';
                for(let i = 0; i < response.courierList.length;i++){
                    html += '<tr>';
                    html += "<td>"
                    html += '<input type="hidden" name="courierSeq" value="'+response.courierList[i].courierSeq+'"/>';
                    html += response.courierList[i].courierName+"</td>";                // 배송기사명
                    html += "<td>"+response.courierList[i].centerName+"</td>";          // 배송센터
                    html += "<td>"+response.courierList[i].courierMobile+"</td>";       // 배송기사 전화번호
                    html += '</tr>';
                }

                $("#userBody tr").remove();
                $("#userBody").append(html);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    });

    $("#searchCourierBtn").click(function (){
        let search = $("#searchBox").val();
        let selector = $("#selector option:selected").val();

        $("#center").val('');
        $("#deliveryManager").val('');
        $("#contact").val('');

        $.ajax({
            url: "${pageContext.request.contextPath}/searchTable",
            type: "POST",
            dataType : 'json',
            data : {"search" : search, "selector" : selector},
            success : function (response) {
                let html = '';
                for(let i = 0; i < response.courierList.length;i++){
                    html += '<tr>';
                    html += "<td>"
                    html += '<input type="hidden" name="courierSeq" value="'+response.courierList[i].courierSeq+'"/>';
                    html += response.courierList[i].courierName+"</td>";                // 배송기사명
                    html += "<td>"+response.courierList[i].centerName+"</td>";          // 배송센터
                    html += "<td>"+response.courierList[i].courierMobile+"</td>";       // 배송기사 전화번호
                    html += '</tr>';
                }

                $("#userBody tr").remove();
                $("#userBody").append(html);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    });

    // 동적으로 만들어진 테이블을 클릭시
    // 센터의 데이터를 가지고 있는 테이블에서 값을 가지고 와
    // 필요한 input에 값을 건네어준다
    $(document).on("click", "#courierTable tr:gt(0)", function (){
        let seq = $(this).find('td:eq(0) input').val();
        let coName = $(this).find("td:eq(0)").text();
        let centerName = $(this).find("td:eq(1)").text();
        let mobile = $(this).find("td:eq(2)").text();

        $("#center").val(centerName);
        $("#deliveryManager").val(coName);
        $("#contact").val(mobile);
        $("#customerDeliveryManager").val(seq);

        $("#SearchModal").modal("hide");
    });

    // 거래처 구분을 변경할 때 사업장명 변경
    // 거래처 구분을 변경시, 브랜드/센터도 리셋
    $("#customerBizArea").change(function (){
        let category = $("#customerBizArea option:selected").val();

        $.ajax({
            url: "${pageContext.request.contextPath}/selectBizArea",
            type: "POST",
            dataType : 'json',
            data : {"bizCategory" : category},
            success : function (response) {
                if($("#customerBizArea option:selected").val() == 9){
                    $("#customerBrandCode").prop("disabled", false);
                    $("#searchCenter").attr("href","javascript:SearchModal();");
                }else{
                    $("#searchCenter").removeAttr("href");
                    $("#center").prop("disabled", true);
                }
                $("#customerBizCode").prop("disabled", false);

                let html = '<option value="0" hidden>사업장명을 선택해주세요</option>';
                for(let i = 0; i < response.bizList.length;i++){
                   html += '<option value="'+response.bizList[i].bizCode+'">'+response.bizList[i].bizName+'</option>'
                }

                // $("#customerBrandCode option").remove();
                // $("#customerBrandCode").append('<option value="0" hidden>브랜드명을 선택해주세요</option>');

                // $("#customerCenterCode option").remove();
                // $("#customerCenterCode").append('<option value="0" hidden>센터를 선택해주세요</option>');

                $("#customerBizCode option").remove();
                $("#customerBizCode").append(html);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    })

    // 사업장명을 변경할때 브랜드명 변경
    // 브랜드 변경시, deadline을 리셋
    $("#customerBizCode").change(function (){
        let bizCode = $("#customerBizCode option:selected").val();

        $.ajax({
            url: "${pageContext.request.contextPath}/selectBizCode",
            type: "POST",
            dataType : 'json',
            data : {"bizCode" : bizCode},
            success : function (response) {
                $("#customerCenterCode").prop("disabled", false);

                let html = '<option value="0" hidden>브랜드명을 선택해주세요</option>';
                for(let i = 0; i < response.brandList.length;i++){
                    html += '<option value="'+response.brandList[i].brandCode+'">'+response.brandList[i].brandName+'</option>'
                }

                let center = '<option value="0" hidden>센터를 선택해주세요</option>'
                for(let i = 0; i < response.centerList.length;i++){
                    center += '<option value="'+response.centerList[i].centerCode+'">'+response.centerList[i].centerName+'</option>'
                }

                $("#deadline").val('');
                $("#customerBrandCode option").remove();
                $("#customerBrandCode").append(html);

                $("#customerCenterCode option").remove();
                $("#customerCenterCode").append(center);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    });

    // 브랜드를 선택시, 브랜드가 가지고 있는 마감시간을 id가 deadline 곳에 뿌려준다
    $("#customerBrandCode").change(function (){
        let brandCode = $("#customerBrandCode option:selected").val();

        $.ajax({
            url: "${pageContext.request.contextPath}/getEndTime",
            type: "POST",
            dataType : 'json',
            data : {"brandCode" : brandCode},
            success : function (response) {
                $("#deadline").val(response.endTime);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    })

    $("#customerCenterCode").change(function (){
        let centerCode = $("#customerCenterCode option:selected").val();

        $.ajax({
            url: "${pageContext.request.contextPath}/searchCenters",
            type: "POST",
            dataType : 'json',
            data : {"selector" : centerCode},
            success : function (response) {
                $("#customerDeliveryManager")
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    })

    // 거래처구분을 선택했을 때 일어나는 현상
    // 매입처 선택시, 결제구분/결제방법을 사용가능하게 브랜드는 사용불가능하게
    // 매출처 선택시, 결제구분/결제방법을 사용불가능하게 브랜드는 사용가능하게 만든다
    $("#customerBizArea").change(function (){
       if($("#customerBizArea option:selected").val() == 8){
           $("#customerPayCategory").prop("disabled", false);
           $("#customerPayMethod").prop("disabled", false);
           $("#customerBrandCode").prop("disabled", true);
       }else{
           $("#customerPayCategory").prop("disabled", true);
           $("#customerPayMethod").prop("disabled", true);
           $("#customerBrandCode").prop("disabled", false);
       }
    });

    $("#searchCustomerBtn").click(function () {
        let customerName = $("#searchCustomerName").val();
        let brandName = $("#searchBrandName").val();
        let bizName = $("#searchBizName").val();
        let selectUse = $("#usageSelect option:selected").val();
        let selectCat = $("#categorySelect option:selected").val();
        let selectBizArea = $("#customerSelect option:selected").val();

        $.ajax({
            url: "${pageContext.request.contextPath}/searchSidebar",
            type: "POST",
            dataType : 'json',
            data : {"customerName" : customerName, "brandName" : brandName, "bizName" : bizName,
                "selectUse" : selectUse, "selectCat" : selectCat, "selectBizArea" : selectBizArea},
            success : function (response) {
                let html = '';
                for(let i = 0; i < response.customerList.length;i++){
                    html += '<tr>';
                    html += "<td>"
                    html += '<input type="hidden" value="'+response.customerList[i].customerSeq+'"/>';
                    html += response.customerList[i].bizName+"</td>";
                    html += "<td>"
                    html += '<input type="hidden" value="'+response.customerList[i].customerBizCode+'"/>';
                    html += response.customerList[i].customerName+"</td>";
                    html += "<td>"+response.customerList[i].bizAreaName+"</td>";
                    html += '</tr>';
                }

                $("#sideTableTBody tr").remove();
                $("#sideTableTBody").append(html)
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    })

    $(document).on("click","#sideTable tr:gt(0)",function (){
        let customerSeq = $(this).find('td:eq(0) input').val();

        $.ajax({
            url: "${pageContext.request.contextPath}/customerView",
            type: "POST",
            dataType : 'json',
            data : {"customerSeq" : customerSeq},
            success : function (response) {
                $("#customerBizCode").prop("disabled", false);
                $("#customerCenterCode").prop("disabled", false);

                if(response.customerList.customerBizArea == 9){
                    $("#customerBrandCode").prop("disabled", false);
                }

                $("#customerSeq").val(response.customerList.customerSeq);
                $("#customerCode").val(response.customerList.customerCode);
                $("#customerName").val(response.customerList.customerName);
                $("#customerBizCEO").val(response.customerList.customerName);
                $("#customerBizNumber").val(response.customerList.customerBizNumber);
                $("#customerJuMinNumber").val(response.customerList.customerJuMinNumber);
                $("#customerBizType").val(response.customerList.customerBizType);
                $("#customerBizItem").val(response.customerList.customerBizItem);
                $("#customerSName").val(response.customerList.customerSName);
                $("#customerPostCode").val(response.customerList.customerPostCode);
                $("#customerAddress").val(response.customerList.customerAddress);
                $("#customerAddressDetail").val(response.customerList.customerAddressDetail);
                $("#customerDeliveryManager").val(response.customerList.customerDeliveryManager);
                $("#customerBankAccount").val(response.customerList.customerBankAccount);
                $("#customerBankNominee").val(response.customerList.customerBankNominee);
                $("#customerVirtualBank").val(response.customerList.customerVirtualBank);
                $("#customerVirtualBankAccount").val(response.customerList.customerVirtualBankAccount);
                $("#customerVirtualBankNominee").val(response.customerList.customerVirtualBankNominee);
                $("#customerVirtualBankDeposit").val(response.customerList.customerVirtualBankDeposit);
                $("#customerGuaranteeNumber").val(response.customerList.customerGuaranteeNumber);
                $("#customerGuaranteeAmount").val(response.customerList.customerGuaranteeAmount);
                $("#customerGuaranteeStartDate").val(response.customerList.customerGuaranteeStartDate);
                $("#customerGuaranteeEndDate").val(response.customerList.customerGuaranteeEndDate);
                $("#customerGuaranteeBondAmount").val(response.customerList.customerGuaranteeBondAmount);
                $("#customerWebID").val(response.customerList.customerWebID);
                $("#customerWebPW").val(response.customerList.customerWebPW);
                $("#customerDealStartDate").val(response.customerList.customerDealStartDate);
                $("#customerDealEndDate").val(response.customerList.customerDealEndDate);
                $("#customerPhone").val(response.customerList.customerPhone);
                $("#customerMobile").val(response.customerList.customerMobile);
                $("#customerFAX").val(response.customerList.customerFAX);
                $("#customerEmail").val(response.customerList.customerEmail);
                $("#customerEmailDetail").val(response.customerList.customerEmailDetail);
                $("#customerManager").val(response.customerList.customerManager);
                $("#customerManagerPhone").val(response.customerList.customerManagerPhone);
                $("#customerManagerMobile").val(response.customerList.customerManagerMobile);
                $("#customerManagerEmail").val(response.customerList.customerManagerEmail);
                $("#customerManagerEmailDetail").val(response.customerList.customerManagerEmailDetail);
                $("#customerStockCome").val(response.customerList.customerStockCome);
                $("#customerNote").val(response.customerList.customerNote);
                $("#center").val(response.customerList.centerName);
                $("#deadline").val(response.customerList.brandDeadline);
                $("#contact").val(response.customerList.courierMobile);
                $("#deliveryManager").val(response.customerList.courierName);

                // 사용여부
                $("#customerUsage option").each(function (){
                    if(this.value == response.customerList.customerUsage){
                        $("#customerUsage option[value="+response.customerList.customerUsage+"]").attr('selected',true);
                    }
                })

                // 센터 선택
                $("#customerCenterCode option").each(function (){
                    if(this.value == response.customerList.customerCenterCode){
                        $("#customerCenterCode option[value="+response.customerList.customerCenterCode+"]").attr('selected',true);
                    }
                })

                // 거래처구분 선택
                $("#customerBizArea option").each(function (){
                    if(this.value == response.customerList.customerBizArea){
                        $("#customerBizArea option[value="+response.customerList.customerBizArea+"]").attr('selected',true);
                        // $("#customerBizArea").val(response.customerList.customerBizArea).trigger('change');
                    }
                })

                // 사업장 선택
                $("#customerBizCode option").each(function (){
                    if(this.value == response.customerList.customerBizCode){
                        $("#customerBizCode option[value="+response.customerList.customerBizCode+"]").attr('selected',true);
                        // $("#customerBizCode").val(response.customerList.customerBizCode).trigger('change');
                    }
                })

                // 브랜드 선택
                $("#customerBrandCode option").each(function (){
                    if(this.value == response.customerList.customerBrandCode){
                        $("#customerBrandCode option[value="+response.customerList.customerBrandCode+"]").attr('selected',true);
                    }
                })

                // 결재구분 선택
                $("#customerPayCategory option").each(function (){
                    if(this.value == response.customerList.customerPayCategory){
                        $("#customerPayCategory option[value="+response.customerList.customerPayCategory+"]").attr('selected',true);
                    }
                })

                // 결재방법 선택
                $("#customerBank option").each(function (){
                    if(this.value == response.customerList.customerBank){
                        $("#customerPayMethod option[value="+response.customerList.customerBank+"]").attr('selected',true);
                    }
                })

                // 담보종류 선택
                $("#customerGuaranteeType option").each(function (){
                    if(this.value == response.customerList.customerGuaranteeType){
                        $("#customerPayMethod option[value="+response.customerList.customerGuaranteeType+"]").attr('selected',true);
                    }
                })

                // 판매단가 선택
                $("#customerSaleUnit option").each(function (){
                    if(this.value == response.customerList.customerSaleUnit){
                        $("#customerPayMethod option[value="+response.customerList.customerSaleUnit+"]").attr('selected',true);
                    }
                })

                // DC율 선택
                $("#customerDiscount option").each(function (){
                    if(this.value == response.customerList.customerDiscount){
                        $("#customerPayMethod option[value="+response.customerList.customerDiscount+"]").attr('selected',true);
                    }
                })

                // 이메일
                $("#selectEmail option").each(function (){
                    if(this.value == response.customerList.customerEmailDetail){
                        $("#selectEmail option[value="+response.customerList.customerEmailDetail+"]").attr('selected',true);
                        $("#email2").val($("#selectEmail option[value="+response.customerList.customerEmailDetail+"]").text());
                    }
                })

                if($("#selectEmail option[value='direct']").val() == true){
                    $("#customerEmailDetail").val(customerList.customerList.customerEmailDetail);
                    $("#email2").val(response.customerList.customerEmailDetail);
                    $("#selectEmail option[value='direct']").attr('selected', true);
                }

                $("#selectEmail3 option").each(function (){
                    if(this.value == response.customerList.customerManagerEmail){
                        $("#selectEmail3 option[value="+response.customerList.customerManagerEmail+"]").attr('selected',true);
                        $("#email3").val($("#selectEmail option[value="+response.customerList.customerManagerEmail+"]").text());
                    }
                })

                if($("#selectEmail3 option[value='direct']").val() == true){
                    $("#customerManagerEmail").val(response.customerList.customerManagerEmail);
                    $("#email3").val(response.customerList.customerManagerEmail);
                    $("#selectEmail3 option[value='direct']").attr('selected', true);
                }

                if(response.customerList.customerGuaranteeBondLimit == "Y"){$("#customerGuaranteeBondLimit").prop("checked", true);$("#customerGuaranteeBondLimit").val('Y');}
                if(response.customerList.customerAutoOrder == "Y"){$("#customerAutoOrder").prop("checked", true);$("#customerAutoOrder").val('Y');}
                if(response.customerList.customerDeliveryEOD == "Y"){$("#customerDeliveryEOD").prop("checked", true);$("#customerDeliveryEOD").val('Y');}
                if(response.customerList.customerDeliveryMon == "Y"){$("#customerDeliveryMon").prop("checked", true);$("#customerDeliveryMon").val('Y');}
                if(response.customerList.customerDeliveryTue == "Y"){$("#customerDeliveryTue").prop("checked", true);$("#customerDeliveryTue").val('Y');}
                if(response.customerList.customerDeliveryWed == "Y"){$("#customerDeliveryWed").prop("checked", true);$("#customerDeliveryWed").val('Y');}
                if(response.customerList.customerDeliveryThu == "Y"){$("#customerDeliveryThu").prop("checked", true);$("#customerDeliveryThu").val('Y');}
                if(response.customerList.customerDeliveryFri == "Y"){$("#customerDeliveryFri").prop("checked", true);$("#customerDeliveryFri").val('Y');}
                if(response.customerList.customerDeliverySat == "Y"){$("#customerDeliverySat").prop("checked", true);$("#customerDeliverySat").val('Y');}
                if(response.customerList.customerDeliverySun == "Y"){$("#customerDeliverySun").prop("checked", true);$("#customerDeliverySun").val('Y');}
                if(response.customerList.customerDeliveryEvery == "Y"){$("#customerDeliveryEvery").prop("checked", true);$("#customerDeliveryEvery").val('Y');}

                $("#updateBtn").show();
                $("#deleteBtn").show();
                $("#saveBtn").hide();
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    });
</script>