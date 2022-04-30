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

<h1 class="text-center text-success">THÔNG TIN TÀI KHOẢN</h1>

<div class="container mt-4">
    <table class="table table-striped">
        <tbody>
        <tr>
            <th style="width: 30%" scope="row">Tên đăng nhập</th>
            <td class="border-left">${user.username}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Email</th>
            <td class="border-left">${user.email}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Số điện thoại</th>
            <td class="border-left">${user.phone}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Ảnh đại diện</th>
            <td class="border-left">
                <c:if test="${user.avatar.length() != 0}">
                    <img src="<c:url value="${user.avatar}"/>" style="height: 100px"
                         class="img-fluid rounded" alt="avatar">
                </c:if>
                <c:if test="${user.avatar.length() == 0}">
                    Không có ảnh đại diện
                </c:if>
            </td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Họ và tên</th>
            <td class="border-left">${user.fullName}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Ngày sinh</th>
            <td class="border-left">
                <fmt:formatDate pattern="dd/MM/yyyy" value="${user.dob}"/>
            </td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Địa chỉ</th>
            <td class="border-left">${user.address}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Giới tính</th>
            <c:if test="${user.gender == 0}">
                <c:set var="gender" value="Nam"/>
            </c:if>
            <c:if test="${user.gender == 1}">
                <c:set var="gender" value="Nữ"/>
            </c:if>
            <td class="border-left">${gender}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Trạng thái</th>
            <c:if test="${user.active == 0}">
                <c:set var="active" value="Chưa kích hoạt"/>
            </c:if>
            <c:if test="${user.active == 1}">
                <c:set var="active" value="Đã kích hoạt"/>
            </c:if>
            <td class="border-left">${active}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Loại tài khoản</th>
            <td class="border-left">${user.userType}</td>
        </tr>
        </tbody>
    </table>
</div>
