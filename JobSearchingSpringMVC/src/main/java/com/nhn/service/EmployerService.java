package com.nhn.service;

import com.nhn.pojo.Employer;

import java.util.List;
import java.util.Map;

public interface EmployerService {

    Employer getById(int id);

    Employer getByUserId(int userId);

    boolean addOrUpdate(Employer employer);

    Employer getByName(String name);

    List<Employer> getCompanies(Map<String, String> params, int page);

    boolean delete(Employer employer);

    long count();

    int getMaxItemsInPage();

}
