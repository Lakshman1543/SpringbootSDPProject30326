package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.model.TrainingCourse;

public interface CuratorService {
	
    public Curator checkcuratorlogin(String cusername,String pwd);
	public String addTrainingCourse(TrainingCourse trainingCourse);
    public String updateTrainingCourse(TrainingCourse trainingCourse);
    public String deleteTrainingCourse(int courseId);
    public List<TrainingCourse> viewAllTrainingCourses();
    public TrainingCourse displayTrainingCourseById(int courseId);
    
    // To Generate a reset token for the email
    public String generateResetToken(String email);
    
   // To Validate if the token is valid and not expired
    public boolean validateResetToken(String token);
    public void updatePassword(String token, String newPassword);
    public void deleteResetToken(String token);
    
    // Optional: Check if the token is expired
    public boolean isTokenExpired(String token);
    
    public Curator ViewCuratorById(int curatorid);
	public void deleteCurator(int id);
	public long ccount();
}
