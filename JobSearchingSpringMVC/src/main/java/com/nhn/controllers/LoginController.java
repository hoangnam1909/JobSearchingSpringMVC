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
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

/**
 * @author Lightning
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping("/login")
    public String index(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
            return "login";
        }

        return "redirect:/";
    }

    // THEM HOAC CAP NHAT TAI KHOAN
    @GetMapping("/register")
    public String registerView(Model model) {
        User user = new User();
        user.setId(0);

        model.addAttribute("user", user);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model,
                           @ModelAttribute(value = "user") @Valid User user,
                           BindingResult result,
                           final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        userValidator.validate(user, result);
        if (result.hasErrors())
            return "register";

        if (user.getUserType().equals("ROLE_NTD"))
            user.setActive(0);
        else
            user.setActive(1);

        if (this.userService.addOrUpdate(user)) {
            sucMsg = String.format("Đăng ký thành công tài khoản '%s' với vai trò %s",
                    user.getUsername(),
                    user.getUserType().equals("ROLE_UV") ? "Ứng viên" : "Nhà tuyển dụng");
        } else {
            errMsg = String.format("Thêm thông tin user '%s' không thành công", user.getUsername());
            redirectAttrs.addFlashAttribute("errMsg", errMsg);
            return "register";
        }

        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/";
    }

}
