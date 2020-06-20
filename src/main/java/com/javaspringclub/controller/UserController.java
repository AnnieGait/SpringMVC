package com.javaspringclub.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javaspringclub.entity.User;
import com.javaspringclub.model.ChatMessage;
import com.javaspringclub.service.UserService;

@Controller
public class UserController {
	// Constructor based Dependency Injection
	private UserService userService;
	private ChatMessage chatMessage;
	private SimpMessageHeaderAccessor headerAccessor;

	public UserController() {

	}

	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}

/*	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public ModelAndView hello(HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		// kanei anafora sto home.jsp
		mv.setViewName("home");
		return mv;
	}*/
	
	// main.jsp
	// http://localhost:8080/SpringMVC_Hibernate_Setup/main
	@RequestMapping(value= {"/", "/main"}, method = RequestMethod.GET)
	public ModelAndView homePage(HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		
		return mv;
	}
	
	/*@RequestMapping(value = "/allUsers", method = RequestMethod.GET)
	public ModelAndView displayAllUsersForm() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}*/

	// Get All Users
	// emfanizei ton pinaka me olous tous xrhstes, sthn selida aythn
	// yparxoyn oi epiloges edit, delete ston pinaka me tous xrhstes
	// kai yparxei kai h entolh add User monh ths, poy se paei se allo 
	// parathyro
	// http://localhost:8080/SpringMVC_Hibernate_Setup/allUsers
	@RequestMapping(value = "/allUsers", method = RequestMethod.GET)
	public ModelAndView displayAllUser() {
		System.out.println("User Page Requested : All Users");
		ModelAndView mv = new ModelAndView();
		List<User> userList = userService.getAllUsers();
		mv.addObject("userList", userList);
		mv.setViewName("allUsers");
		return mv;
	}
	// gia to logIn.jsp
	@RequestMapping(value = "/logIn", method = RequestMethod.GET)
	public ModelAndView displayLogInForm() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	// doyleyei na mhn to svhsw
	@RequestMapping(value = "/logIn", method = RequestMethod.POST)
	public ModelAndView saveLoggedUser(Long id,  String name) {
		ModelAndView mv;
		if(userService.userExists(id, name))
			mv = new ModelAndView("chat");
		else
			mv = new ModelAndView("error");
		return mv;
	}
	//telos .
	
	// 1o test
	// oi 2 methodoi login get kai post einai to arhiko.
	
	
	// gia to logInAsAdmin.jsp
	@RequestMapping(value = "/logInAsAdmin", method = RequestMethod.GET)
	public ModelAndView displayLogInAsAdminForm() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping(value = "logInAsAdmin", method = RequestMethod.POST)
	public ModelAndView logInAsAdmin(String password) {
		ModelAndView mv;
		if(userService.equalsAdminPassword(password))
			mv = new ModelAndView("redirect:/allUsers");
		else {
			mv = new ModelAndView("redirect:/main");
			mv.addObject("passwordMessage", 
						"Wrong Password.");		
		}
				
		return mv;
	}
	
/*	@RequestMapping(value = "/logIn/{id}", method = RequestMethod.POST)
	public ModelAndView saveLoggedUser(@ModelAttribute User user, BindingResult result) {
		ModelAndView mv = new ModelAndView("redirect:/main");
		if (result.hasErrors()) {
			System.out.println(result.toString());
			return new ModelAndView("error");
		}
		boolean isSaved = userService.userExists(user.getId(), user.getName());
		if (!isSaved)
			return new ModelAndView("error");
		return mv;
	}*/
	
	
	// deixnei mono eisagwgv username. otan o xrhsths prospathei
	// na steilei mhnyma ton xanastelnei sto login.jsp
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public ModelAndView displayChat() {
		ModelAndView mv = new ModelAndView("chat");
		return mv;
	}
	
/*	@RequestMapping(value = "/chat", method = RequestMethod.POST)
	public ModelAndView displayChatRoom() {
		ChatController c = new ChatController();
		ChatMessage aMessage = new ChatMessage();
		ModelAndView mv = new ModelAndView("chat");
		
		return mv;
	}*/
	
	
	
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public ModelAndView displayNewUserForm() {
		ModelAndView mv = new ModelAndView("addUser");
		mv.addObject("headerMessage", "Add User Details");
		mv.addObject("user", new User());
		return mv;
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ModelAndView saveNewUser(@ModelAttribute User user, BindingResult result) {
		ModelAndView mv = new ModelAndView("redirect:/main");

		if (result.hasErrors()) {
			return new ModelAndView("error");
		}
		boolean isAdded = userService.saveUser(user);
		if (isAdded) {
			mv.addObject("message", "New user successfully added");
		} else {
			return new ModelAndView("error");
		}
		return mv;
	}


	@RequestMapping(value = "/editUser/{id}", method = RequestMethod.GET)
	public ModelAndView displayEditUserForm(@PathVariable Long id) {
		ModelAndView mv = new ModelAndView("/editUser");
		User user = userService.getUserById(id);
		// to "Edit User Details" fainetai sto tab
		// sto editUser.jsp eisagetai to mhnyma ws headerMessage
		mv.addObject("headerMessage", "Edit User Details");
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = "/editUser/{id}", method = RequestMethod.POST)
	public ModelAndView saveEditedUser(@ModelAttribute User user, BindingResult result) {
		ModelAndView mv = new ModelAndView("redirect:/allUsers");

		if (result.hasErrors()) {
			System.out.println(result.toString());
			return new ModelAndView("error");
		}
		boolean isSaved = userService.saveUser(user);
		if (!isSaved) {

			return new ModelAndView("error");
		}

		return mv;
	}

	// kanei delete xwris mhnyma epibebaiwshs, kai redirect:/allUsers
	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.GET)
	public ModelAndView deleteUserById(@PathVariable Long id) {
		boolean isDeleted = userService.deleteUserById(id);
		System.out.println("User deletion respone: " + isDeleted);
		ModelAndView mv = new ModelAndView("redirect:/allUsers");
		return mv;

	}

}
