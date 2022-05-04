/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhn.controllers;

import com.nhn.pojo.User;
import com.nhn.service.UserService;
import com.nhn.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * @author Lightning
 */
@Controller
@Transactional
public class AccountController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping("/admin/account")
    public String index(Model model,
                        @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        List<User> users = userService.getUsers("", page);
        model.addAttribute("users", users);

        model.addAttribute("currentPage", page);
        model.addAttribute("counter", userService.count());
        model.addAttribute("userService", userService);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "admin-account";
    }

    // XEM CHI TIET TAI KHOAN
    @GetMapping("/admin/account/view")
    public String viewAccount(Model model,
                              @RequestParam(name = "id", defaultValue = "0") int id) {
        if (id > 0)
            model.addAttribute("user", this.userService.getById(id));
        else
            return "redirect:/admin/account";

        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "view-account";
    }

    // THEM HOAC CAP NHAT TAI KHOAN
    @GetMapping("/admin/account/add-or-update")
    public String addOrUpdateAccountView(Model model,
                                         @RequestParam(name = "id", defaultValue = "0") int id) {
        if (id > 0)
            model.addAttribute("user", this.userService.getById(id));
        else
            model.addAttribute("user", new User());

        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "add-account";
    }

    @PostMapping("/admin/account/add-or-update")
    public String addOrUpdateAccount(Model model,
                                     @ModelAttribute(value = "user") @Valid User user,
                                     BindingResult result,
                                     final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        userValidator.validate(user, result);
        if (result.hasErrors())
            return "add-account";

        if (this.userService.addOrUpdate(user)) {
            if (user.getId() == 0)
                sucMsg = String.format("Thêm thông tin user '%s' thành công", user.getUsername());
            else
                sucMsg = String.format("Sửa thông tin user '%s' thành công", user.getUsername());
        } else {
            if (user.getId() == 0)
                errMsg = String.format("Thêm thông tin user '%s' không thành công", user.getUsername());
            else
                errMsg = String.format("Sửa thông tin user '%s' không thành công", user.getUsername());

            redirectAttrs.addFlashAttribute("errMsg", errMsg);
            return "add-account";
        }

        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/account";
    }

    @RequestMapping(path = "/admin/account/delete")
    public String deleteAccountById(Model model,
                                    @RequestParam(name = "id", defaultValue = "0") int id,
                                    final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;
        User user = new User();

        if (id > 0) {
            user = this.userService.getById(id);

            boolean deleteCheck = userService.delete(user);
            if (user != null && deleteCheck) {
                sucMsg = String.format("Xoá thành công user '%s'", user.getUsername());
            } else {
                assert user != null;
                errMsg = String.format("Xoá không thành công user '%s'", user.getUsername());
            }
        } else {
            errMsg = String.format("Xoá không thành công user '%s'", user.getUsername());
        }

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/account";
    }

}
