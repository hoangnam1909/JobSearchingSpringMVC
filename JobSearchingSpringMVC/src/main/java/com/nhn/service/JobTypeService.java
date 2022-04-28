package com.nhn.service;

import com.nhn.pojo.JobType;

import java.util.List;

public interface JobTypeService {

    JobType getById(int id);

    boolean add(JobType jobType);

    JobType getByName(String name);

    List<JobType> getJobTypes(String name, int page);

    boolean delete(JobType jobType);

    boolean update(JobType jobType);

    long count();

    int getMaxItemsInPage();

}
