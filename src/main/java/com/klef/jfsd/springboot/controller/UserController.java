package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Certification;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.service.CertificationService;
import com.klef.jfsd.springboot.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private CertificationService certificationService;

//	@GetMapping("/")
//	public ModelAndView home() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("index");
//		return mv;
//	}

	@GetMapping("userreg")
	public ModelAndView userreg() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userreg");
		return mv;
	}

	@GetMapping("userlogin")
	public ModelAndView userlogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userlogin");
		return mv;
	}

	@PostMapping("insertuser")
	public ModelAndView insertuser(HttpServletRequest request) {
		int id = (int) (Math.random() * 9000) + 1000;
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String location = request.getParameter("location");
		String email = request.getParameter("email");
		String password = request.getParameter("pwd");
		String contact = request.getParameter("phoneNumber");
		String accstatus = "Registered";
		String role = "user";

		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setGender(gender);
		user.setLocation(location);
		user.setEmail(email);
		user.setPassword(password);
		user.setContact(contact);
		user.setAccountstatus(accstatus);
		user.setRole(role);

		String msg = userService.UserRegistration(user);

		ModelAndView mv = new ModelAndView("regsuccess");
		mv.addObject("message", msg);

		return mv;
	}

	@PostMapping("checkuserlogin")
	public ModelAndView checkuserlogin(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String eemail = request.getParameter("email");
		String pwd = request.getParameter("pwd");

		User user = userService.checkuserlogin(eemail, pwd);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			mv.setViewName("userhome");
			mv.addObject("message", "Login Success");
		} else {
			mv.setViewName("userlogin");
			mv.addObject("message", "Login Failed");
		}
		return mv;
	}

	@GetMapping("userhome")
	public ModelAndView userhome(HttpSession session, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		ModelAndView mv = new ModelAndView();

		if (user == null) {
			mv.setViewName("login");
			return mv;
		}

		int userId = user.getId();
		List<Certification> certifications = certificationService.getCertificationsByUserId(userId);
		System.out.println(certifications.size());
		mv.addObject("certifications", certifications);
		mv.setViewName("userhome");
		return mv;
	}

	@GetMapping("userprofile")
	public ModelAndView userprofile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userprofile");
		return mv;
	}

	@GetMapping("contactus")
	public ModelAndView contactus() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("contactus");
		return mv;
	}

	@GetMapping("userlogout")
	public ModelAndView userlogout(HttpServletRequest request) {

		HttpSession session = request.getSession(false);

		session.removeAttribute("user");

		// session.invalidate(); // remove all session attributes

		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	@GetMapping("updateuser")
	public ModelAndView updateuser() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateuser");
		return mv;
	}

	@PostMapping("updateuserprofile")
	public ModelAndView updateuserprofile(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String password = request.getParameter("pwd");
			String location = request.getParameter("location");
			String contact = request.getParameter("contact");

			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setGender(gender);
			user.setPassword(password);
			user.setLocation(location);
			user.setContact(contact);

			String msg = userService.updateUserProfile(user);

			User u = userService.displayUserByID(id);

			HttpSession session = request.getSession();
			session.setAttribute("user", u);

			mv.setViewName("updatesuccess");
			mv.addObject("message", msg);

		} catch (Exception e) {
			mv.setViewName("updateerror");
			mv.addObject("message", e);
		}
		return mv;
	}

	@GetMapping("usersessionexpiry")
	public ModelAndView usersessionexpiry() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("usersessionexpiry");
		return mv;
	}

	// Account Settings methods

	@GetMapping("accountsettings")
	public ModelAndView showAccountSettings(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		if (user != null) {
			mv.addObject("user", user);
			mv.setViewName("accountsettings");
		} else {
			mv.setViewName("login");
		}
		return mv;
	}

	// Update Account Details (Post)
	@PostMapping("updateaccount")
	public ModelAndView updateAccount(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		try {
			HttpSession session = request.getSession(false);
			User currentUser = (User) session.getAttribute("user");
			if (currentUser != null) {
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String contact = request.getParameter("contact");

				currentUser.setName(name);
				currentUser.setEmail(email);
				currentUser.setContact(contact);

				String msg = userService.updateAccountSettings(currentUser);
				session.setAttribute("user", currentUser); // Update session with new user details

				mv.setViewName("updatesuccess");
				mv.addObject("message", msg);
			} else {
				mv.setViewName("login");
			}
		} catch (Exception e) {
			mv.setViewName("updateerror");
			mv.addObject("message", e.getMessage());
		}
		return mv;
	}

	// Change Password
	@PostMapping("changepassword")
	public ModelAndView changePassword(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		try {
			HttpSession session = request.getSession(false);
			User currentUser = (User) session.getAttribute("user");
			if (currentUser != null) {
				String oldPassword = request.getParameter("oldpassword");
				String newPassword = request.getParameter("newpassword");

				boolean passwordChanged = userService.changePassword(currentUser, oldPassword, newPassword);
				if (passwordChanged) {
					mv.setViewName("updatesuccess");
					mv.addObject("message", "Password changed successfully.");
				} else {
					mv.setViewName("updateerror");
					mv.addObject("message", "Old password is incorrect.");
				}
			} else {
				mv.setViewName("login");
			}
		} catch (Exception e) {
			mv.setViewName("updateerror");
			mv.addObject("message", e.getMessage());
		}
		return mv;
	}

	@GetMapping("addcertification")
	public ModelAndView addcertification() {
		ModelAndView mv = new ModelAndView("addcertification");
		return mv;
	}

	@PostMapping("insertcertification")
	public ModelAndView insertCertification(HttpServletRequest request,
			@RequestParam("certificatefile") MultipartFile file, HttpSession session) throws Exception {
		String msg = null;

		ModelAndView mv = new ModelAndView();

		try {
			// Generate random certification ID
			int certificationId = (int) (Math.random() * 100000);
			String certificationname = request.getParameter("certificationname");
			String issuedBy = request.getParameter("issuedBy");
			String issuedate = request.getParameter("issuedate");
			String expirydate = request.getParameter("expirydate");
			String status = request.getParameter("status");

			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			// Retrieve the logged-in user from the session
			User user = (User) session.getAttribute("user");

			// Ensure user is logged in before proceeding
			if (user == null) {
				msg = "User not logged in.";
				mv.setViewName("certificationerror");
				mv.addObject("message", msg);
				return mv;
			}

			// Create the Certification object
			Certification cert = new Certification();
			cert.setCertificationId(certificationId);
			cert.setCertificationname(certificationname);
			cert.setIssuedBy(issuedBy);
			cert.setIssuedate(issuedate);
			cert.setExpirydate(expirydate);
			cert.setStatus(status);
			cert.setCertificatefile(blob);

			// Set the user ID for the certification
			cert.setUser(user); // Assuming user has getId() method that returns the user's ID

			// Add certification to the database
			msg = certificationService.AddCertification(cert);
			System.out.println(msg);

			mv.setViewName("addcertification");
			mv.addObject("message", msg);
		} catch (Exception e) {
			msg = e.getMessage();
			System.out.println(msg);
			mv.setViewName("certificationerror");
			mv.addObject("message", msg);
		}
		return mv;
	}

	@GetMapping("viewallcertifications")
	public ModelAndView viewallcertifications() {
		List<Certification> certlist = certificationService.ViewAllCertificates();
		ModelAndView mv = new ModelAndView("viewallcertificates");
		mv.addObject("certlist", certlist);
		return mv;
	}

	// Endpoint for viewing the certificate in a new tab
	@GetMapping("viewcertfile")
	public void viewCertificateFile(@RequestParam("id") int certificationId, HttpServletResponse response) {
		try {
			Certification cert = certificationService.ViewCertificationByID(certificationId);
			Blob certificateBlob = cert.getCertificatefile();

			if (certificateBlob != null) {
				response.setContentType("application/pdf");
				response.setHeader("Content-Disposition", "inline; filename=certificate_" + certificationId + ".pdf");

				InputStream inputStream = certificateBlob.getBinaryStream();
				inputStream.transferTo(response.getOutputStream());
				response.flushBuffer();
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Certificate file not found.");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// Endpoint for downloading the certificate
	@GetMapping("downloadcertfile")
	public void downloadCertificateFile(@RequestParam("id") int certificationId, HttpServletResponse response) {
		try {
			Certification certification = certificationService.ViewCertificationByID(certificationId);
			Blob certificateBlob = certification.getCertificatefile();

			if (certificateBlob != null) {
				response.setContentType("application/pdf");
				response.setHeader("Content-Disposition",
						"attachment; filename=certificate_" + certificationId + ".pdf");

				InputStream is = certificateBlob.getBinaryStream();
				is.transferTo(response.getOutputStream());
				response.flushBuffer();
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Certificate file not found.");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@GetMapping("updatecertform")
	public ModelAndView showUpdateCertForm(@RequestParam("id") int certId) {
		ModelAndView mv = new ModelAndView("updatecertform");
		Certification cert = certificationService.getCertificationById(certId);
		mv.addObject("certification", cert);
		return mv;
	}

	@PostMapping("updatecert")
	public String updateCertification(HttpServletRequest request, @RequestParam("certificatefile") MultipartFile file) throws IOException, SerialException, SQLException {

		int certificationId = Integer.parseInt(request.getParameter("certificationId"));
		String cname = request.getParameter("certname");
		String issuedby = request.getParameter("issuedBy");
		String issuedate = request.getParameter("issuedate");
		String expirydate = request.getParameter("expirydate");
		String status = request.getParameter("status");
		
		byte[] bytes = file.getBytes();
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

		Certification certification = new Certification();
		certification.setCertificationId(certificationId);
		certification.setCertificationname(cname);
		certification.setIssuedBy(issuedby);
		certification.setIssuedate(issuedate);
		certification.setExpirydate(expirydate);
		certification.setStatus(status);
		certification.setCertificatefile(blob);
	
		certificationService.updateCertification(certification);
		return "redirect:/viewallcertifications"; // Redirect to the certifications list
	}

	@GetMapping("aboutus")
	  public ModelAndView aboutus() {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("aboutus");
	    return mv;
	  }
}
