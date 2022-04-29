package com.nhn.controllers;

import com.nhn.pojo.JobType;
import com.nhn.service.JobTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
@Transactional
public class AdminJobTypeController {

    @Autowired
    JobTypeService jobTypeService;

    @RequestMapping("/admin/job-type")
    public String indexDefault(Model model,
                               @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        List<JobType> jobTypes = this.jobTypeService.getJobTypes("", page);
        model.addAttribute("jobTypes", jobTypes);

        model.addAttribute("counter", jobTypeService.count());
        model.addAttribute("jobTypeService", jobTypeService);
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
            errMsg = String.format("Thêm thông tin loại việc làm '%s' không thành công", jobType.getName());

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
            errMsg = String.format("Chỉnh sửa thông tin loại việc làm '%s' không thành công", jobType.getName());

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

    @RequestMapping("/admin/job-type/delete")
    public String deleteJobType() {
        return "redirect:/admin/job-type";
    }

    @RequestMapping(path = "/admin/job-type/delete/{id}")
    public String deleteJobTypeById(Model model,
                                    @PathVariable(value = "id") int id,
                                    final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        JobType jobType = new JobType();
        if (id != 0) {
            jobType = this.jobTypeService.getById(id);
        }

        boolean deleteCheck = jobTypeService.delete(jobType);

        if (jobType != null && deleteCheck)
            sucMsg = String.format("Xoá loại việc làm '%s' thành công", jobType.getName());
        else
            errMsg = String.format("Xoá loại việc làm '%s' không thành công", jobType.getName());


        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/job-type";
    }

}
