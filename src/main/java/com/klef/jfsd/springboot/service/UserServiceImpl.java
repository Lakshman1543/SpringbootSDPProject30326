package com.klef.jfsd.springboot.service;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.model.ResetToken;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.repository.ResetTokenRepository;
import com.klef.jfsd.springboot.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ResetTokenRepository resetTokenRepository;

	@Override
	public String UserRegistration(User u) {
		userRepository.save(u);
		return "User Registered Successfully";
	}

	@Override
	public User checkuserlogin(String eemail, String pwd) {
		return userRepository.checkuserlogin(eemail, pwd);
	}

	@Override
	public User displayUserByID(int uid) {
		return userRepository.findById(uid).get();
	}

	@Override
	public String updateUserProfile(User user) {
		User u = userRepository.findById(user.getId()).get();

		u.setContact(user.getContact());
		u.setGender(user.getGender());
		u.setLocation(user.getLocation());
		u.setName(user.getName());
		u.setPassword(user.getPassword());

		userRepository.save(u);

		return "Employee Updated Successfully";
	}

	@Override
	public String updateAccountSettings(User user) {
		// Update user account details (name, email, contact)
		User u = userRepository.findById(user.getId()).get();

		u.setName(user.getName());
		u.setEmail(user.getEmail());
		u.setContact(user.getContact());

		userRepository.save(u);
		return "Account updated successfully.";
	}

	@Override
	public boolean changePassword(User user, String oldPassword, String newPassword) {
		// Check if the old password is correct
		User u = userRepository.findById(user.getId()).get();

		if (u.getPassword().equals(oldPassword)) {
			u.setPassword(newPassword);
			userRepository.save(u);
			return true; // Password changed successfully
		}
		return false; // Old password is incorrect
	}

	@Override
	public String generateResetToken(String email) {
		String token = UUID.randomUUID().toString();

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
				User user = userRepository.findUserByEmail(rt.getEmail());

				if (user != null) {
					// Update password and save
					user.setPassword(newPassword);
					userRepository.save(user);
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
}
