<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>

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
        </div>
    </section>
</div>

<div class="container pt-2">
    <div class="col">
        <div class="row my-4">
            <form class="w-100">
                <div class="form-group">
                    <textarea class="form-control" id="commentId" placeholder="Nhập bình luận"></textarea>
                </div>
                <input type="button" value="Đăng bình luận" onclick="addComment(${employer.id}, ${currentUser.id})"
                       class="btn btn-info"/>
            </form>
        </div>

        <div class="d-flex flex-column-reverse" id="commentArea"></div>

        <div class="d-flex flex-column-reverse">
            <c:forEach items="${employer.comments}" var="cmt">
                <div class="row">
                    <div class="media g-mb-30 media-comment w-100">
                        <img class="d-flex g-width-50 g-height-50 rounded-circle g-mt-3 g-mr-15"
                             src="${cmt.user.avatar}"
                             alt="Image Description">
                        <div class="media-body u-shadow-v18 g-bg-secondary g-pa-30">
                            <div class="g-mb-15 mb-2">
                                <h4 class="text-info g-color-gray-dark-v1 mb-0">
                                        ${cmt.user.fullName}
                                </h4>
                                <span class="g-color-gray-dark-v4 g-font-size-12" id="cmtDatePosted">
                                    ${cmt.createdDate}
                                </span>
                            </div>
                            <p style="font-weight: 400"> ${cmt.content} </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script>
    moment.locale('vi')
    let dates = document.querySelectorAll("#cmtDatePosted")
    for (let i = 0; i < dates.length; i++) {
        let d = dates[i];
        d.innerText = moment(d.innerText).fromNow();
    }
</script>

<style>
    @media (min-width: 0) {
        .g-mr-15 {
            margin-right: 15px !important;
        }
    }

    @media (min-width: 0) {
        .g-mt-3 {
            margin-top: 10px !important;
        }
    }

    .g-height-50 {
        height: 50px;
    }

    .g-width-50 {
        width: 50px !important;
    }

    @media (min-width: 0) {
        .g-pa-30 {
            padding: 20px !important;
        }
    }

    .g-bg-secondary {
        background-color: #fafafa !important;
    }

    .u-shadow-v18 {
        box-shadow: 0 5px 10px -6px rgba(0, 0, 0, 0.15);
    }

    .g-color-gray-dark-v4 {
        color: #777 !important;
    }

    .g-font-size-12 {
        font-size: 0.85714rem !important;
    }

    .media-comment {
        margin-top: 20px
    }
</style>

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