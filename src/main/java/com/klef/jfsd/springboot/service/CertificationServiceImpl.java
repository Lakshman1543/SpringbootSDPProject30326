package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Certification;
import com.klef.jfsd.springboot.repository.CertificationRepository;

@Service
public class CertificationServiceImpl implements CertificationService {

	@Autowired
	private CertificationRepository certificationRepository;
	
	@Override	
	public String AddCertification(Certification certification) {
		certificationRepository.save(certification);
		return "Certification Added Successfully";
	}

	@Override
	public List<Certification> ViewAllCertificates() {
		return (List<Certification>) certificationRepository.findAll();
		
	}

	@Override
	public Certification ViewCertificationByID(int certificationId) {
		return certificationRepository.findById(certificationId).get();
	}

	@Override
	public List<Certification> getCertificationsByUserId(int userId) {
		return certificationRepository.findByUserId(userId);
	}
	
	@Override
	public String updateCertification(Certification certification) {
	    certificationRepository.save(certification);
	    return "Updated Successfully";
	}

	@Override
	public Certification getCertificationById(int certId) {
		return certificationRepository.findById(certId).get();
	}

}
