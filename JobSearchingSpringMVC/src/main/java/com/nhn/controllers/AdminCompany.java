package com.nhn.controllers;

import com.nhn.pojo.Company;
import com.nhn.service.CompanyService;
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
public class AdminCompany {

    @Autowired
    CompanyService companyService;

    @RequestMapping("/admin/company")
    public String index(Model model) {
        List<Company> companies = this.companyService.getCompanies(null, 0);

        model.addAttribute("companies", companies);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "admin-company";
    }

    @RequestMapping("/admin/company/add")
    public String addCompany(Model model) {
        model.addAttribute("company", new Company());
        return "add-company";
    }

    @PostMapping("/admin/company/add")
    public String addCompanyPost(Model model,
                                 @ModelAttribute(value = "company") Company company,
                                 final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        boolean companyAddedCheck = this.companyService.add(company);

        if (companyAddedCheck)
            sucMsg = String.format("Thêm thông tin công ty '%s' thành công", company.getName());
        else
            errMsg = "Thêm thông tin công ty không thành công";

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/company";
    }

    @RequestMapping("/admin/company/edit")
    public String editCompany() {
        return "redirect:/admin/company";
    }

    @PostMapping("/admin/company/edit")
    @Transactional
    public String editCompanyPost(Model model,
                                  @ModelAttribute(value = "company") Company company,
                                  final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        boolean editCompanyCheck = this.companyService.update(company);

        if (editCompanyCheck)
            sucMsg = String.format("Chỉnh sửa thông tin công ty '%s' thành công", company.getName());
        else
            errMsg = String.format("Chỉnh sửa thông tin công ty không thành công %d", company.getId());

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/company";
    }

    @RequestMapping("/admin/company/edit/{id}")
    public String editCompanyGetById(Model model,
                                     @PathVariable(value = "id") int id) {
        Company company = new Company();
        if (id != 0) {
            company = this.companyService.getById(id);
            company.setId(id);
        }

        model.addAttribute("company", company);

        return "edit-company";
    }

    @RequestMapping("/admin/company/delete")
    public String deleteCompany() {
        return "redirect:/admin/company";
    }

    @RequestMapping(path = "/admin/company/delete/{id}")
    public String deleteCompanyById(Model model,
                                    @PathVariable(value = "id") int id,
                                    final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        Company company = new Company();
        if (id != 0) {
            company = this.companyService.getById(id);
        }

        boolean deleteCheck = companyService.delete(company);

        if (company != null && deleteCheck) {
            sucMsg = String.format("Xoá thành công công ty '%s' khỏi hệ thống", company.getName());
        } else {
            errMsg = String.format("Xoá không thành công công ty '%s' khỏi hệ thống", company.getName());
        }

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/company";
    }

}

