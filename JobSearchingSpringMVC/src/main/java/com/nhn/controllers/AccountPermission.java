package com.nhn.controllers;

import com.nhn.pojo.User;
import com.nhn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
@Transactional
public class AccountPermission {

    @Autowired
    UserService userService;

    @RequestMapping("/admin/account-permission")
    public String index(Model model,
                        @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        List<User> users = userService.getUsersByRole(User.NTD, page, 0);
        model.addAttribute("users", users);

        model.addAttribute("counter", users.size());
        model.addAttribute("userService", userService);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "admin-account-permission";
    }

    @RequestMapping("/admin/account-permission/accept")
    public String acceptAccount() {
        return "redirect:/admin/account-permission";
    }

    @RequestMapping(path = "/admin/account-permission/accept/{id}")
    public String acceptAccountById(Model model,
                                    @PathVariable(value = "id") int id,
                                    final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;

        User user = new User();
        if (id != 0) {
            user = this.userService.getById(id);
            user.setActive(1);
        }

        if (user.getActive() == 1) {
            sucMsg = String.format("Xác nhận nhà tuyển dụng '%s' thành công", user.getUsername());
        } else {
            errMsg = String.format("Xác nhận nhà tuyển dụng '%s' không thành công", user.getUsername());
        }

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/account-permission";
    }

}
