package com.jamesluty.loginandreg.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.jamesluty.loginandreg.models.LoginUser;
import com.jamesluty.loginandreg.models.User;
import com.jamesluty.loginandreg.repos.UserRepo;

@Service
public class UserService {

	@Autowired
	private UserRepo userRepo;
	
//	Login and Registration
	public User register(User newUser, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		
		if(userRepo.findByEmail(newUser.getEmail()).isPresent()) {
			result.rejectValue("email", "unique", "Email already exist!");
		}
		
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "match", "Password must match");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
		String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashedPassword);
		
		return userRepo.save(newUser);
	}
	
	public User login(LoginUser newLogin, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		
		Optional<User> optUser = userRepo.findByEmail(newLogin.getEmail());
		if(!optUser.isPresent()) {
			result.rejectValue("email", "unique", "Invalid Credentials");
			return null;
		}
		
		User user = optUser.get();
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "match", "Invalid Credentials");
			return null;
		}
		
		return user;
	}
	
	public User getOne(Long id) {
		return userRepo.findById(id).orElse(null);
	}
}
