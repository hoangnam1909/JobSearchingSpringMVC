package com.nhn.repository.impl;

import com.nhn.pojo.JobPost;
import com.nhn.repository.JobPostRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
@Transactional
public class JobPostRepositoryImpl implements JobPostRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public JobPost getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(JobPost.class, id);
    }

    @Override
    public Boolean add(JobPost post) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(post);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }

        return false;
    }

    @Override
    public List<JobPost> getPosts(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<JobPost> q = builder.createQuery(JobPost.class);
        Root root = q.from(JobPost.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            if (params.containsKey("title")) {
                Predicate p1 = builder.like(root.get("jobTitle").as(String.class),
                        String.format("%%%s%%", params.get("title")));
                predicates.add(p1);
            }

            if (params.containsKey("description")) {
                Predicate p2 = builder.like(root.get("jobDescription").as(String.class),
                        String.format("%%%s%%", params.get("description")));
                predicates.add(p2);
            }

            if (params.containsKey("fromDate")) {
                try {
                    Date fromDate = new SimpleDateFormat("dd/MM/yyyy").parse(params.get("fromDate"));
                    Predicate p3 = builder.greaterThanOrEqualTo(root.get("createdDate").as(Date.class), fromDate);
                    predicates.add(p3);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }

            if (params.containsKey("toDate")) {
                try {
                    Date toDate = new SimpleDateFormat("dd/MM/yyyy").parse(params.get("toDate"));
                    Predicate p4 = builder.lessThanOrEqualTo(root.get("createdDate").as(Date.class), toDate);
                    predicates.add(p4);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }

            q = q.where(predicates.toArray(new Predicate[]{}));
        }

        q = q.orderBy(builder.desc(root.get("id")));

        Query query = session.createQuery(q);

        if (page != 0) {
            int max = 10;
            int index = (page - 1) * max;
            query.setFirstResult(index);
            query.setMaxResults(max);
        }

        return query.getResultList();
    }

    @Override
    public boolean delete(JobPost post) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.delete(post);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean update(JobPost post) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.update(post);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }
}
