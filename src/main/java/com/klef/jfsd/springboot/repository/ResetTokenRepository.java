package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.ResetToken;

import java.util.Optional;

@Repository
public interface ResetTokenRepository extends JpaRepository<ResetToken, Long> 
{
	@Query("SELECT r FROM ResetToken r WHERE r.token=?1")
	public ResetToken FindByToken(String token);
	
    public Optional<ResetToken> findByToken(String token);
    public Optional<ResetToken> findByEmail(String email);
    public void deleteByToken(String token);
}