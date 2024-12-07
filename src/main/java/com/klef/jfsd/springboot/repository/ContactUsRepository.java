package com.klef.jfsd.springboot.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Contactus;

@Repository
public interface ContactUsRepository extends JpaRepository<Contactus, Integer>{

  public Optional<Contactus> findById(Long id);

}