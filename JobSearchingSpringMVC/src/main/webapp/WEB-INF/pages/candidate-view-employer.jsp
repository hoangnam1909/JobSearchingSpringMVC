<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>

<style>
    .gray-bg {
        background-color: #f5f5f5;
    }

    img {
        max-width: 90%;
    }

    img {
        vertical-align: middle;
        border-style: none;
    }

    /* About Me
    ---------------------*/
    .about-text h3 {
        font-size: 45px;
        font-weight: 700;
        margin: 0 0 6px;
    }

    @media (max-width: 767px) {
        .about-text h3 {
            font-size: 35px;
        }
    }

    .about-text h6 {
        font-weight: 600;
        margin-bottom: 15px;
    }

    @media (max-width: 767px) {
        .about-text h6 {
            font-size: 18px;
        }
    }

    .about-text p {
        font-size: 18px;
        max-width: 450px;
    }

    .about-text p mark {
        font-weight: 600;
        color: #20247b;
    }

    .about-list {
        padding-top: 10px;
    }

    .about-list .media {
        padding: 5px 0;
    }

    .about-list label {
        color: #20247b;
        font-weight: 600;
        width: 88px;
        margin: 0;
        position: relative;
    }

    .about-list label:after {
        content: "";
        position: absolute;
        top: 0;
        bottom: 0;
        right: 11px;
        width: 1px;
        height: 12px;
        background: #20247b;
        -moz-transform: rotate(15deg);
        -o-transform: rotate(15deg);
        -ms-transform: rotate(15deg);
        -webkit-transform: rotate(15deg);
        transform: rotate(15deg);
        margin: auto;
        opacity: 0.5;
    }

    .about-list p {
        margin: 0;
        font-size: 15px;
    }

    @media (max-width: 991px) {
        .about-avatar {
            margin-top: 30px;
        }
    }

    .about-section .counter {
        margin-top: 30px;
        padding: 22px 20px;
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
    }

    .about-section .counter .count-data {
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .about-section .counter .count {
        font-weight: 700;
        color: #20247b;
        margin: 0 0 5px;
    }

    .about-section .counter p {
        font-weight: 600;
        margin: 0;
    }

    mark {
        background-image: linear-gradient(rgba(252, 83, 86, 0.6), rgba(252, 83, 86, 0.6));
        background-size: 100% 3px;
        background-repeat: no-repeat;
        background-position: 0 bottom;
        background-color: transparent;
        padding: 0;
        color: currentColor;
    }

    .theme-color {
        color: #fc5356;
    }

    .dark-color {
        color: #20247b;
    }
</style>

<div class="container">

    <h1 class="text-left dark-color" style="padding: 0 30px">THÔNG TIN NHÀ TUYỂN DỤNG</h1>

    <section class="section about-section gray-bg" id="about">
        <div class="container m-0">
            <div class="row flex-row-reverse">
                <div class="col-lg-6">
                    <div class="about-text go-to">
                        <h3 class="dark-color mb-4">
                            ${employer.name}
                        </h3>
                        <div class="row mb-1">
                            <div class="col-md-4">
                                <h5>Mô tả</h5>
                            </div>
                            <div class="col-md-8">
                                <p>
                                    ${employer.description}
                                </p>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <div class="col-md-4">
                                <h5>Trụ sở</h5>
                            </div>
                            <div class="col-md-8">
                                <p>
                                    ${employer.location}
                                </p>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <div class="col-md-4">
                                <h5>Liên hệ</h5>
                            </div>
                            <div class="col-md-8">
                                <p>${employer.contact}</p>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <div class="col-md-4">
                                <h5>Trang web</h5>
                            </div>
                            <div class="col-md-8">
                                <p>${employer.website}</p>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <div class="col-md-4">
                                <h5>Chuyên ngành</h5>
                            </div>
                            <div class="col-md-8">
                                <p>${employer.majoring}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-avatar d-flex justify-content-center">
                        <c:if test="${userService.getById(employer.user.id).avatar.startsWith('https')}">
                            <img src="<c:url value="${userService.getById(employer.user.id).avatar}"/>"
                                 class="rounded">
                        </c:if>
                        <c:if test="${!userService.getById(employer.user.id).avatar.startsWith('https')}">
                            <img src="<c:url value="/resources/images/none.png"/>"
                                 class="rounded">
                        </c:if>
                    </div>
                </div>
            </div>
            <%--        <div class="counter mt-7">--%>
            <%--            <div class="row">--%>
            <%--                <div class="col-6 col-lg-3">--%>
            <%--                    <div class="count-data text-center">--%>
            <%--                        <h6 class="count h2" data-to="500" data-speed="500">500</h6>--%>
            <%--                        <p class="m-0px font-w-600">Happy Clients</p>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--                <div class="col-6 col-lg-3">--%>
            <%--                    <div class="count-data text-center">--%>
            <%--                        <h6 class="count h2" data-to="150" data-speed="150">150</h6>--%>
            <%--                        <p class="m-0px font-w-600">Project Completed</p>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--                <div class="col-6 col-lg-3">--%>
            <%--                    <div class="count-data text-center">--%>
            <%--                        <h6 class="count h2" data-to="850" data-speed="850">850</h6>--%>
            <%--                        <p class="m-0px font-w-600">Photo Capture</p>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--                <div class="col-6 col-lg-3">--%>
            <%--                    <div class="count-data text-center">--%>
            <%--                        <h6 class="count h2" data-to="190" data-speed="190">190</h6>--%>
            <%--                        <p class="m-0px font-w-600">Telephonic Talk</p>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <%--        </div>--%>
        </div>
    </section>
</div>
