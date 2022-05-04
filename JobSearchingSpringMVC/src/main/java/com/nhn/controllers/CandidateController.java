package com.nhn.controllers;

import com.nhn.service.UserService;
import com.nhn.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CandidateController {

    @Autowired
    private UserService userService;

    @Autowired
    UserValidator userValidator;

    @RequestMapping("/candidate")
    public String index(Model model){
        return "candidate";
    }

}
