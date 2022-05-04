package com.nhn.service.impl;

import com.nhn.pojo.CandidateInfo;
import com.nhn.repository.CandidateRepository;
import com.nhn.service.CandidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CandidateServiceImpl implements CandidateService {

    @Autowired
    private CandidateRepository candidateRepository;

    @Override
    public CandidateInfo getByUserId(int userId) {
        return this.candidateRepository.getByUserId(userId);
    }

    @Override
    @Transactional
    public boolean addOrUpdate(CandidateInfo candidateInfo) {
        return this.candidateRepository.addOrUpdate(candidateInfo);
    }
}
