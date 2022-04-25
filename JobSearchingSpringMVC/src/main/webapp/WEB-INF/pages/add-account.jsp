<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-success">THÊM TÀI KHOẢN</h1>
<h1 class="text-center text-success">username</h1>

<c:url value="/admin/account/add" var="action" />

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
            ${errMsg}
    </div>
</c:if>

<form:form action="${action}" method="post" modelAttribute="user">
    <div class="form-group">
        <label>Tên đăng nhập</label>
        <form:input path="username" class="form-control" />
    </div>
    <div class="form-group">
        <label>Mật khẩu</label>
        <form:input path="password" class="form-control" type="password" />
    </div>
    <div class="form-group">
        <label>Nhập lại mật khẩu</label>
        <form:input path="confirmPassword" class="form-control" type="password" />
    </div>
    <div class="form-group">
        <label>Email</label>
        <form:input path="email" class="form-control" />
    </div>
    <div class="form-group">
        <label>Số điện thoại</label>
        <form:input path="phone" class="form-control" />
    </div>
    <div class="form-group">
        <label>UserType</label>
        <form:input path="userType" class="form-control" />
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Thêm</button>
    </div>
</form:form>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger" role="alert">
            ${errMsg}
    </div>
</c:if>
