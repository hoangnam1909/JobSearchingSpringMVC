package com.nhn.controllers;

import com.nhn.pojo.Company;
import com.nhn.pojo.JobPost;
import com.nhn.pojo.JobType;
import com.nhn.pojo.User;
import com.nhn.service.CompanyService;
import com.nhn.service.JobPostService;
import com.nhn.service.JobTypeService;
import com.nhn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@ControllerAdvice
public class AdminJobPost {

    @Autowired
    UserService userService;

    @Autowired
    JobPostService jobPostService;

    @Autowired
    JobTypeService jobTypeService;

    @Autowired
    CompanyService companyService;

    @RequestMapping("/admin/job-post")
    public String index(Model model) {
        List<JobPost> jobPosts = jobPostService.getPosts(null, 1);

        model.addAttribute("jobPosts", jobPosts);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "admin-job-post";
    }

    @RequestMapping("/admin/job-post/add")
    public String addJobPost(Model model) {
        List<User> users = userService.getUsers("");
        model.addAttribute("users", users);
        List<JobType> jobTypes = jobTypeService.getJobTypes("");
        model.addAttribute("jobTypes", jobTypes);
        List<Company> companies = companyService.getCompanies(null, 0);
        model.addAttribute("companies", companies);

        model.addAttribute("jobPost", new JobPost());

        return "add-job-post";
    }

    @PostMapping("/admin/job-post/add")
    @Transactional
    public String addJobPostPost(Model model,
                                 @ModelAttribute(value = "jobPost") JobPost jobPost,
                                 final RedirectAttributes redirectAttrs) throws ParseException {
        String errMsg = null;
        String sucMsg = null;

        jobPost.setPostedByUser(userService.getById(jobPost.getPostedByUserId()));
        jobPost.setJobType(jobTypeService.getById(jobPost.getJobTypeId()));
        jobPost.setCompany(companyService.getById(jobPost.getCompanyId()));

        if (!jobPost.getCreatedDateStr().equals(""))
            jobPost.setCreatedDate(new SimpleDateFormat("yyyy-MM-dd").parse(jobPost.getCreatedDateStr()));
        else
            jobPost.setCreatedDate(new Date());

        if (!jobPost.getExpiredDateStr().equals(""))
            jobPost.setExpiredDate(new SimpleDateFormat("yyyy-MM-dd").parse(jobPost.getExpiredDateStr()));

        boolean jobPostAddedCheck = this.jobPostService.add(jobPost);

        if (jobPostAddedCheck)
            sucMsg = String.format("Thêm thành công bài viết #%d", jobPost.getId());
        else
            errMsg = "Thêm bài viết thất bại";

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/job-post";
    }

    @RequestMapping("/admin/job-post/edit")
    public String editJobPost() {
        return "redirect:/admin/job-post";
    }

    @PostMapping("/admin/job-post/edit")
    @Transactional
    public String editJobPostPost(Model model,
                                  @ModelAttribute(value = "jobPost") JobPost jobPost,
                                  final RedirectAttributes redirectAttrs) throws ParseException {
        String errMsg = null;
        String sucMsg = null;

        jobPost.setPostedByUser(userService.getById(jobPost.getPostedByUserId()));
        jobPost.setJobType(jobTypeService.getById(jobPost.getJobTypeId()));
        jobPost.setCompany(companyService.getById(jobPost.getCompanyId()));

        if (!jobPost.getCreatedDateStr().equals(""))
            jobPost.setCreatedDate(new SimpleDateFormat("yyyy-MM-dd").parse(jobPost.getCreatedDateStr()));
        else
            jobPost.setCreatedDate(new Date());

        if (!jobPost.getExpiredDateStr().equals(""))
            jobPost.setExpiredDate(new SimpleDateFormat("yyyy-MM-dd").parse(jobPost.getExpiredDateStr()));

        boolean editJobPostCheck = this.jobPostService.update(jobPost);

        if (editJobPostCheck)
            sucMsg = String.format("Chỉnh sửa thông tin bài viết '%s' thành công", jobPost.getTitle());
        else
            errMsg = String.format("Chỉnh sửa thông tin bài viết không thành công %d", jobPost.getId());

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/job-post";
    }

    @RequestMapping("/admin/job-post/edit/{id}")
    public String editJobPostGetById(Model model,
                                     @PathVariable(value = "id") int id) {
        JobPost jobPost = new JobPost();
        if (id != 0) {
            jobPost = this.jobPostService.getById(id);
            jobPost.setId(id);
        }

        List<User> users = userService.getUsers("");
        model.addAttribute("users", users);
        List<JobType> jobTypes = jobTypeService.getJobTypes("");
        model.addAttribute("jobTypes", jobTypes);
        List<Company> companies = companyService.getCompanies(null, 0);
        model.addAttribute("companies", companies);

        model.addAttribute("jobPost", jobPost);

        return "edit-job-post";
    }

}
