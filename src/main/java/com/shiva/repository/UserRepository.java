package com.shiva.repository;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.shiva.entity.UserEntity;
@Repository
public interface UserRepository extends JpaRepository<UserEntity,Serializable> {
	@Query("select u from UserEntity u WHERE LOWER(u.username) = LOWER(?1)")
	List<UserEntity> findByName(String uname);
}
