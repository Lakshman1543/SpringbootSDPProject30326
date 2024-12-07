package com.klef.jfsd.springboot.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.User;

import jakarta.transaction.Transactional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>
{
	@Query("select u from User u where u.email = ?1 and u.password = ?2")
	public User checkuserlogin(String eemail, String pwd);

	@Query("update User e set e.accountstatus=?1 where e.id=?2")
	@Modifying  // DML
	@Transactional // to enable auto commit
	public int updateuserstatus(String accountstatus,int uid);
	
	public Optional<User> findByEmail(String email);

	@Query("SELECT u FROM User u WHERE u.email =?1")
	public User findUserByEmail(String email);
	
}
