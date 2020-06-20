package com.javaspringclub.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaspringclub.entity.User;
import com.javaspringclub.repository.UserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	private static String password = "123456789";
	
	// Implementing Constructor based DI
	private UserRepository repository;

	public UserServiceImpl() {

	}

	public static String getPassword() {
		return password;
	}

	public static void setPassword(String password) {
		UserServiceImpl.password = password;
	}



	@Autowired
	public UserServiceImpl(UserRepository repository) {
		super();
		this.repository = repository;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> list = new ArrayList<User>();
		repository.findAll().forEach(e -> list.add(e));
		return list;
	}

	@Override
	public User getUserById(Long id) {
		User user = repository.findById(id).get();
		return user;
	}

	@Override
	public boolean saveUser(User user) {
		try {
			repository.save(user);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}

	@Override
	public boolean deleteUserById(Long id) {
		try {
			repository.deleteById(id);
			return true;
		} catch (Exception ex) {
			return false;
		}

	}

	public boolean userExists(Long id, String name) {
		User user = getUserById(id);

		if (name.equals(user.getName()))
			return true;

		return false;
	}
	
	public boolean equalsAdminPassword(String password) {
		
		if(this.password.equals(password))
			return true;
		return false;
	}

}
