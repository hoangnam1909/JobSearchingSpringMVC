package com.nhn.controllers;

import com.nhn.pojo.Company;
import com.nhn.pojo.User;
import com.nhn.service.CompanyService;
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
public class AdminCompanyController {

    @Autowired
    CompanyService companyService;

    @RequestMapping("/admin/company")
    public String indexDefault(Model model,
                               @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        List<Company> companies = this.companyService.getCompanies(null, page);
        model.addAttribute("companies", companies);

        model.addAttribute("counter", companyService.count());
        model.addAttribute("companyService", companyService);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "admin-company";
    }

    @GetMapping("/admin/company/view")
    public String viewCompany(Model model,
                              @RequestParam(name = "id", defaultValue = "0") int id) {
        if (id > 0)
            model.addAttribute("company", this.companyService.getById(id));
        else
            return "redirect:/admin/company";

        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "view-company";
    }

    @GetMapping("/admin/company/add-or-edit")
    public String addOrUpdateCompanyView(Model model,
                                         @RequestParam(name = "id", defaultValue = "0") int id) {
        if (id > 0) {
            model.addAttribute("company", this.companyService.getById(id));
        } else {
            Company company = new Company();
            company.setId(0);
            model.addAttribute("company", company);
        }

        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "add-company";
    }

    @PostMapping("/admin/company/add-or-edit")
    public String addOrUpdateCompany(Model model,
                                     @ModelAttribute(value = "company") Company company,
                                     final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        boolean companyAddedCheck = this.companyService.addOrUpdate(company);
        if (companyAddedCheck)
            sucMsg = String.format("Thêm thông tin công ty '%s' thành công", company.getName());
        else
            errMsg = "Thêm thông tin công ty không thành công";

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/company";
    }

    @RequestMapping(path = "/admin/company/delete")
    public String deleteCompanyById(Model model,
                                    @RequestParam(name = "id", defaultValue = "0") int id,
                                    final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        Company company = this.companyService.getById(id);
        if (company != null) {
            if (companyService.delete(company))
                sucMsg = String.format("Xoá công ty '%s' thành công", company.getName());
            else
                errMsg = String.format("Xoá công ty '%s' không thành công", company.getName());
        } else {
            errMsg = "Công ty không tồn tại";
        }

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/company";
    }

}

