package com.h1.mycardeepdive.global.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfiguration implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("https://*.make-my-car.shop", "http://*.make-my-car.shop", "http://localhost:5173", "https://make-my-car.shop", "http://make-my-car.shop")
                .allowedMethods("*");
    }
}