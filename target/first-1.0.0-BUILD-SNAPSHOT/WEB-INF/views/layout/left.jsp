<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!-- Sidebar -->
<div id="sidebar" class="sidebar">
    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
        <div data-scrollbar="true" data-height="100%" data-init="true" style="overflow: hidden; width: auto; height: 100%;">
            <ul class="nav">
                <!-- Sidebar - Brand -->
                <li class="nav-header">
                    메뉴
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/fbList">
                        <span>게시판</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/tnb">
                        <span>썸네일</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/group">
                        <span>그룹</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/auth">
                        <span>권한</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/menu">
                        <span>메뉴</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/biz">
                        <span>사업장관리</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/center">
                        <span>창고관리</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/courier">
                        <span>배송기사</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/customer">
                        <span>거래처</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/product">
                        <span>상품</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/cc">
                        <span>공통코드</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify">
                        <i class="fa fa-angle-double-left"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- End of Sidebar -->