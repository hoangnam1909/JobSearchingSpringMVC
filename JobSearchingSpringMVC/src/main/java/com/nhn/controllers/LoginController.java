/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhn.controllers;

import com.nhn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Lightning
 */
@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    
    @GetMapping("/login")
    public String index(Model model) {
        return "login";
    }

}
