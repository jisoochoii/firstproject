<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Page Content -->
<div class="panel panel-inverse">
    <!-- Page Heading -->
    <div class="panel-heading">
        <h4 class="panel-title">썸네일 게시판</h4>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-12 text-right">
                <a class="btn btn-success" href="${pageContext.request.contextPath}/writeTnb">게시글 작성</a>
            </div>
        </div>
        <%-- 검색창 --%>
        <form method="post" action="${pageContext.request.contextPath}/tnb">
            <div class="row">
                <div class="col-lg-12">
                    <div class="result-container">
                        <div class="input-group input-group-lg m-b-20">
                            <select class="form-control-lg col-md-3" id="search-select" name="condition">
                                <option value="title" ${pc.paging.condition == 'title ' ? 'selected' : ''}>제목</option>
                                <option value="content" ${pc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
                                <option value="writer" ${pc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
                            </select>
                            <input type="text" name="keyword" class="form-control col-md-9" value="${pc.paging.keyword}">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-base">
                                    <i class="fa fa-search fa-fw"></i> 검색
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    <%--  9개만 보이게  --%>
        <div id="gallery" class="gallery isotope">
        <c:forEach var="tnb" items="${tnbList}">
            <div class="image gallery-group-1 isotope-item">
                <div class="image-inner">
                    <a href="/tnbView?tnbSeq=${tnb.tnbSeq}">
                    <c:choose>
                        <c:when test="${tnb.tnbImagePath eq null}">
                            <img src="${pageContext.request.contextPath}/image/no-image.png" alt="">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/image/${tnb.tnbImagePath}" alt="">
                        </c:otherwise>
                    </c:choose>
                    </a>
                </div>
                <div class="image-info">
                    <h3>${tnb.tnbTitle}</h3>
                    <div class="row">
                        <div class="col-md-6 text-left"><b>수정자</b> : ${tnb.tnbEdit}</div>
                        <div class="col-md-6 text-right"><b>작성자</b> : ${tnb.tnbRegister}</div>
                    </div>
                    <div class="desc">${tnb.tnbContent}</div>
                </div>
            </div>
<%--        <div class="col-lg-4 col-sm-6 mb-4">--%>
<%--            <div class="card h-100">--%>
<%--                <a href="/tnbView?tnbSeq=${tnb.tnbSeq}">--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${tnb.tnbImagePath eq null}">--%>
<%--                            <img style="height: 250px;" class="card-img-top" src="${pageContext.request.contextPath}/image/no-image.png" alt="">--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <img style="height: 250px;" class="card-img-top" src="${pageContext.request.contextPath}/image/${tnb.tnbImagePath}" alt="">--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                </a>--%>
<%--                <hr clas="sidebar-divider">--%>
<%--                <div class="card-body">--%>
<%--                    <h4 class="card-title">--%>
<%--                        <a href="/tnbView?tnbSeq=${tnb.tnbSeq}">${tnb.tnbTitle}</a>--%>
<%--                    </h4>--%>
<%--                    <p class="card-text" id="card">${tnb.tnbContent}</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <div class="card-text">--%>
<%--                        <p class="text-sm-left">수정자 : ${tnb.tnbEdit}</p>--%>
<%--                        <p class="text-sm-left">작성자 : ${tnb.tnbRegister}</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        </c:forEach>

    </div>
    <!-- /.row -->

    <!-- Pagination -->
        <div class="paging">
            <form action="${pageContext.request.contextPath}/tnb" name="pageForm">
                <div class="text-center clearfix">
                    <ul class="pagination" id="pagination" style="text-align: center">
                    <c:if test="${pc.prev}">
                        <li class="page-item "><a  class="page-link" href="#" data-pageNum="${pc.beginPage-1}">Prev</a></li>
                    </c:if>

                    <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
                        <li class="${pc.paging.pageNum == num ? 'age-item active' : ''}" page-item><a class="page-link" href="#" data-pageNum="${num}">${num}</a></li>
                    </c:forEach>

                    <c:if test="${pc.next}">
                        <li class="page-item"><a class="page-link" href="#" data-pageNum="${pc.endPage+1}">Next</a></li>
                    </c:if>
                </ul>

                <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
                <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                <input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
                <input type="hidden" name="keyword" value="${pc.paging.keyword}">
                <input type="hidden" name="condition" value="${pc.paging.condition}">

            </div>
        </form>
    </div>
    </div>
</div>
<!-- /.container -->
<script>
    $('#pagination').on('click', 'a', function(e) {
        e.preventDefault();
        console.log($(this));
        const value = $(this).data('pagenum');
        console.log(value);
        document.pageForm.pageNum.value = value;
        document.pageForm.submit();
    });
</script>
