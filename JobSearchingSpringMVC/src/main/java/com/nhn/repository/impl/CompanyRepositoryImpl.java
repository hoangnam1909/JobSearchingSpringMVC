package com.nhn.repository.impl;

import com.nhn.pojo.Company;
import com.nhn.repository.CompanyRepository;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
@Transactional
public class CompanyRepositoryImpl implements CompanyRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    private final int maxItemsInPage = 10;

    public int getMaxItemsInPage() {
        return maxItemsInPage;
    }

    @Override
    public Company getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Company.class, id);
    }

    @Override
    public boolean add(Company company) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(company);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }

        return false;
    }

    @Override
    public Company getByName(String name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Company> query = builder.createQuery(Company.class);
        Root root = query.from(Company.class);
        query = query.select(root);

        if (!name.isEmpty()) {
            Predicate p = builder.equal(root.get("name").as(String.class), name.trim());
            query = query.where(p);
        }

        Query q = session.createQuery(query);
        return (Company) q.getResultList().get(0);
    }

    @Override
    public List<Company> getCompanies(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Company> q = builder.createQuery(Company.class);
        Root root = q.from(Company.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            if (params.containsKey("name")) {
                Predicate p1 = builder.like(root.get("name").as(String.class),
                        String.format("%%%s%%", params.get("name")));
                predicates.add(p1);
            }

            if (params.containsKey("contact")) {
                Predicate p2 = builder.like(root.get("contact").as(String.class),
                        String.format("%%%s%%", params.get("contact")));
                predicates.add(p2);
            }

            if (params.containsKey("email")) {
                Predicate p3 = builder.like(root.get("email").as(String.class),
                        String.format("%%%s%%", params.get("email")));
                predicates.add(p3);
            }

            if (params.containsKey("location")) {
                Predicate p4 = builder.like(root.get("location").as(String.class),
                        String.format("%%%s%%", params.get("location")));
                predicates.add(p4);
            }

            if (params.containsKey("website")) {
                Predicate p5 = builder.like(root.get("website").as(String.class),
                        String.format("%%%s%%", params.get("website")));
                predicates.add(p5);
            }

            q = q.where(predicates.toArray(new Predicate[]{}));
        }

        q = q.orderBy(builder.asc(root.get("id")));

        Query query = session.createQuery(q);

        if (page != 0) {
            int max = maxItemsInPage;
            query.setMaxResults(max);
            query.setFirstResult((page - 1) * max);
        }
        return query.getResultList();
    }

    @Override
    public boolean delete(Company company) {
        if (company.getJobPosts().size() == 0) {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            try {
                session.delete(company);
                return true;
            } catch (HibernateException ex) {
                System.err.println(ex.getMessage());
            }
            return false;
        } else {
            return false;
        }
    }

    @Override
    public boolean update(Company company) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.update(company);

            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }

        return false;
    }

    @Override
    public long count() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Company ");

        return Long.parseLong(q.getSingleResult().toString());
    }

}
