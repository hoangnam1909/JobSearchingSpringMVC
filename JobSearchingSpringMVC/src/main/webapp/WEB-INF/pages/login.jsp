<%-- 
    Document   : login
    Created on : Apr 6, 2022, 8:52:21 PM
    Author     : Lightning
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/login" var="action" />

<h1 class="text-center text-success">ĐĂNG NHẬP HỆ THỐNG</h1>

<c:if test="${param.error != null}">
  <div class="alert alert-danger">
    <strong>CÓ LỖI XẢY RA</strong> Vui lòng thử lại.
  </div>
</c:if>

<form method="post" action="${action}">
  <div class="form-group">
    <label>Tài khoản</label>
    <input type="username" class="form-control" placeholder="Tên tài khoản" name="username">
  </div>
  <div class="form-group">
    <label>Mật khẩu</label>
    <input type="password" class="form-control" placeholder="Nhập mật khẩu" name="password">
  </div>
  <button type="submit" class="btn btn-primary">Đăng nhập</button>
</form>