package com.klef.jfsd.springboot.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity

@Table(name = "certification_details")
public class Certification {

	@Id
	private int certificationId;
	@Column(name = "certification_name", nullable = false, length = 100)
	private String certificationname;
	@Column(name = "issued_by", nullable = false, length = 100)
	private String issuedBy;
	@Column(name = "issue_date", nullable = false)
	private String issuedate;
	@Column(name = "expiry_date", nullable = false)
	private String expirydate;
	@Column(name = "status", nullable = false, length = 20)
	private String status;
	@Column(name = "certificate_file", nullable = false)
	private Blob certificatefile;
	@Column(nullable = false)
	private boolean isGlobal;
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public int getCertificationId() {
		return certificationId;
	}

	public void setCertificationId(int certificationId) {
		this.certificationId = certificationId;
	}

	public String getCertificationname() {
		return certificationname;
	}

	public void setCertificationname(String certificationname) {
		this.certificationname = certificationname;
	}

	public String getIssuedBy() {
		return issuedBy;
	}

	public void setIssuedBy(String issuedBy) {
		this.issuedBy = issuedBy;
	}

	public String getIssuedate() {
		return issuedate;
	}

	public void setIssuedate(String issuedate) {
		this.issuedate = issuedate;
	}

	public String getExpirydate() {
		return expirydate;
	}

	public void setExpirydate(String expirydate) {
		this.expirydate = expirydate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Blob getCertificatefile() {
		return certificatefile;
	}

	public void setCertificatefile(Blob certificatefile) {
		this.certificatefile = certificatefile;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isIsGlobal() {
		return isGlobal;
	}

	public void setIsGlobal(boolean isGlobal) {
		this.isGlobal = isGlobal;
	}

}