package com.nhn.service.impl;

import com.nhn.pojo.JobPost;
import com.nhn.repository.JobPostRepository;
import com.nhn.service.JobPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class JobPostServiceImpl implements JobPostService {

    @Autowired
    JobPostRepository jobPostRepository;

    @Override
    public JobPost getById(int id) {
        return this.jobPostRepository.getById(id);
    }

    @Override
    public Boolean add(JobPost post) {
        return this.jobPostRepository.add(post);
    }

    @Override
    public List<JobPost> getPosts(Map<String, String> params, int page) {
        return this.jobPostRepository.getPosts(params, page);
    }

    @Override
    public boolean delete(JobPost post) {
        return this.jobPostRepository.delete(post);
    }

    @Override
    public boolean update(JobPost post) {
        return this.jobPostRepository.update(post);
    }

    @Override
    public long count() {
        return this.jobPostRepository.count();
    }

    @Override
    public int getMaxItemsInPage() {
        return this.jobPostRepository.getMaxItemsInPage();
    }
}
