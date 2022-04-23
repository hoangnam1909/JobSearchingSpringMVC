package com.nhn.pojo;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.Instant;
import java.util.Date;

@Entity
@Table(name = "job_post")
public class JobPost {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "title", nullable = false, length = 100)
    private String title;

    @Lob
    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "beginningSalary", nullable = false, precision = 10)
    private BigDecimal beginningSalary;

    @Column(name = "endingSalary", nullable = false, precision = 10)
    private BigDecimal endingSalary;

    @Column(name = "location", nullable = false, length = 45)
    private String location;

    @Column(name = "created_date")
    private Date createdDate;

    @Column(name = "expired_date")
    private Date expiredDate;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "posted_by_user", nullable = false)
    private User postedByUser;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "job_type_id", nullable = false)
    private JobType jobType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private Company company;

    @Transient
    private int postedByUserId;
    @Transient
    private int jobTypeId;
    @Transient
    private int companyId;

    public int getPostedByUserId() {
        return postedByUserId;
    }

    public void setPostedByUserId(int postedByUserId) {
        this.postedByUserId = postedByUserId;
    }

    public int getJobTypeId() {
        return jobTypeId;
    }

    public void setJobTypeId(int jobTypeId) {
        this.jobTypeId = jobTypeId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public JobType getJobType() {
        return jobType;
    }

    public void setJobType(JobType jobType) {
        this.jobType = jobType;
    }

    public User getPostedByUser() {
        return postedByUser;
    }

    public void setPostedByUser(User postedByUser) {
        this.postedByUser = postedByUser;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getExpiredDate() {
        return expiredDate;
    }

    public void setExpiredDate(Date expiredDate) {
        this.expiredDate = expiredDate;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public BigDecimal getEndingSalary() {
        return endingSalary;
    }

    public void setEndingSalary(BigDecimal endingSalary) {
        this.endingSalary = endingSalary;
    }

    public BigDecimal getBeginningSalary() {
        return beginningSalary;
    }

    public void setBeginningSalary(BigDecimal beginningSalary) {
        this.beginningSalary = beginningSalary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}