package com.nhn.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

    @RequestMapping("/access-denied")
    public String accessDenied(Model model){
        return "access-denied";
    }

}
