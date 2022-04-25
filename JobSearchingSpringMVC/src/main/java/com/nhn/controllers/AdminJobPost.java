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

    @RequestMapping(value = "/admin/job-post")
    public String indexDefault(Model model) {
        int page = 1;

        List<JobPost> jobPosts = jobPostService.getPosts(null, page);
        model.addAttribute("jobPosts", jobPosts);

        int countAll = (int) jobPostService.countAll();
        System.out.println("countAll = " + countAll);

        model.addAttribute("maxItems", jobPostService.getMaxItemsInPage());
        model.addAttribute("countAll", countAll);
        model.addAttribute("currentPage", page);

        model.addAttribute("userService", userService);
        model.addAttribute("jobTypeService", jobTypeService);
        model.addAttribute("companyService", companyService);

        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "admin-job-post";
    }

    @RequestMapping(value = "/admin/job-post/{page}")
    public String indexWithPage(Model model,
                                @PathVariable(value = "page") int page) {

        List<JobPost> jobPosts = jobPostService.getPosts(null, page);
        model.addAttribute("jobPosts", jobPosts);

        // Pagination
        int countAll = (int) jobPostService.countAll();
        System.out.println("countAll = " + countAll);

        model.addAttribute("maxItems", jobPostService.getMaxItemsInPage());
        model.addAttribute("countAll", countAll);
        model.addAttribute("currentPage", page);

        // add service to template
        model.addAttribute("userService", userService);
        model.addAttribute("jobTypeService", jobTypeService);
        model.addAttribute("companyService", companyService);

        // send alerts
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "admin-job-post";
    }

    @RequestMapping("/admin/job-post/add")
    public String addJobPost(Model model) {
        List<User> users = userService.getUsers("", 0);
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
            sucMsg = String.format("Thêm thành công bài viết '%s'", jobPost.getTitle());
        else
            errMsg = String.format("Thêm bài viết '%s' thất bại", jobPost.getTitle());


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
            errMsg = String.format("Chỉnh sửa thông tin bài viết '%d' không thành công", jobPost.getId());

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

        List<User> users = userService.getUsers("", 0);
        model.addAttribute("users", users);
        List<JobType> jobTypes = jobTypeService.getJobTypes("");
        model.addAttribute("jobTypes", jobTypes);
        List<Company> companies = companyService.getCompanies(null, 0);
        model.addAttribute("companies", companies);

        model.addAttribute("jobPost", jobPost);

        return "edit-job-post";
    }

    @RequestMapping("/admin/job-post/delete")
    public String deleteAccount() {
        return "redirect:/admin/job-post";
    }

    @RequestMapping(path = "/admin/job-post/delete/{id}")
    public String deleteAccountById(Model model,
                                    @PathVariable(value = "id") int id,
                                    final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        JobPost jobPost = new JobPost();
        if (id != 0) {
            jobPost = this.jobPostService.getById(id);
        }

        boolean deleteCheck = jobPostService.delete(jobPost);

        if (jobPost != null && deleteCheck) {
            sucMsg = String.format("Xoá thành công bài đăng '%s'", jobPost.getTitle());
        } else {
            assert jobPost != null;
            errMsg = String.format("Xoá không thành công bài đăng '%s'", jobPost.getTitle());
        }

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/job-post";
    }

}
