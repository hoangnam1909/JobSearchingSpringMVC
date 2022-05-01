<%-- 
    Document   : admin-header
    Created on : Apr 6, 2022, 10:33:24 PM
    Author     : Lightning
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <!-- Brand -->
    <a class="navbar-brand" href="<c:url value="/"/> ">Job Search</a>

    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar links -->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/" />">Trang chủ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/admin/account"/> ">Tài khoản</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/admin/account-permission"/> ">Duyệt NTD</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/admin/job-post"/> ">Bài viết</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/admin/company"/> ">Công ty</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/admin/job-type"/> ">Loại việc làm</a>
            </li>
        </ul>
    </div>
    <c:if test="${currentUser != null}">
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/" />">
                            <span>
                                <i class="fa-solid fa-user"></i>
                            </span>
                        ${currentUser.username}
                    <span class="badge badge-secondary">${currentUser.userType}</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/logout" />">
                    Đăng xuất
                </a>
            </li>
        </ul>
    </c:if>
</nav>
