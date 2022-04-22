package com.nhn.controllers;

import com.nhn.pojo.Company;
import com.nhn.pojo.JobType;
import com.nhn.service.JobTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Transactional
public class AdminJobType {

    @Autowired
    JobTypeService jobTypeService;

    @RequestMapping("/admin/job-type")
    public String index(Model model) {
        List<JobType> jobTypes = this.jobTypeService.getJobTypes("");

        model.addAttribute("jobTypes", jobTypes);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "admin-job-type";
    }

    @RequestMapping("/admin/job-type/add")
    public String addJobType(Model model) {
        model.addAttribute("jobType", new JobType());
        return "add-job-type";
    }

    @PostMapping("/admin/job-type/add")
    public String addJobTypePost(Model model,
                                 @ModelAttribute(value = "jobType") JobType jobType,
                                 final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        boolean jobTypeAddedCheck = this.jobTypeService.add(jobType);

        if (jobTypeAddedCheck)
            sucMsg = String.format("Thêm thông tin loại việc làm '%s' thành công", jobType.getName());
        else
            errMsg = "Thêm thông tin loại việc làm không thành công";

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/job-type";
    }

    @RequestMapping("/admin/job-type/edit")
    public String editJobType() {
        return "redirect:/admin/job-type";
    }

    @PostMapping("/admin/job-type/edit")
    @Transactional
    public String editJobTypePost(Model model,
                                  @ModelAttribute(value = "jobType") JobType jobType,
                                  final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        boolean editJobTypeCheck = this.jobTypeService.update(jobType);

        if (editJobTypeCheck)
            sucMsg = String.format("Chỉnh sửa thông tin loại việc làm '%s' thành công", jobType.getName());
        else
            errMsg = String.format("Chỉnh sửa thông tin loại việc làm không thành công %d", jobType.getId());

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/job-type";
    }

    @RequestMapping("/admin/job-type/edit/{id}")
    public String editJobTypeGetById(Model model,
                                     @PathVariable(value = "id") int id) {
        JobType jobType = new JobType();
        if (id != 0) {
            jobType = this.jobTypeService.getById(id);
            jobType.setId(id);
        }

        model.addAttribute("jobType", jobType);

        return "edit-job-type";
    }

}
