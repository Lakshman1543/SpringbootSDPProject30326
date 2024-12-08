package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.model.ForgotPassword;
import com.klef.jfsd.springboot.model.TrainingCourse;
import com.klef.jfsd.springboot.repository.CuratorRepository;
import com.klef.jfsd.springboot.repository.UserRepository;
import com.klef.jfsd.springboot.service.CuratorService;
import com.klef.jfsd.springboot.service.EmailService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CuratorController {

	@Autowired
	private CuratorService curatorService;
	
	@Autowired
    private EmailService emailService;
	
	@Autowired
	private CuratorRepository curatorRepository;
	
	@Autowired
	private UserRepository userRepository;

	@GetMapping("curatorlogin")
	public ModelAndView curatorlogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("curatorlogin");
		return mv;
	}
	@GetMapping("curatorsessionexpiry")
	public ModelAndView curatorsessionexpiry() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("curatorsessionexpiry");
		return mv;
	}

	@PostMapping("checkcuratorlogin")
	public ModelAndView checkcuratorlogin(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cusername = request.getParameter("username");
		String cpwd = request.getParameter("password");

		Curator curator = curatorService.checkcuratorlogin(cusername, cpwd);

		if (curator != null) {
			HttpSession session = request.getSession();
			session.setAttribute("curator", curator);
			mv.setViewName("curatorhome");
		} else {
			mv.setViewName("curatorloginfail");
		}
		return mv;
	}

	@GetMapping("curatorhome")
	public ModelAndView curatorhome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("curatorhome");
		long count = curatorService.ccount();
		mv.addObject("count", count);
		return mv;
	}

	@GetMapping("addtrainingcourse")
	public String addtrainingcourse(Model model) {
		model.addAttribute("trainingCourse", new TrainingCourse());
		return "addtrainingcourse";
	}

	@PostMapping("inserttrainingcourse")
	public ModelAndView inserttrainingcourse(@ModelAttribute("trainingCourse") TrainingCourse trainingCourse,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Curator curator = (Curator) session.getAttribute("curator");

		trainingCourse.setAddedBy(curator);
		System.out.println(trainingCourse.getAddedBy());
		String msg = curatorService.addTrainingCourse(trainingCourse);
		mv.setViewName("trainingsuccess");
		mv.addObject("message", msg);

		return mv;
	}

	@GetMapping("viewalltrainingcourses")
	public ModelAndView viewalltrainingcourses() {
		List<TrainingCourse> courses = curatorService.viewAllTrainingCourses();
		ModelAndView mv = new ModelAndView("viewalltrainingcourses");
		mv.addObject("courses", courses);
		return mv;
	}

	@GetMapping("deletecourse")
	public ModelAndView deletecourse() {
		ModelAndView mv = new ModelAndView();
		List<TrainingCourse> courses = curatorService.viewAllTrainingCourses();
		mv.setViewName("deletecourse");
		mv.addObject("courses", courses);
		return mv;
	}

	@GetMapping("managecourses")
	public ModelAndView managecourses() {
		List<TrainingCourse> courses = curatorService.viewAllTrainingCourses();
		ModelAndView mv = new ModelAndView("managecourses");
		mv.addObject("courses", courses);
		return mv;
	}

	@GetMapping("updatecourse")
	public ModelAndView updatecourse(@RequestParam("courseId") int id) {
	    ModelAndView mv = new ModelAndView();
	    TrainingCourse trainingCourse = curatorService.displayTrainingCourseById(id);
	    if (trainingCourse == null) {
	        mv.setViewName("error");
	        mv.addObject("message", "Course not found.");
	        return mv;
	    }
	    mv.addObject("trainingCourse", trainingCourse);
	    mv.setViewName("updatecourse");
	    return mv;
	}


	@PostMapping("updatetrainingcourse")
	public ModelAndView updateTrainingCourse(@ModelAttribute("trainingCourse") TrainingCourse trainingCourse) {
		ModelAndView mv = new ModelAndView();
		try {
			String msg = curatorService.updateTrainingCourse(trainingCourse);
			mv.setViewName("updatesuccess");
			mv.addObject("message", msg);
		} 
		catch (Exception e) {
			mv.setViewName("updateerror");
			mv.addObject("message", e.getMessage());
		}
		return mv;
	}

	@PostMapping("/deletecurator/{id}")
	public String deleteCurator(@PathVariable int id) {
	    curatorService.deleteCurator(id);
	    return "redirect:/viewallcurators";
	}


	@GetMapping("forgotpassword")
	public ModelAndView showForgotPasswordPage(Model model) {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("forgotpassword");
	    return mv;
	}
	
	@GetMapping("resetpassword")
	public ModelAndView resetpasswordpage(@RequestParam("token") String token, Model m) {
		ModelAndView mv = new ModelAndView();
		m.addAttribute("reset", new ForgotPassword());
	    
		boolean isValid = curatorService.validateResetToken(token);

		if (isValid) {
			mv.setViewName("resetpassword");
			mv.addObject("token", token);
		} 
		else {
			mv.setViewName("resetpassworderror");
			mv.addObject("message", "Invalid or expired reset token.");
		}
		return mv;
	}

	@PostMapping("resetpassword")
	public ModelAndView resetPassword(@RequestParam("token") String token,@RequestParam("newPassword") String newPassword) {
		ModelAndView mv = new ModelAndView();
		try {
			curatorService.updatePassword(token, newPassword);
			mv.setViewName("resetpasswordsuccess");
			mv.addObject("message", "Password reset successfully.");
		} 
		catch (Exception e) {
			mv.setViewName("resetpassworderror");
			mv.addObject("message", "Error: " + e.getMessage());
		}
		return mv;
	}
	
	@PostMapping("/sendResetLink")
    public ModelAndView sendResetLink(@RequestParam("email") String email) {
        ModelAndView mv = new ModelAndView();
        try {
            String token = curatorService.generateResetToken(email); // Generate token for password reset
            String resetLink = "https://skillcertify.up.railway.app/resetpassword?token=" + token;

            // Send reset link via email
            emailService.sendResetLink(email, resetLink);

            mv.setViewName("forgotpasswordsuccess");
            mv.addObject("message", "Password reset link sent to your email.");
        } catch (Exception e) {
            mv.setViewName("forgotpassworderror");
            mv.addObject("message", "Error: " + e.getMessage());
        }
        return mv;
    }
}
