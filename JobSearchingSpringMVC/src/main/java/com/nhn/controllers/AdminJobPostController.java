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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@ControllerAdvice
public class AdminJobPostController {

    @Autowired
    UserService userService;

    @Autowired
    JobPostService jobPostService;

    @Autowired
    JobTypeService jobTypeService;

    @Autowired
    CompanyService companyService;

    @RequestMapping(value = "/admin/job-post")
    public String index(Model model,
                        @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String sort = params.getOrDefault("sort", "desc");

        Map<String, String> pre = new HashMap<>();
        pre.put("sort", sort);
        List<JobPost> jobPosts = jobPostService.getPosts(pre, page);
        model.addAttribute("jobPosts", jobPosts);

        model.addAttribute("counter", jobPostService.count());
        model.addAttribute("jobPostService", jobPostService);

        // another
        model.addAttribute("userService", userService);
        model.addAttribute("jobTypeService", jobTypeService);
        model.addAttribute("companyService", companyService);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "admin-job-post";
    }

    @GetMapping("/admin/job-post/view")
    public String viewJobPost(Model model,
                              @RequestParam(name = "id", defaultValue = "0") int id) {
        if (id > 0) {
            model.addAttribute("jobPost", this.jobPostService.getById(id));
            model.addAttribute("userService", userService);
            model.addAttribute("jobTypeService", jobTypeService);
            model.addAttribute("companyService", companyService);
        } else {
            return "redirect:/admin/job-post";
        }
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "view-job-post";
    }

    @GetMapping("/admin/job-post/add-or-edit")
    public String addOrUpdateJobPostView(Model model,
                                         @RequestParam(name = "id", defaultValue = "0") int id) {

        if (id > 0)
            model.addAttribute("jobPost", this.jobPostService.getById(id));
        else {
            JobPost jobPost = new JobPost();
            jobPost.setId(0);
            model.addAttribute("jobPost", jobPost);
        }

        List<User> users = userService.getUsers("", 0);
        model.addAttribute("users", users);
        List<JobType> jobTypes = jobTypeService.getJobTypes("", 0);
        model.addAttribute("jobTypes", jobTypes);
        List<Company> companies = companyService.getCompanies(null, 0);
        model.addAttribute("companies", companies);

        return "add-job-post";
    }

    @PostMapping(value = "/admin/job-post/add-or-edit")
    public String addOrUpdateJobPost(Model model,
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

        boolean jobPostAddedCheck = this.jobPostService.addOrUpdate(jobPost);
        if (jobPostAddedCheck)
            sucMsg = String.format("Thêm thành công bài viết '%s'", jobPost.getTitle());
        else
            errMsg = String.format("Thêm bài viết '%s' thất bại", jobPost.getTitle());

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/job-post";
    }

    @GetMapping(path = "/admin/job-post/delete")
    public String deleteJobPostById(Model model,
                                    @RequestParam(name = "id", defaultValue = "0") int id,
                                    final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;
        JobPost jobPost = new JobPost();

        if (id > 0)
            jobPost = this.jobPostService.getById(id);

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
