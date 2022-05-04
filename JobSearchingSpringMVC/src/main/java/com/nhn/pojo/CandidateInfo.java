package com.nhn.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "candidate_info")
public class CandidateInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "years_experience")
    private Integer yearsExperience;

    @Lob
    @Column(name = "strengths")
    private String strengths;

    @Lob
    @Column(name = "weaknesses")
    private String weaknesses;

    @Column(name = "majoring", length = 100)
    private String majoring;

    @Lob
    @Column(name = "language_certificate")
    private String languageCertificate;

    @Lob
    @Column(name = "informatics_certificate")
    private String informaticsCertificate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @JsonIgnore
    @Transient
    private int userId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getYearsExperience() {
        return yearsExperience;
    }

    public void setYearsExperience(Integer yearsExperience) {
        this.yearsExperience = yearsExperience;
    }

    public String getStrengths() {
        return strengths;
    }

    public void setStrengths(String strengths) {
        this.strengths = strengths;
    }

    public String getWeaknesses() {
        return weaknesses;
    }

    public void setWeaknesses(String weaknesses) {
        this.weaknesses = weaknesses;
    }

    public String getMajoring() {
        return majoring;
    }

    public void setMajoring(String majoring) {
        this.majoring = majoring;
    }

    public String getLanguageCertificate() {
        return languageCertificate;
    }

    public void setLanguageCertificate(String languageCertificate) {
        this.languageCertificate = languageCertificate;
    }

    public String getInformaticsCertificate() {
        return informaticsCertificate;
    }

    public void setInformaticsCertificate(String informaticsCertificate) {
        this.informaticsCertificate = informaticsCertificate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}