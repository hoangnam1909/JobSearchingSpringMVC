package com.nhn.controllers;

import com.nhn.pojo.Company;
import com.nhn.pojo.JobPost;
import com.nhn.pojo.JobType;
import com.nhn.pojo.User;
import com.nhn.service.CompanyService;
import com.nhn.service.JobPostService;
import com.nhn.service.JobTypeService;
import com.nhn.service.UserService;
import com.nhn.validator.JobPostValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployerController {

    @Autowired
    UserService userService;

    @Autowired
    JobPostService jobPostService;

    @Autowired
    JobTypeService jobTypeService;

    @Autowired
    CompanyService companyService;

    @Autowired
    JobPostValidator jobPostValidator;

    @RequestMapping("/employer")
    public String index(Model model,
                        Authentication authentication,
                        @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        Map<String, String> pre = new HashMap<>();
        pre.put("postedByUserId", String.valueOf(this.userService.getByUsername(authentication.getName()).getId()));
        List<JobPost> jobPosts = jobPostService.getPosts(pre, page, 20);

        model.addAttribute("jobPosts", jobPosts);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "employer";
    }

    @GetMapping("/employer/job-post/view")
    public String viewJobPost(Model model,
                              @RequestParam(name = "id", defaultValue = "0") int id) {
        if (id > 0) {
            model.addAttribute("jobPost", this.jobPostService.getById(id));
            model.addAttribute("userService", userService);
            model.addAttribute("jobTypeService", jobTypeService);
            model.addAttribute("companyService", companyService);
        } else {
            return "redirect:/employer";
        }
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "employer-view-job-post";
    }

}
