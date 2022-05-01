/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhn.controllers;

import com.nhn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Lightning
 */
@Controller
@ControllerAdvice
public class HomeController {

    @Autowired
    private UserService userService;

    @ModelAttribute
    public void addAttributes(Model model, Authentication authentication) {
        if (authentication != null)
            model.addAttribute("currentUser", this.userService.getByUsername(authentication.getName()));
    }

    @RequestMapping("/")
    public String index(Model model) {
        return "redirect:/login";
    }
}
