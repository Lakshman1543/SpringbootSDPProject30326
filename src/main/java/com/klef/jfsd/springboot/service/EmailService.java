package com.klef.jfsd.springboot.service;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.model.ResetToken;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CuratorRepository;
import com.klef.jfsd.springboot.repository.ResetTokenRepository;
import com.klef.jfsd.springboot.repository.UserRepository;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

	 @Autowired
	 private AdminRepository adminRepository;
	 
	@Autowired
    private ResetTokenRepository resetTokenRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CuratorRepository curatorRepository;
	
    @Autowired
    private JavaMailSender mailSender;

    public void sendCuratorDetails(String toEmail, String name, String username, String password) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("Welcome to the Platform");
        message.setText("Dear " + name + ",\n\n"
                + "You have been registered as a curator on our platform.\n\n"
                + "Here are your credentials:\n"
                + "Username: " + username + "\n"
                + "Password: " + password + "\n\n"
                + "Please log in and update your profile.\n\n"
                + "Best regards,\nAdmin Team");

        mailSender.send(message);
    }
    
    public void sendResetLink(String email, String resetLink) {
        try {
            //String roleLabel = role.substring(0, 1).toLowerCase() + role.substring(1);
            
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject(" Password Reset Request");
            message.setText("Dear Curator" + ",\n\n" +
                            "We received a request to reset your password. Please use the link below:\n\n" +
                            resetLink + "\n\n" +
                            "If you did not request this, please ignore this email.\n\n" +
                            "Thanks,\nYour Team");
            
            mailSender.send(message);
            System.out.println("reset link sent successfully to " + email);
        } 
        catch (Exception e) {
            System.err.println("Error while sending email"  + ": " + e.getMessage());
        }
    }
    
	/*
	 * public void sendResetOtp(String email, String otp) { try { SimpleMailMessage
	 * message = new SimpleMailMessage(); message.setTo(email);
	 * message.setSubject("Password Reset OTP Request");
	 * message.setText("Dear Curator,\n\n" +
	 * "We received a request to reset your password. Please use the OTP below to proceed:\n\n"
	 * + "Your OTP: " + otp + "\n\n" + "This OTP is valid for 10 minutes.\n\n" +
	 * "If you did not request this, please ignore this email.\n\n" +
	 * "Thanks,\nYour Team");
	 * 
	 * mailSender.send(message); System.out.println("OTP sent successfully to " +
	 * email); } catch (Exception e) {
	 * System.err.println("Error while sending OTP email" + ": " + e.getMessage());
	 * } }
	 */

    
    public void sendResetLinkdebug(String email, String resetLink) {
        System.out.println("Sending email to " + email + " with reset link: " + resetLink);
    }
    
    public String findRoleByEmail(String email) {
        if (adminRepository.findByEmail(email).isPresent()) {
            return "Admin";
        } else if (userRepository.findByEmail(email).isPresent()) {
            return "User";
        } else if (curatorRepository.findByEmail(email).isPresent()) {
            return "Curator";
        }
        return null;
    }

    public String generateAndSendResetLink(String email, String role) {
        String token = UUID.randomUUID().toString();
        LocalDateTime createdAt = LocalDateTime.now();
        LocalDateTime expiresAt = createdAt.plusMinutes(5);

        // Save the reset token in the ResetToken table
        ResetToken resetToken = new ResetToken();
        resetToken.setToken(token);
        resetToken.setEmail(email);
        resetToken.setCreatedAt(createdAt);
        resetToken.setExpiresAt(expiresAt);
        resetTokenRepository.save(resetToken); // Assume `resetTokenRepo` is a JPA repository for `ResetToken`

        // Use the deployed URL instead of the local URL
        String resetLink = "https://skillcertify.up.railway.app/resetpassword?token=" + token + "&role=" + role;
        sendEmail(email, "Reset Password", "Click this link to reset your password: " + resetLink);
        return resetLink;
    }

    
    @PostMapping("resetpassword")
    public ResponseEntity<String> resetPassword(@RequestParam String token, @RequestParam String role, @RequestParam String newPassword) {

        Optional<ResetToken> resetTokenOptional = resetTokenRepository.findByToken(token);

        if (!resetTokenOptional.isPresent()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid or expired token!");
        }

        ResetToken resetToken = resetTokenOptional.get();
        String email = resetToken.getEmail();

        // Validate token (check if the token matches and hasn't expired)
        if (!validateToken(email, token)) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid or expired token!");
        }

        // Update the password for the corresponding role
        switch (role) {
            case "Admin":
                Admin admin = adminRepository.findByEmail(email).orElse(null);
                if (admin != null) {
                    admin.setPassword(newPassword);
                    adminRepository.save(admin);
                }
                break;
            case "User":
                User user = userRepository.findByEmail(email).orElse(null);
                if (user != null) {
                    user.setPassword(newPassword);
                    userRepository.save(user);
                }
                break;
            case "Curator":
                Curator curator = curatorRepository.findByEmail(email).orElse(null);
                if (curator != null) {
                    curator.setPassword(newPassword);
                    curatorRepository.save(curator);
                }
                break;
            default:
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid role specified!");
        }

        // Delete the token after successful reset
        resetTokenRepository.delete(resetToken);

        return ResponseEntity.ok("Password reset successful!");
    }

    
    private boolean validateToken(String email, String token) {
        // Fetch the reset token for the provided email
        Optional<ResetToken> resetTokenOptional = resetTokenRepository.findByEmail(email);

        if(resetTokenOptional.isPresent()) {
            ResetToken resetToken = resetTokenOptional.get();

            return resetToken.getToken().equals(token) && resetToken.getExpiresAt().isAfter(LocalDateTime.now());
        }

        return false;
    }

    public void sendEmail(String to, String subject, String body) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setFrom("2200030326cse@gmail.com"); // Replace with your email
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(body, true);

            mailSender.send(message);

        } 
        catch (MailException | MessagingException e) {
            e.printStackTrace();
        }
    }
}
