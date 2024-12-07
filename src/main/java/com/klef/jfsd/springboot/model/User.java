	package com.klef.jfsd.springboot.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_table")
public class User {
	@Id
	@Column(name = "user_id", length = 40)
	private int id;
	@Column(name = "user_name", length = 50, nullable = false)
	private String name;
	@Column(name = "emp_gender", nullable = false, length = 20)
	private String gender;
	@Column(name = "user_email", length = 40, nullable = false, unique = true)
	private String email;
	@Column(name = "user_password", length = 30, nullable = false)
	private String password;
	@Column(name = "user_contact", length = 20, nullable = false)
	private String contact;
	@Column(name = "user_location", nullable = false, unique = true, length = 20)
	private String location;
	@Column(nullable=false)
	private String role;
	// private List<Certification> certifications; // Assuming a user has a list of
	// certifications
	@Column(name = "user_accstatus", length = 50, nullable = false)
	private String accountstatus;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Certification> certifications;
	private String errorMessage;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAccountstatus() {
		return accountstatus;
	}

	public void setAccountstatus(String accountstatus) {
		this.accountstatus = accountstatus;
	}

	// Getter for errorMessage
	public String getErrorMessage() {
		return errorMessage;
	}

	// Setter for errorMessage
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public List<Certification> getCertifications() {
		return certifications;
	}

	public void setCertifications(List<Certification> certifications) {
		this.certifications = certifications;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
