<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-success">THÊM CÔNG TY</h1>

<c:url value="/admin/company/add-or-update" var="action"/>

<form:form action="${action}" method="post" modelAttribute="company">
    <div class="form-group" style="display: none">
        <form:input path="id" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Tên</label>
        <form:input path="name" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Mô tả</label>
        <form:textarea path="description" class="form-control" cssStyle="min-height: 120px"/>
    </div>
    <div class="form-group">
        <label>Địa chỉ</label>
        <form:input path="location" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Liên hệ</label>
        <form:input path="contact" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Trang web</label>
        <form:input path="website" class="form-control"/>
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Thêm</button>
    </div>
</form:form>
