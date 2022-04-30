package com.nhn.validator;

import com.nhn.pojo.JobType;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class JobTypeValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.isAssignableFrom(JobType.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        JobType jobType = (JobType) target;
        if (jobType.getName().contains("?"))
            errors.rejectValue("name", "jobtype.name.invalid", "Khong dau hoi cham ban oi");
    }

}
