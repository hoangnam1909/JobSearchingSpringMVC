package com.nhn.controllers;

import com.nhn.pojo.Candidate;
import com.nhn.pojo.User;
import com.nhn.service.CandidateService;
import com.nhn.service.UserService;
import com.nhn.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.persistence.NoResultException;

@Controller
public class CandidateController {

    @Autowired
    private UserService userService;

    @Autowired
    private CandidateService candidateService;

    @Autowired
    UserValidator userValidator;

    @RequestMapping("/candidate")
    public String index(Model model) {
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));
        return "candidate";
    }

    @RequestMapping("/candidate/candidate-info/view")
    public String viewCandidate(Model model,
                                @RequestParam(name = "userId", defaultValue = "0") int userId) {
        Candidate candidate = this.candidateService.getByUserId(userId);
        if (candidate != null)
            model.addAttribute("candidate", this.candidateService.getByUserId(userId));
        else
            return "redirect:/admin/account";

        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "view-candidate";
    }

    @GetMapping("/candidate/candidate-info/add-or-update")
    public String updateCandidateView(Model model,
                                      Authentication authentication) {

        int userId = this.userService.getByUsername(authentication.getName()).getId();

        Candidate candidate;
        try {
            candidate = candidateService.getByUserId(userId);
        } catch (NoResultException nre) {
            candidate = new Candidate();
            candidate.setId(0);
        }
        model.addAttribute("candidate", candidate);
        model.addAttribute("userId", userId);
        model.addAttribute("actionUrl", "/candidate/candidate-info/add-or-update");
        return "add-candidate";
    }

    @PostMapping("/candidate/candidate-info/add-or-update")
    public String addOrUpdateCandidate(Model model,
                                       @ModelAttribute(value = "candidate") Candidate candidate,
                                       final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        User candidateUser = userService.getById(candidate.getUserId());
        candidate.setUser(candidateUser);
        int checkMsg = candidate.getId();
        if (this.candidateService.addOrUpdate(candidate)) {
            if (checkMsg == 0)
                sucMsg = String.format("Thêm thông tin user và ứng viên '%s' thành công", candidateUser.getUsername());
            else
                sucMsg = "Cập nhật thông tin user và ứng viên thành công";
        } else {
            if (checkMsg == 0)
                errMsg = String.format("Thêm thông tin user và ứng viên '%s' không thành công", candidateUser.getUsername());
            else
                errMsg = "Cập nhật thông tin user và ứng viên không thành công";

            model.addAttribute("errMsg", errMsg);
        }

        model.addAttribute("actionUrl", "/candidate/candidate-info/update");
        model.addAttribute("sucMsg", sucMsg);
        return "add-candidate";
    }

    @RequestMapping("/candidate/find-employer")
    public String findCandidate(Model model,
                                @RequestParam(name = "userId", defaultValue = "0") int userId) {
        return "candidate-find-employer";
    }

}
