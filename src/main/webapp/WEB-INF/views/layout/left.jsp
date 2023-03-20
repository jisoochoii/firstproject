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
                        <span>공지사항</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/tnb">
                        <span>클레임</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/jsNotice">
                        <span>지수공지사항</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/claimBoard">
                        <span>지수클레임</span>
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