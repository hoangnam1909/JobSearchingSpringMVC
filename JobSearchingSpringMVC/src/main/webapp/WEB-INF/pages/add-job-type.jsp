<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-success">THÊM LOẠI VIỆC LÀM</h1>

<c:url value="/admin/job-type/add" var="action" />

<form:form action="${action}" method="post" modelAttribute="jobType">
    <div class="form-group">
        <label>Tên</label>
        <form:input path="name" class="form-control" />
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Thêm</button>
    </div>
</form:form>
