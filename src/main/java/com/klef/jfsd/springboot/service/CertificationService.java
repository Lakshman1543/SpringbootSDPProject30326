package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Certification;

public interface CertificationService {
	
	public String AddCertification(Certification certification);
	public List<Certification> ViewAllCertificates();
	public Certification ViewCertificationByID(int certificationId);
	public List<Certification> getCertificationsByUserId(int userId);
	public String updateCertification(Certification certification);
	public Certification getCertificationById(int certId);
}
