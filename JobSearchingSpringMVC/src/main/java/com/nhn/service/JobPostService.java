package com.nhn.service;

import com.nhn.pojo.JobPost;

import java.util.List;
import java.util.Map;

public interface JobPostService {

    JobPost getById(int id);

    Boolean addOrUpdate(JobPost post);

    List<JobPost> getPosts(Map<String, String> params, int page);

    boolean delete(JobPost post);

    long count();

    int getMaxItemsInPage();

}
