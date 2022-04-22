package com.nhn.service.impl;

import com.nhn.pojo.JobType;
import com.nhn.pojo.User;
import com.nhn.repository.JobTypeRepository;
import com.nhn.service.JobTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobTypeServiceImpl implements JobTypeService {

    @Autowired
    JobTypeRepository jobTypeRepository;


    @Override
    public JobType getById(int id) {
        return this.jobTypeRepository.getById(id);
    }

    @Override
    public boolean add(JobType jobType) {
        return this.jobTypeRepository.add(jobType);
    }

    @Override
    public JobType getByName(String name) {
        return this.jobTypeRepository.getByName(name);
    }

    @Override
    public List<JobType> getJobTypes(String name) {
        return this.jobTypeRepository.getJobTypes(name);
    }

    @Override
    public boolean delete(JobType jobType) {
        return this.jobTypeRepository.delete(jobType);
    }

    @Override
    public boolean update(JobType jobType) {
        return this.jobTypeRepository.update(jobType);
    }
}
