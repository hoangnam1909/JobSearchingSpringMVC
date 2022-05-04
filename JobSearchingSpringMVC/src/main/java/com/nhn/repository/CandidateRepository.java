package com.nhn.repository;

import com.nhn.pojo.CandidateInfo;

public interface CandidateRepository {

    CandidateInfo getByUserId(int userId);

    boolean addOrUpdate(CandidateInfo candidateInfo);

}
