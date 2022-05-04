package com.nhn.repository.impl;

import com.nhn.pojo.CandidateInfo;
import com.nhn.pojo.User;
import com.nhn.repository.CandidateRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

@Repository
public class CandidateRepositoryImpl implements CandidateRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public CandidateInfo getByUserId(int userId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<CandidateInfo> query = builder.createQuery(CandidateInfo.class);
        Root root = query.from(CandidateInfo.class);
        query = query.select(root);

        query = query.where(builder.equal(root.join("user").get("id").as(Integer.class), userId));

        org.hibernate.query.Query q = session.createQuery(query);
        return (CandidateInfo) q.getSingleResult();
    }

    @Override
    public boolean addOrUpdate(CandidateInfo candidateInfo) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            if (candidateInfo.getId() > 0)
                session.update(candidateInfo);
            else
                session.save(candidateInfo);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }

        return false;
    }
}
