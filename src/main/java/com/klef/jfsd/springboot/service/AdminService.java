package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Contactus;
import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.model.TrainingCourse;
import com.klef.jfsd.springboot.model.User;

public interface AdminService 
{
	public List<User> ViewAllUsers();
	public Admin checkadminlogin(String uname,String pwd);
	public String deleteuser(int uid);
	public User displayuserbyId(int uid);
	public long usercount();
	public String updateuserstatus(String accountstatus, int eid);

	 public String addCurator(Curator curator);
	 public List<Curator> viewAllCurators();
	 public String updateCurator(Curator curator);
	 public String deleteCurator(int curatorId);
	 public Curator displayCuratorById(int curatorId);

	 public List<TrainingCourse> viewAllTrainingCourses();
	 public String deleteTrainingCourse(int courseId);
	 
	 public List<Contactus> getAllContactMessages();
	   public Contactus getContactMessageById(int id);
	   public String addcontactus(Contactus cm);
}
