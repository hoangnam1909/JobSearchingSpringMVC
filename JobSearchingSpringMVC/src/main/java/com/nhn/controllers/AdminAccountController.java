/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhn.controllers;

import com.nhn.pojo.User;
import com.nhn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

/**
 * @author Lightning
 */
@Controller
@Transactional
@PropertySource("classpath:messages.properties")
public class AdminAccountController {

    @Autowired
    private UserService userService;

    @RequestMapping("/admin/account")
    public String index(Model model,
                        @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        List<User> users = userService.getUsers("", page);
        model.addAttribute("users", users);

        model.addAttribute("counter", userService.count());
        model.addAttribute("userService", userService);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "admin-account";
    }

    @GetMapping("/admin/account/add-or-edit")
    public String addOrUpdateAccountView(Model model,
                                         @RequestParam(name = "id", defaultValue = "0") int id) {
        if (id > 0)
            model.addAttribute("user", this.userService.getById(id));
        else
            model.addAttribute("user", new User());

        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "add-account";
    }

    @PostMapping("/admin/account/add-or-edit")
    public String addOrUpdateAccount(Model model,
                                     @ModelAttribute(value = "user") User user,
                                     final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        if (user.getPassword().equals(user.getConfirmPassword())) {
            if (this.userService.addOrUpdate(user)) {
                sucMsg = String.format("Thêm thông tin user '%s' thành công", user.getUsername());
            } else {
                errMsg = String.format("Thêm thông tin user '%s' không thành công", user.getUsername());
                redirectAttrs.addFlashAttribute("errMsg", errMsg);
                return "add-account";
            }
        } else {
            errMsg = "Mật khẩu chưa trùng khớp";
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
