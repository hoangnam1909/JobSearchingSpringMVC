/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhn.controllers;

import com.nhn.pojo.Candidate;
import com.nhn.pojo.User;
import com.nhn.service.CandidateService;
import com.nhn.service.UserService;
import com.nhn.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.persistence.NoResultException;
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
    private CandidateService candidateService;

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
        User user = this.userService.getById(id);
        if (user != null) {
            model.addAttribute("user", user);
            Candidate candidate = null;
            try {
                candidate = candidateService.getByUserId(user.getId());
            } catch (NoResultException nre) {
                System.err.println(nre.getMessage());
            }
            if (candidate != null) {
                model.addAttribute("candidate", candidate);
            }
        } else
            return "redirect:/admin/account";

        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "view-account";
    }

    @RequestMapping("/admin/candidate/view")
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

    @GetMapping("/admin/account/candidate-info/update")
    public String updateCandidateView(Model model,
                                      @RequestParam(name = "userId", defaultValue = "0") int userId,
                                      final RedirectAttributes redirectAttrs) {
        Candidate candidate;
        try {
            candidate = candidateService.getByUserId(userId);
        } catch (NoResultException nre){
            redirectAttrs.addFlashAttribute("userId", userId);
            return "redirect:/admin/account/candidate-info/add";
        }
        model.addAttribute("candidate", candidate);
        model.addAttribute("userId", userId);
        return "add-candidate";
    }

    @GetMapping("/admin/account/candidate-info/add")
    public String addCandidateView(Model model) {
        Candidate candidate = new Candidate();
        candidate.setId(0);
        model.addAttribute("candidate", candidate);
        model.addAttribute("userId", model.asMap().get("userId"));
        return "add-candidate";
    }

    @PostMapping("/admin/account/candidate-info/add-or-update")
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
                sucMsg = "Sửa thông tin user và ứng viên thành công";
        } else {
            if (checkMsg == 0)
                errMsg = String.format("Thêm thông tin user và ứng viên '%s' không thành công", candidateUser.getUsername());
            else
                errMsg = "Sửa thông tin user và ứng viên không thành công";

            redirectAttrs.addFlashAttribute("errMsg", errMsg);
            return "add-candidate";
        }

        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/account";
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

        boolean addOrUpdateCheck = this.userService.addOrUpdate(user);
        if (addOrUpdateCheck) {
            if (user.getUserType().equals("ROLE_UV")) {
                redirectAttrs.addFlashAttribute("userId",
                        userService.getByUsername(user.getUsername()).getId());
                return "redirect:/admin/account/candidate-info/add";
            }

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
