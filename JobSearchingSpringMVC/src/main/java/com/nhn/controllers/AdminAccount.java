/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhn.controllers;

import com.nhn.pojo.User;
import com.nhn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
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
public class AdminAccount {

    @Autowired
    UserService userService;

    @RequestMapping("/admin/account")
    public String indexDefault(Model model,
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

    @RequestMapping("/admin/account/add")
    public String addAccount(Model model) {
        model.addAttribute("user", new User());

        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "add-account";
    }

    @PostMapping("/admin/account/add")
    public String addAccountPost(Model model,
                                 @ModelAttribute(value = "user") User user,
                                 final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        if (user.getPassword().equals(user.getConfirmPassword())) {
            this.userService.add(user);
            sucMsg = String.format("Thêm thông tin user '%s' thành công", user.getUsername());
        } else {
            errMsg = String.format("Thêm thông tin user '%s' không thành công", user.getUsername());
            redirectAttrs.addFlashAttribute("errMsg", errMsg);
            return "add-account";
        }

        model.addAttribute("username", user.getUsername());
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/account";
    }

    @RequestMapping("/admin/account/edit")
    public String editAccount() {
        return "redirect:/admin/account";
    }

    @PostMapping("/admin/account/edit")
    @Transactional
    public String editAccountPost(Model model,
                                  @ModelAttribute(value = "user") User user,
                                  final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;
        user.setPassword(user.getConfirmPassword());
        boolean updateAccountCheck = this.userService.update(user);
        if (updateAccountCheck)
            sucMsg = String.format("Chỉnh sửa thông tin user '%s' thành công", user.getUsername());
        else
            errMsg = String.format("Chỉnh sửa thông tin user '%s' không thành công", user.getUsername());

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/account";
    }

    @RequestMapping("/admin/account/edit/{id}")
    public String editAccountGetById(Model model,
                                     @PathVariable(value = "id") int id) {
        User user = new User();
        if (id != 0) {
            user = this.userService.getById(id);
        }

        model.addAttribute("user", user);
        model.addAttribute("id", id);

        return "edit-account";
    }

    @RequestMapping("/admin/account/delete")
    public String deleteAccount() {
        return "redirect:/admin/account";
    }

    @RequestMapping(path = "/admin/account/delete/{id}")
    public String deleteAccountById(Model model,
                                       @PathVariable(value = "id") int id,
                                       final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        User user = new User();
        if (id != 0) {
            user = this.userService.getById(id);
        }

        boolean deleteCheck = userService.delete(user);

        if (user != null && deleteCheck) {
            sucMsg = String.format("Xoá thành công user '%s'", user.getUsername());
        } else {
            assert user != null;
            errMsg = String.format("Xoá không thành công user '%s'", user.getUsername());
        }

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/account";
    }

}
