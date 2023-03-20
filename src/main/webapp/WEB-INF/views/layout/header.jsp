<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="header" class="header navbar-default">
    <div class="nav-header">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
            <img src="${pageContext.request.contextPath}/resources/image/whizlabLogoN.png"/>
            <b>WhizLab</b>
        </a>
    </div>
    <ul class="navbar-nav navbar-right">
        <li>
            <a id="signUp" class="btn btn-success btn-large btn-block" href="${pageContext.request.contextPath}/signUp">회원등록</a>
        </li>
        <li class="dropdown navbar-user">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                <span class="d-none d-md-inline">${loginInfo.customerName}</span>
                <b class="caret"></b>
            </a>
            <div class="dropdown-menu dropdown-menu-right" x-placement="bottom-end"
                 style="position: absolute; transform: translate3d(4px, 50px, 0px); top: 0px; left: 0px; will-change: transform;">
                <a class="dropdown-item" href="javascript:logout();" id="logout">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>로그아웃
                </a>
            </div>
        </li>
    </ul>
</div>
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-weight-bold text-primary" id="exampleModalLabel">로그아웃</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-gray-800">
                로그아웃하시겠습니까?
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/logout">로그아웃</a>
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
<script>
    function logout(){
        $("#logoutModal").modal("show");
    }
</script>
                
	<!-- Logout Modal-->
