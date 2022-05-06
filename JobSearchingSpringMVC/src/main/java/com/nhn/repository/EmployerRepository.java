package com.nhn.repository;

import com.nhn.pojo.Candidate;
import com.nhn.pojo.Employer;
import com.nhn.pojo.User;

import java.util.List;
import java.util.Map;

public interface EmployerRepository {

    Employer getById(int id);

    Employer getByUserId(int userId);

    List<Employer> getUsersMultiCondition(Map<String, String> params);

    boolean addOrUpdate(Employer employer);

    Employer getByName(String name);

    List<Employer> getCompanies(Map<String, String> params, int page);

    boolean delete(Employer employer);

    long count();

    int getMaxItemsInPage();

}
