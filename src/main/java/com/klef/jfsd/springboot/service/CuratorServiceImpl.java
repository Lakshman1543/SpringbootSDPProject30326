package com.klef.jfsd.springboot.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.model.ResetToken;
import com.klef.jfsd.springboot.model.TrainingCourse;
import com.klef.jfsd.springboot.repository.CuratorRepository;
import com.klef.jfsd.springboot.repository.ResetTokenRepository;
import com.klef.jfsd.springboot.repository.TrainingCourseRepository;

@Service
public class CuratorServiceImpl implements CuratorService {

	@Autowired
	private TrainingCourseRepository trainingRepository;

	@Autowired
	private CuratorRepository curatorRepository;

	@Autowired
	private ResetTokenRepository resetTokenRepository;

	@Override
	public String addTrainingCourse(TrainingCourse trainingCourse) {
		trainingRepository.save(trainingCourse);
		return "Training Course Added Successfully";
	}

	@Override
	public String updateTrainingCourse(TrainingCourse trainingCourse) {
		TrainingCourse existingCourse = trainingRepository.findById(trainingCourse.getCourseId()).get();

		if (existingCourse != null) {
			existingCourse.setTitle(trainingCourse.getTitle());
			existingCourse.setDescription(trainingCourse.getDescription());
			existingCourse.setFilePath(trainingCourse.getFilePath());
			trainingRepository.save(existingCourse);
			return "Training Course Updated Successfully!";
		}
		return "Training Course Not Found!";
	}

	@Override
	public String deleteTrainingCourse(int courseId) {
		trainingRepository.deleteById(courseId);
		return "Training Course Deleted Successfully";
	}

	@Override
	public List<TrainingCourse> viewAllTrainingCourses() {
		return (List<TrainingCourse>) trainingRepository.findAll();
	}

	@Override
	public TrainingCourse displayTrainingCourseById(int courseId) {
		return trainingRepository.findById(courseId).get();
	}

	@Override
	public Curator checkcuratorlogin(String cusername, String pwd) {
		return curatorRepository.checkcuratorlogin(cusername, pwd);
	}


	@Override
	public String generateResetToken(String email) {
		String token = UUID.randomUUID().toString();

		// Create a ResetToken object
		ResetToken rt = new ResetToken();
		rt.setToken(token);
		rt.setEmail(email);
		rt.setCreatedAt(LocalDateTime.now());
		rt.setExpiresAt(LocalDateTime.now().plusMinutes(10));
		resetTokenRepository.save(rt);
		return token;
	}

	@Override
	public boolean validateResetToken(String token) {
		Optional<ResetToken> resetTokenOpt = resetTokenRepository.findByToken(token);

		if (resetTokenOpt.isPresent()) {
			// Check if the token has expired
			return !isTokenExpired(token);
		}

		// Token not found
		return false;
	}

	@Override
	public void updatePassword(String token, String newPassword) {
		Optional<ResetToken> resetTokenOpt = resetTokenRepository.findByToken(token);

		if (resetTokenOpt.isPresent()) {
			ResetToken rt = resetTokenOpt.get();

			if (validateResetToken(token)) {
				Curator curator = curatorRepository.findCuratorByEmail(rt.getEmail());

				if (curator != null) {
					// Update password and save
					curator.setPassword(newPassword);
					curatorRepository.save(curator);
				}
			}
		} 
		else {
			System.out.println("Token not found");
		}
	}

	@Override
	public boolean isTokenExpired(String token) {
		Optional<ResetToken> resetTokenOpt = resetTokenRepository.findByToken(token);
		if (resetTokenOpt.isPresent()) {
			ResetToken resetToken = resetTokenOpt.get();

			return LocalDateTime.now().isAfter(resetToken.getExpiresAt());
		}

		return true;
	}

	public void deleteResetToken(String token) {
		resetTokenRepository.deleteByToken(token);
	}

	@Override
	public Curator ViewCuratorById(int curatorid) {
		return curatorRepository.findById(curatorid).get();
	}

	@Override
	 public void deleteCurator(int id) {
        // Check if the curator exists before deleting
        if (curatorRepository.existsById(id)) {
            curatorRepository.deleteById(id);  // Delete the curator by ID
        } else {
            throw new RuntimeException("Curator not found with id " + id);
        }
    }

	@Override
	public long ccount() {
		return curatorRepository.count();
	}
}
