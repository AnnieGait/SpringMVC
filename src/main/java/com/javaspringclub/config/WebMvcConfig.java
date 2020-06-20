package com.javaspringclub.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.javaspringclub")
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp().prefix("/WEB-INF/views/").suffix(".jsp");
    }
    
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	/*ResourceHandlerRegistration resourceRegistration = registry.
    			addResourceHandler("resources/**");
    	resourceRegistration.addResourceLocations("/resources/**");
    	registry.addResourceHandler("/img/**").
    	addResourceLocations("/img/**");
    	registry.addResourceHandler("/resources/**").
    	addResourceLocations("/resources/");*/
    	
    	registry.addResourceHandler("/resources/**")
        .addResourceLocations("/resources/");
    }

}