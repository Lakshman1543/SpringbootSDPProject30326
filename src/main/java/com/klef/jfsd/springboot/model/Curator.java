package com.klef.jfsd.springboot.model;

import java.sql.Blob;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "curator")
public class Curator {
    @Id
    private int id;
    @Column(nullable = false)
    private String name;
    @Column(nullable=false)
    private String gender;
    @Column(nullable = false, unique = true)
    private String username;
    @Column(nullable = false)
    private String password;
    @Column(nullable = false, unique = true)
    private String email; 
    @Column(nullable = false, unique = true)
    private String contact;
    @Column(nullable=false)
	private String role;
    @OneToMany(mappedBy = "addedBy", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<TrainingCourse> courses;
    @Column(name="curator_image",nullable = false)
    private Blob image;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<TrainingCourse> getCourses() {
        return courses;
    }

    public void setCourses(List<TrainingCourse> courses) {
        this.courses = courses;
    }

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}
}
