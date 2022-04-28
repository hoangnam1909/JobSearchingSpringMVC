package com.nhn.repository;

import com.nhn.pojo.JobType;

import java.util.List;
import java.util.Map;

public interface JobTypeRepository {

    JobType getById(int id);

    boolean add(JobType jobType);

    JobType getByName(String name);

    List<JobType> getJobTypes(String name, int page);

    boolean delete(JobType jobType);

    boolean update(JobType jobType);

    long count();

    int getMaxItemsInPage();

}
