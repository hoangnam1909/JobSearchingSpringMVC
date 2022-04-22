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

/**
 * @author Lightning
 */
@Controller
@Transactional
public class AdminAccount {

    @Autowired
    UserService userService;

    @RequestMapping("/admin/account")
    public String index(Model model) {
        List<User> users = userService.getUsers("");

        model.addAttribute("users", users);
        model.addAttribute("alert", model.asMap().get("alert"));

        return "admin-account";
    }

    @RequestMapping("/admin/account/add")
    public String addAccount(Model model) {
        model.addAttribute("user", new User());
        return "add-account";
    }

    @PostMapping("/admin/account/add")
    public String addAccountPost(Model model, @ModelAttribute(value = "user") User user) {
        String errMsg = "";

        model.addAttribute("username", user.getUsername());
        model.addAttribute("password", user.getPassword());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("phone", user.getPhone());
        model.addAttribute("userType", user.getUserType());

        if (user.getPassword().equals(user.getConfirmPassword())) {
            this.userService.add(user);
            return "redirect:/admin/account";
        } else
            errMsg = "Mat khau KHONG khop!";

        model.addAttribute("username", user.getUsername());

        model.addAttribute("errMsg", errMsg);

        return "add-account";
    }

    @RequestMapping("/admin/account/edit")
    public String editAccount() {
        return "redirect:/admin/account";
    }

    @PostMapping("/admin/account/edit")
    @Transactional
    public String editAccountPost(Model model,
                                  @ModelAttribute(value = "user") User user) {
        String errMsg = "";

        this.userService.update(user);
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
        User user = new User();
        String alert = null;
        if (id != 0) {
            user = this.userService.getById(id);
        }

        boolean deleteCheck = false;
        deleteCheck = userService.delete(user);

        if (user != null && deleteCheck) {
            alert = String.format("Xoa thanh cong user %s", user.getUsername());
        } else {
            alert = "Xoa khong thanh cong";
        }

        redirectAttrs.addFlashAttribute("alert", alert);

        return "redirect:/admin/account";
    }

}
