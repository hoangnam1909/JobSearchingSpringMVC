<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <h1 class="text-center dark-color">TÌM KIẾM NHÀ TUYỂN DỤNG</h1>

    <section class="d-flex justify-content-center">
        <form class="mt-3 w-50">
            <div class="form-group">
                <label for="name">Tên nhà tuyển dụng</label>
                <input class="form-control" name="name" id="name">
            </div>
            <div class="form-group">
                <label for="name">Tên nhà tuyển dụng</label>
                <input class="form-control" name="name" id="major">
            </div>

            <button type="submit" class="btn btn-primary">Tra cứu</button>
        </form>
    </section>
</div>

<div class="container">
    <div class="col">
        <div class="row">
            <div class="media g-mb-30 media-comment w-100">
                <img class="d-flex g-width-50 g-height-50 rounded-circle g-mt-3 g-mr-15"
                     src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Image Description">
                <div class="media-body u-shadow-v18 g-bg-secondary g-pa-30">
                    <div class="g-mb-15">
                        <h3 class="g-color-gray-dark-v1 mb-0">
                            ${employerService.getByUserId(jobPost.postedByUser.id).name}
                            - ${userService.getById(jobPost.postedByUser.id).username}
                        </h3>
                        <span class="g-color-gray-dark-v4 g-font-size-12">
                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${jobPost.createdDate}"/>
                        </span>
                    </div>
                    <h4 class="g-color-gray-dark-v1 mt-1 mb-2">
                        ${jobPost.title}
                    </h4>
                    <h5 class="g-color-gray-dark-v1">
                        Mô tả:
                    </h5>
                    <p>
                        ${jobPost.description}
                    </p>

                    <h5 class="g-color-gray-dark-v1">
                        Lương tối thiểu: ${jobPost.beginningSalary} VNĐ
                    </h5>
                    <h5 class="g-color-gray-dark-v1">
                        Lương tối đa: ${jobPost.beginningSalary} VNĐ
                    </h5>
                    <h5 class="g-color-gray-dark-v1">
                        Địa điểm: ${jobPost.location}
                    </h5>
                    <h5 class="g-color-gray-dark-v1">
                        Ngày hết hạn nộp: <fmt:formatDate pattern="dd/MM/yyyy" value="${jobPost.expiredDate}"/>
                    </h5>
                </div>
            </div>
        </div>
    </div>
</div>

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