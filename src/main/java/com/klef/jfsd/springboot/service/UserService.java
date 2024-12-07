package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.User;

public interface UserService 
{
	public String UserRegistration(User u);
	public User checkuserlogin(String eemail,String pwd);
	public User displayUserByID(int uid);
	public String updateUserProfile(User user);
	
	public String updateAccountSettings(User user);
    public boolean changePassword(User user, String oldPassword, String newPassword);
    
    // To Generate a reset token for the email
    public String generateResetToken(String email);
    
   // To Validate if the token is valid and not expired
    public boolean validateResetToken(String token);
    public void updatePassword(String token, String newPassword);
    public void deleteResetToken(String token);
    
    // Optional: Check if the token is expired
    public boolean isTokenExpired(String token);
}
