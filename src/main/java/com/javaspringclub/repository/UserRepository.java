package com.javaspringclub.repository;

import org.springframework.data.repository.CrudRepository;

import com.javaspringclub.entity.User;


public interface UserRepository extends CrudRepository<User, Long> {

}
