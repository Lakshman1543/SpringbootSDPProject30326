package com.klef.jfsd.springboot.model;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "training_course")
public class TrainingCourse {

	@Id
	private int courseId;
	@Column(nullable = false)
	private String title;	
	@Column(nullable = false)
	private String description;
	@Column(nullable = false)
	private String filePath;
	@Column(nullable = false)
	private long days;
	@ManyToOne
	@JoinColumn(name = "id")
	private Curator addedBy;
	@Column(nullable = false, updatable = false)
	private Timestamp createdAt = new Timestamp(System.currentTimeMillis());

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Curator getAddedBy() {
		return addedBy;
	}

	public void setAddedBy(Curator addedBy) {
		this.addedBy = addedBy;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public long getDays() {
		return days;
	}

	public void setDays(long days) {
		this.days = days;
	}

}
