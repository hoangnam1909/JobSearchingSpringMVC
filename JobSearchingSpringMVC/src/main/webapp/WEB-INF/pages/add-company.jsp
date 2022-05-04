<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${company.id == 0}">
    <h1 class="text-center dark-color">THÊM CÔNG TY</h1>
</c:if>
<c:if test="${company.id > 0}">
    <h1 class="text-center dark-color">CHỈNH SỬA THÔNG TIN CÔNG TY</h1>
</c:if>

<c:url value="/admin/company/add-or-update" var="action"/>

<form:form action="${action}" method="post" modelAttribute="company">
    <div class="form-group" style="display: none">
        <form:input path="id" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Tên</label>
        <form:input path="name" class="form-control" autofocus="autofocus"/>
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
    <c:if test="${company.id == 0}">
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Thêm</button>
        </div>
    </c:if>
    <c:if test="${company.id > 0}">
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Cập nhật</button>
        </div>
    </c:if>
</form:form>
