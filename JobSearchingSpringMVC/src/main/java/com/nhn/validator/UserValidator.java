package com.nhn.validator;

import com.nhn.pojo.User;
import com.nhn.utils.utils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;

        // validate username
        if (user.getUsername().isEmpty())
            errors.rejectValue("username", "", "Tên đăng nhập không được bỏ trống");

        if (user.getUsername().contains(" "))
            errors.rejectValue("username", "", "Tên đăng nhập không có dấu cách bro");

        if (user.getUsername().length() < 6)
            errors.rejectValue("username", "", "Tên đăng nhập không ít hơn 6 ký tự");

        if (user.getUsername().length() > 20)
            errors.rejectValue("username", "", "Tên đăng nhập không quá 20 ký tự");

        // validate password
        if (user.getPassword().isEmpty())
            errors.rejectValue("password", "", "Mật khẩu không được bỏ trống");

        if (!user.getPassword().equals(user.getConfirmPassword()))
            errors.rejectValue("password", "", "Mật khẩu và xác nhận mật khẩu chưa trùng khớp");

        if (user.getPassword().contains(" "))
            errors.rejectValue("password", "", "Mật khẩu không chứa khoảng trắng");

        if (user.getPassword().length() < 8)
            errors.rejectValue("password", "", "Mật khẩu cần có tối thiểu 8 ký tự");

        // validate email
        if (!utils.isValidEmail(user.getEmail()))
            errors.rejectValue("email", "", "Email chưa đúng định dạng");

        // validate phone
        if (!utils.isValidMobile(user.getPhone()))
            errors.rejectValue("phone", "", "Số điện thoại không hợp lệ");
    }
}
