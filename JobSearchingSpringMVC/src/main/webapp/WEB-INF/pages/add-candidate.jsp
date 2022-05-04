<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${candidate.id == 0}">
    <h1 class="text-center dark-color">THÊM THÔNG TIN ỨNG VIÊN</h1>
</c:if>
<c:if test="${candidate.id > 0}">
    <h1 class="text-center dark-color">CHỈNH SỬA THÔNG TIN ỨNG VIÊN</h1>
</c:if>

<c:url value="/admin/account/candidate-info/add-or-update" var="action"/>

<form:form action="${action}" method="post" modelAttribute="candidate" cssClass="mt-5">
    <form:hidden path="id" class="form-control"/>
    <form:hidden path="userId" value="${userId}" class="form-control"/>
    <div class="form-group">
        <label>Số năm kinh nghiệm</label>
        <form:input path="yearsExperience" class="form-control" autofocus="autofocus"/>
    </div>
    <div class="form-group">
        <label>Điểm mạnh</label>
        <form:textarea path="strengths" class="form-control" cssStyle="min-height: 120px"/>
    </div>
    <div class="form-group">
        <label>Điểm yếu</label>
        <form:textarea path="weaknesses" class="form-control" cssStyle="min-height: 120px"/>
    </div>
    <div class="form-group">
        <label>Chuyên ngành</label>
        <form:input path="majoring" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Chứng chỉ ngoại ngữ</label>
        <form:textarea path="languageCertificate" class="form-control" cssStyle="min-height: 120px"/>
    </div>
    <div class="form-group">
        <label>Chứng chỉ tin học</label>
        <form:textarea path="informaticsCertificate" class="form-control" cssStyle="min-height: 120px"/>
    </div>
    <c:if test="${candidate.id == 0}">
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Thêm</button>
        </div>
    </c:if>
    <c:if test="${candidate.id > 0}">
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Cập nhật</button>
        </div>
    </c:if>
</form:form>
