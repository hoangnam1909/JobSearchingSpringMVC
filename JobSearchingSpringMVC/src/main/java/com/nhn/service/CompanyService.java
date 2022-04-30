package com.nhn.service;

import com.nhn.pojo.Company;

import java.util.List;
import java.util.Map;

public interface CompanyService {

    Company getById(int id);

    boolean addOrUpdate(Company company);

    Company getByName(String name);

    List<Company> getCompanies(Map<String, String> params, int page);

    boolean delete(Company company);

    long count();

    int getMaxItemsInPage();

}
