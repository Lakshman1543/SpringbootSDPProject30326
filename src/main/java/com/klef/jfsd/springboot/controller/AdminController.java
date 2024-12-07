package com.klef.jfsd.springboot.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.PasswordGenerator;
import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Certification;
import com.klef.jfsd.springboot.model.Contactus;
import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.model.TrainingCourse;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.CertificationService;
import com.klef.jfsd.springboot.service.CuratorService;
import com.klef.jfsd.springboot.service.EmailService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private EmailService emailService;
	
	@Autowired
	private CuratorService curatorService;
	
	@Autowired
	private CertificationService certificationService;

	@GetMapping("adminlogin")
	public ModelAndView adminlogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}

	@GetMapping("viewallusers")
	public ModelAndView viewallemps() {
		ModelAndView mv = new ModelAndView();
		List<User> userlist = adminService.ViewAllUsers();
		mv.setViewName("viewallusers");
		mv.addObject("userlist", userlist);

		long count = adminService.usercount();
		mv.addObject("count", count);

		return mv;
	}

	@GetMapping("deleteuser")
	public ModelAndView deleteuser() {
		ModelAndView mv = new ModelAndView();
		List<User> userlist = adminService.ViewAllUsers();
		mv.setViewName("deleteuser");
		mv.addObject("userlist", userlist);
		return mv;
	}

	@GetMapping("delete")
	public String deleteoperation(@RequestParam("id") int uid) {
		adminService.deleteuser(uid);

		return "redirect:/deleteuser"; // redirection to specific path
	}

	@GetMapping("updateuserstatus")
	public ModelAndView updateuserstatus() {
		ModelAndView mv = new ModelAndView();
		List<User> userlist = adminService.ViewAllUsers();
		mv.setViewName("updateuserstatus");
		mv.addObject("userlist", userlist);
		return mv;
	}

	  @GetMapping("updatestatus")
	     public String updatestatus(@RequestParam("id") int eid,@RequestParam("accountstatus") String accountstatus)
	     {
	      adminService.updateuserstatus(accountstatus, eid);
	      return "redirect:/updateuserstatus";
	       
	     }

	@PostMapping("checkadminlogin")
	// @ResponseBody
	public ModelAndView checkadminlogin(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String auname = request.getParameter("auname");
		String apwd = request.getParameter("apwd");

		Admin admin = adminService.checkadminlogin(auname, apwd);

		if (admin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);

			mv.setViewName("adminhome");

			long count = adminService.usercount();
			mv.addObject("count", count);
		} else {
			mv.setViewName("adminloginfail");
		}
		return mv;
	}
	@GetMapping("contactmessages")
	  public ModelAndView contactmessages() {
	    ModelAndView mv = new ModelAndView();
	    List<Contactus> qlist = adminService.getAllContactMessages();
	    mv.setViewName("contactmessages");
	    mv.addObject("qlist", qlist);
	    return mv;
	  }
	    
	    @PostMapping("addconmessage")
	  public ModelAndView addconmessage(HttpServletRequest request) {
	    Contactus cm = new Contactus();
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String contact = request.getParameter("contact");
	    String subject = request.getParameter("subject");
	    String msg = request.getParameter("message");

	    cm.setName(name);
	    cm.setEmail(email);
	    cm.setContact(contact);
	    cm.setSubject(subject);
	    cm.setMessage(msg);

	    String message = adminService.addcontactus(cm);

	    ModelAndView mv = new ModelAndView("contactus");
	    mv.addObject("message", msg);

	    return mv;
	  }

	@GetMapping("adminhome")
	public ModelAndView adminhome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");

		long count = adminService.usercount();
		mv.addObject("count", count);

		return mv;
	}

	@GetMapping("adminlogout")
	public ModelAndView adminlogout(HttpServletRequest request) {

		HttpSession session = request.getSession(false);

		session.removeAttribute("admin");
		request.getSession().invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}

	@GetMapping("analytics")
	public ModelAndView analytics() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("analytics");
		long count = adminService.usercount();
		mv.addObject("count", count);
		return mv;
	}

	@GetMapping("training")
    public String viewTrainingCourses(Model model) {
        List<TrainingCourse> courses = curatorService.viewAllTrainingCourses();
        model.addAttribute("courses", courses);
        return "training";
    }

	@GetMapping("adminsessionexpiry")
	public ModelAndView adminsessionexpiry() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminsessionexpiry");
		return mv;
	}

	@GetMapping("addcurator")
	public ModelAndView addcurator() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addcurator");
		return mv;
	}

	@PostMapping("insertcurator")
	public ModelAndView insertcurator(HttpServletRequest request,@RequestParam("curatorimage") MultipartFile file) throws Exception{
		Curator curator = new Curator();
		int id = (int) (Math.random() * 9000) + 1000;
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String generatedPassword = PasswordGenerator.generateRandomPassword();
		String contact = request.getParameter("contact");
		String role = "curator";
		 byte[] bytes = file.getBytes();
		  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

		curator.setId(id);
		curator.setName(name);
		curator.setGender(gender);
		curator.setEmail(email);
		curator.setUsername(username);
		curator.setPassword(generatedPassword);
		curator.setContact(contact);
		curator.setRole(role);
		curator.setImage(blob);

		String msg = adminService.addCurator(curator);

		 emailService.sendCuratorDetails(curator.getEmail(), curator.getName(), curator.getUsername(), curator.getPassword());
		
		ModelAndView mv = new ModelAndView("curatorsuccess");
		mv.addObject("message", msg);

		return mv;
	}
	@GetMapping("viewcertifications")
	public ModelAndView viewallcertifications() {
		List<Certification> certlist = certificationService.ViewAllCertificates();
		ModelAndView mv = new ModelAndView("viewcertifications");
		mv.addObject("certlist", certlist);
		return mv;
	}

	@GetMapping("viewallcurators")
	public ModelAndView viewallcurators() {
		ModelAndView mv = new ModelAndView();
		List<Curator> clist = adminService.viewAllCurators();
		mv.setViewName("viewallcurators");
		mv.addObject("clist", clist);
		return mv;
	}
	
	@GetMapping("displaycuratorimage")
	public ResponseEntity<byte[]> displaycuratorimage(@RequestParam int id) throws Exception
	{
	  Curator curator =  curatorService.ViewCuratorById(id);
	  byte [] imageBytes = null;
	  imageBytes = curator.getImage().getBytes(1,(int) curator.getImage().length());

	  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	  
	// Response Body, HTTP Status Code, Headers
	}

	@GetMapping("deletecurator")
	public ModelAndView deletecurator() {
		ModelAndView mv = new ModelAndView();
		List<Curator> clist = adminService.viewAllCurators();
		mv.setViewName("deletecurator");
		mv.addObject("clist", clist);
		return mv;
	}

	@PostMapping("/deleteCurator/{id}")
    public String deleteCurator(@PathVariable int id) {
        try {
            curatorService.deleteCurator(id);  // Delete the curator by ID
        } catch (RuntimeException e) {
            // Handle exception, maybe add a flash message or error page
            return "redirect:/error";  // Redirect to error page if curator not found
        }
        return "redirect:/viewallcurators";  // Redirect to the list of curators
    }

	@GetMapping("managecurators")
	public String manageCurators(Model model) {
		List<Curator> curators = adminService.viewAllCurators();
		model.addAttribute("curators", curators);
		return "managecurators";
	}

    @GetMapping("/editcurator/{id}")
    public String editCurator(@PathVariable("id") int id, Model model) {
        Curator curator = adminService.displayCuratorById(id);
        model.addAttribute("curator", curator);
        return "editcurator"; 
    }

    @PostMapping("/updatecurator")
    public String updateCurator(@ModelAttribute("curator") Curator curator) {
        adminService.updateCurator(curator);
        return "redirect:/viewallcurators"; 
    }

}
