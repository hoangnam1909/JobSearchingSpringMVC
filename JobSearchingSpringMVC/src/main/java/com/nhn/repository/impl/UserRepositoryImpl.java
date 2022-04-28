package com.nhn.repository.impl;

import com.nhn.pojo.User;
import com.nhn.repository.UserRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    private final int maxItemsInPage = 10;

    public int getMaxItemsInPage() {
        return maxItemsInPage;
    }

    @Override
    public User getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(User.class, id);
    }

    @Override
    public boolean add(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(user);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }

        return false;
    }

    @Override
    public User getByUsername(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        query = query.where(builder.equal(root.get("username").as(String.class), username));

        org.hibernate.query.Query q = session.createQuery(query);
        return (User) q.getSingleResult();
    }

    @Override
    public List<User> getUsers(String username, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        if (!username.isEmpty()) {
            Predicate p = builder.equal(root.get("username").as(String.class), username.trim());
            query = query.where(p);
        }

        query = query.orderBy(builder.desc(root.get("id")));

        Query q = session.createQuery(query);

        if (page != 0) {
            int max = maxItemsInPage;
            q.setMaxResults(max);
            q.setFirstResult((page - 1) * max);
        }
        return q.getResultList();
    }

    @Override
    public boolean delete(User user) {
        if (user.getJobPosts().size() == 0) {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            try {
                session.delete(user);
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
    public boolean update(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.update(user);

            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }

        return false;
    }

    @Override
    public long count() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From User");

        return Long.parseLong(q.getSingleResult().toString());
    }

}
