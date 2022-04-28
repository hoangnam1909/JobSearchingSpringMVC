<%--
  Created by IntelliJ IDEA.
  User: Lightning
  Date: 10/04/2022
  Time: 3:19 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="text-center text-success">CHỈNH SỬA THÔNG TIN TÀI KHOẢN</h1>

<c:url value="/admin/account/edit" var="action"/>

<form:form action="${action}" method="post" modelAttribute="user">
    <div class="form-group" style="display: none">
        <form:input path="id" class="form-control" placeholder="${user.id}"/>
    </div>
    <div class="form-group">
        <label>Tên đăng nhập <span style="color: red">*</span></label>
        <form:input path="username" class="form-control" required="required"/>
    </div>
    <div class="form-group">
        <label>Mật khẩu <span style="color: red">*</span></label>
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
        <form:input type="file" onchange="loadFile(event)" path="file" accept="image/*" class="form-control-file"/>
        <c:if test="${user.avatar != null}">
            <img id="output" src="<c:url value="${user.avatar}"/>" style="height: 200px; margin-top: 10px;"
                 class="img-fluid rounded">
        </c:if>
    </div>
    <div class="form-group">
        <label>Họ và tên</label>
        <form:input path="fullName" class="form-control"/>
    </div>
    <div class="input-group input-group-static mb-4 d-flex flex-column">
        <label>Ngày sinh (Ngày/Tháng/Năm)</label>
        <div class="d-flex flex-row align-items-center">
            <form:input path="day" value="${user.dob.date}" class="form-control" placeholder="Ngày" type="number"/>
            <span class="mx-2">/</span>
            <form:input path="month" value="${user.dob.month + 1}" class="form-control" placeholder="Tháng"
                        type="number"/>
            <span class="mx-2">/</span>
            <fmt:formatDate pattern="yyyy" value="${user.dob}" var="currentYear"/>
            <form:input path="year" value="${currentYear}" class="form-control" placeholder="Năm" type="number"/>
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
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </div>
</form:form>
