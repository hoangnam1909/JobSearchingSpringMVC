package com.nhn.service.impl;

import com.nhn.pojo.Company;
import com.nhn.repository.CompanyRepository;
import com.nhn.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    CompanyRepository companyRepository;

    @Override
    public Company getById(int id) {
        return this.companyRepository.getById(id);
    }

    @Override
    public boolean add(Company company) {
        return this.companyRepository.add(company);
    }

    @Override
    public Company getByName(String name) {
        return this.companyRepository.getByName(name);
    }

    @Override
    public List<Company> getCompanies(Map<String, String> params, int page) {
        return this.companyRepository.getCompanies(params, page);
    }

    @Override
    public boolean delete(Company company) {
        return this.companyRepository.delete(company);
    }

    @Override
    public boolean update(Company company) {
        return this.companyRepository.update(company);
    }
}
