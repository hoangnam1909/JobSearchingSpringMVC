<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-success">THÊM TÀI KHOẢN</h1>

<c:url value="/admin/account/add" var="action"/>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
            ${errMsg}
    </div>
</c:if>

<form:form action="${action}" method="post" enctype="multipart/form-data" modelAttribute="user">
    <div class="form-group">
        <label>Tên đăng nhập <span style="color: red">*</span></label>
        <form:input path="username" class="form-control" required="required"/>
    </div>
    <div class="form-group">
        <label>Mật khẩu <span style="color: red">*</span></label>
        <form:input path="password" class="form-control" type="password" required="required"/>
    </div>
    <div class="form-group">
        <label>Nhập lại mật khẩu <span style="color: red">*</span></label>
        <form:input path="confirmPassword" class="form-control" type="password" required="required"/>
    </div>
    <div class="form-group">
        <label>Email</label>
        <form:input path="email" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Số điện thoại</label>
        <form:input path="phone" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Ảnh đại diện</label>
        <form:input type="file" path="file" accept="image/*"
                    class="form-control" required="required"/>
    </div>
    <div class="form-group">
        <label>Họ và tên</label>
        <form:input path="fullName" class="form-control"/>
    </div>
    <div class="input-group input-group-static mb-4 d-flex flex-column">
        <label>Ngày sinh (Ngày/Tháng/Năm)</label>
        <div class="d-flex flex-row align-items-center">
            <form:input path="day" class="form-control" id="dobDay"
                        placeholder="Ngày" type="number" required="required"/>
            <span class="mx-2">/</span>
            <form:input path="month" class="form-control" id="dobMonth"
                        placeholder="Tháng" type="number" required="required"/>
            <span class="mx-2">/</span>
            <form:input path="year" class="form-control" id="dobYear"
                        placeholder="Năm" type="number" required="required"/>
        </div>
    </div>
    <div class="form-group">
        <label>Địa chỉ</label>
        <form:input path="address" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Giới tính</label>
        <form:select path="gender" class="custom-select">
            <option value="0" selected>Nam</option>
            <option value="1">Nữ</option>
        </form:select>
    </div>
    <div class="form-group">
        <label>Kích hoạt <span style="color: red">*</span></label>
        <form:select path="active" class="custom-select">
            <option value="0" selected>Disable</option>
            <option value="1">Enable</option>
        </form:select>
    </div>
    <div class="form-group">
        <label>UserType <span style="color: red">*</span></label>
        <form:select path="userType" class="custom-select">
            <option value="ROLE_USER" selected>Ứng viên</option>
            <option value="ROLE_NTD">Nhà tuyển dụng</option>
            <option value="ROLE_ADMIN">Admin</option>
        </form:select>
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Thêm</button>
    </div>
</form:form>
