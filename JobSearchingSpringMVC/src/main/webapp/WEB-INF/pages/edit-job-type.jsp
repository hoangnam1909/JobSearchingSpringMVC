<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-success">CHỈNH SỬA THÔNG TIN LOẠI VIỆC LÀM</h1>

<c:url value="/admin/job-type/edit" var="action" />

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
            ${errMsg}
    </div>
</c:if>

<form:form action="${action}" method="post" modelAttribute="jobType">
    <div class="form-group" style="display: none">
        <form:input path="id" class="form-control" />
    </div>
    <div class="form-group">
        <label>Tên</label>
        <form:input path="name" class="form-control" />
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Sửa</button>
    </div>
</form:form>
