<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Begin Page Content -->
<style type="text/css">
	#claimTop{
    }
    .claimTh{
        padding-left: 1rem;
    }
    .claimImg{
        position: relative;
        width: 25px;
        height: 25px;
    }
</style>
<div class="panel panel-inverse">
    <div class="panel-heading">
        <h4 class="panel-title">클레임 게시판</h4>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-12 text-right">
                <a class="btn btn-primary float-right" id="write" href="${pageContext.request.contextPath}/writeClaim">글쓰기</a>
            </div>
        </div>
<div class="serchtable" id="claimTop">
					<table summary="클레임조회" cellspacing="0" cellpadding="0" border="0">
						<colgroup>
							<col width="8%">
							<col width="*">
							<col width="8%">
							<col width="42%">
						</colgroup>
						<tbody>
							<tr>
								<th class="claimTh">조회일자</th>
								<td class="bgadd">
									<input type="text" name="from_date" id="from_date" value="2023-03-01" readonly="readonly" class="hasDatepicker">
									~
									<input type="text" name="to_date" id="to_date" value="2023-03-17" readonly="readonly" class="hasDatepicker">
								</td>
								<th class="claimTh">사유구분</th>
								<td class="bgadd">
									<select name="srh_claim_gb" id="srh_claim_gb">
						 				<option value="">:선택:</option>

											<option value="0001">오주문</option>

											<option value="0002">오수주</option>

											<option value="0003">미배송/오배송</option>

											<option value="0005">상품불만</option>

											<option value="0006">배송서비스불만</option>

											<option value="0007">기타</option>

									</select>
								</td>
							</tr>
							<tr>
								<th class="claimTh">처리구분</th>
								<td class="bgadd">
									<select name="srh_proc_gb" id="srh_proc_gb">
						 				<option value="">:선택:</option>

											<option value="0001">미처리</option>

											<option value="0002">처리중</option>

											<option value="0003">처리완료</option>

									</select>
								</td>
								<th class="claimTh">조건</th>
								<td class="bgadd">
									<select name="column" id="column">
										<option value="title">제목</option>
										<option value="content">내용</option>
									</select>
									<input type="text" name="search_string" id="search_string" value="">
									<input type="button" value="검색">
								</td>
							</tr>
						</tbody>
					</table>

				</div>
        <div id="data-table-default_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
            <table id="dataTable2" class="table table-striped table-bordered dataTable no-footer dtr-inline collapsed"
                   role="grid" aria-describedby="data-table-default_info">
                <thead>
                <tr role="row">
                    <th width="1%">No.</th>
                    <th width="10%">등록일자</th>
                    <th width="5%">사진</th>
                    <th width="8%">사유</th>
                    <th width="8%">작성자</th>
                    <th>제목</th>
                    <th width="8%">처리유무</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cla"  items="${claimList}">
                    <tr onclick="location.href='/viewClaim?claSeq=${cla.claSeq}'">
                        <td width="1%">
                            <input type="hidden" name="claSeq" id="claSeq"  value="${cla.claSeq}">
                                ${cla.claSeq}
                        </td>
                        <td width="10%">${cla.claRegiDate}</td>
                        <td width="5%" ><img class="claimImg" src="${cla.claImgPath}"></td>
                        <td width="8%">${cla.claReason}</td>
                        <td width="8%">${cla.claRegi}</td>
                        <td>${cla.claTitle}</td>
                        <td width="8%">${cla.claStatus}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function click(){
            alert("하이");
        }

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
        $('#dataTable2').DataTable( {
            language : lang_kor,
            searching : false,
            lengthChange: false
        });
    });

    /*    $(function (){
            $('#dataTable2 tr:gt(0)').click(function() {
                let fbSeq = $(this).find('td:eq(0) input').val();
                location.href = "/fbViewList?fbSeq="+fbSeq;
            });
        });
    */
</script>