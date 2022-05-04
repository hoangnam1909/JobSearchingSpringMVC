package com.nhn.service;

import com.nhn.pojo.CandidateInfo;

public interface CandidateService {

    CandidateInfo getByUserId(int userId);

    boolean addOrUpdate(CandidateInfo candidateInfo);

}
