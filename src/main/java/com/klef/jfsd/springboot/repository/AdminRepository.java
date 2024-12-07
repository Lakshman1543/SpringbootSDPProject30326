package com.klef.jfsd.springboot.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.klef.jfsd.springboot.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, String>
{
	@Query("select a from Admin a where a.username=?1 and a.password=?2")
	public Admin checkadminlogin(String uname,String pwd);
	
	@Query("delete from User u where u.contact=?1")
	@Modifying
	@Transactional
	public int deleteuserbyId(String contact);
	public Optional<Admin> findByEmail(String email);
}
