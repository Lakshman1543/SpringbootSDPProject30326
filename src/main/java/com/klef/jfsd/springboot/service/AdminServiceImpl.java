package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Contactus;
import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.model.TrainingCourse;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.ContactUsRepository;
import com.klef.jfsd.springboot.repository.CuratorRepository;
import com.klef.jfsd.springboot.repository.TrainingCourseRepository;
import com.klef.jfsd.springboot.repository.UserRepository;

@Service
public class AdminServiceImpl implements AdminService
{
  @Autowired
  private AdminRepository adminRepository;
  
  @Autowired
  private UserRepository userRepository;
  
  @Autowired
  private CuratorRepository curatorRepository;
  
  @Autowired
  private TrainingCourseRepository trainingRepository;
  
  @Autowired
  private ContactUsRepository contactusRepository;
  
  @Override
  public List<User> ViewAllUsers() 
  {
    return userRepository.findAll();
  }

  @Override
  public Admin checkadminlogin(String uname, String pwd) 
  {
    return adminRepository.checkadminlogin(uname, pwd);
  }

  @Override
  public String deleteuser(int uid) {
    userRepository.deleteById(uid);
    return "User Deleted Successfully";
  }

  @Override
  public User displayuserbyId(int uid) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public long usercount() {
    return userRepository.count();
  }

  @Override
	public String updateuserstatus(String accountstatus, int eid) {
		userRepository.updateuserstatus(accountstatus, eid);
		return "User Status Updated Successfully";
	}

  @Override
  public String addCurator(Curator curator) {
    curatorRepository.save(curator);
    return "Curator Added Successfully";
  }

  @Override
  public List<Curator> viewAllCurators() {
    return curatorRepository.findAll();
  }

  public String updateCurator(Curator curator) {
    Optional<Curator> existingCurator = curatorRepository.findById(curator.getId());
        if (existingCurator != null) {
            if(existingCurator.isPresent()) {
                Curator updatedCurator = existingCurator.get();
                updatedCurator.setName(curator.getName());
                updatedCurator.setEmail(curator.getEmail());
                curatorRepository.save(updatedCurator);
                return "Updated Successfully";
            }
        }
        return "Curator Not Found";
  }

  @Override
  public String deleteCurator(int curatorId) {
    curatorRepository.deleteById(curatorId);
    return "Curator Deleted Successfully";
  }

  @Override
  public Curator displayCuratorById(int curatorId) {
    return curatorRepository.findById(curatorId).get();
  }

  @Override
  public List<TrainingCourse> viewAllTrainingCourses() {
    return (List<TrainingCourse>) trainingRepository.findAll();
  }

  @Override
  public String deleteTrainingCourse(int courseId) {
    trainingRepository.findById(courseId);
    return "Course Deleted Successfully";
  }
  
  @Override
    public List<Contactus> getAllContactMessages() {
        return contactusRepository.findAll();
    }

  @Override
    public Contactus getContactMessageById(int id) {
        Optional<Contactus> contactMessage = contactusRepository.findById(id);
        return contactMessage.orElse(null);
    }

  @Override
  public String addcontactus(Contactus cm) {
    contactusRepository.save(cm);
    return "Message Posted Successfully";
  }
}