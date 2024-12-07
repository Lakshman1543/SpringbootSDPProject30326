package com.klef.jfsd.springboot.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Curator;

@Repository
public interface CuratorRepository extends JpaRepository<Curator, Integer>  
{
	@Query("select c from Curator c where c.username=?1 and c.password=?2")
	public Curator checkcuratorlogin(String cusername,String pwd);

	@Query("SELECT c FROM Curator c WHERE c.email =?1")
	public Curator findCuratorByEmail(String email);
	
	public Optional<Curator> findByEmail(String email);
}
