<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Begin Page Content -->
<div class="panel panel-inverse">
    <div class="panel-heading">
        <h4 class="panel-title">사업장관리 리스트</h4>
    </div>
    <div class="panel-body ">
        <div class="row">
            <div class="col-md-12 text-right">
                <a class="btn btn-primary float-right" id="write" href="${pageContext.request.contextPath}/writeBiz">사업장 추가</a>
            </div>
        </div>
        <div id="data-table-default_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
            <table id="dataTable1" class="table table-striped table-bordered dataTable no-footer dtr-inline collapsed">
                <thead>
                <tr>
                    <th>No.</th>
                    <th>운영구분</th>
                    <th>사업장명</th>
                    <th>대표자</th>
                    <th>업태</th>
                    <th>종목</th>
                    <th>주소</th>
                    <th>상세주소</th>
                    <th>전화번호</th>
                    <th>휴대전화번호</th>
                    <th>FAX</th>
                    <th>이메일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="biz" items="${bizList}">
                    <tr>
                        <td>${biz.bizSeq}</td>
                        <td>${biz.catCommon}</td>
                        <td>${biz.bizName}</td>
                        <td>${biz.bizCEO}</td>
                        <td>${biz.bizStatus}</td>
                        <td>${biz.bizItem}</td>
                        <td>${biz.bizAddress}</td>
                        <td>${biz.bizAddressDetail}</td>
                        <td>${biz.bizPhone}</td>
                        <td>${biz.bizMobile}</td>
                        <td>${biz.bizFAX}</td>
                        <c:choose>
                            <c:when test="${biz.bizEmail == null || biz.bizEmail == ''}">
                                <td></td>
                            </c:when>
                            <c:otherwise>
                                <td>${biz.bizEmail}@${biz.emailCommon}</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<script>
    let lang_kor = {
        "decimal" : "",
        "emptyTable" : "데이터가 없습니다.",
        "info" : "_START_ - _END_ (총 _TOTAL_ 건)",
        "infoEmpty" : "0건",
        "infoFiltered" : "(전체 _MAX_ 건 중 검색결과)",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "_MENU_ 개씩 보기",
        "loadingRecords" : "로딩중...",
        "processing" : "처리중...",
        "search" : "검색 : ",
        "zeroRecords" : "검색된 데이터가 없습니다.",
        "paginate" : {
            "first" : "첫 페이지",
            "last" : "마지막 페이지",
            "next" : "다음",
            "previous" : "이전"
        },
        "aria" : {
            "sortAscending" : " :  오름차순 정렬",
            "sortDescending" : " :  내림차순 정렬"
        }
    };

    // dataTable을 한글화 한다
    $(document).ready(function() {
        $('#dataTable1').DataTable( {
            language : lang_kor
        });
    });

    $(function (){
        $('#dataTable1 tr:gt(0)').click(function() {
            let bizSeq = $(this).find('td:eq(0)').text();
            location.href = "${pageContext.request.contextPath}/editBiz?bizSeq="+bizSeq;
        });
    });
</script>
