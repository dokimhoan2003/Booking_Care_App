package com.project.configurations;

import com.project.filters.JwtTokenFilter;
import com.project.models.Role;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.util.Arrays;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import static org.springframework.http.HttpMethod.*;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final JwtTokenFilter jwtTokenFilter;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
          .sessionManagement(management -> management.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
          .authorizeHttpRequests(authorize -> authorize
            .requestMatchers(POST, "/api/auth/login").permitAll()
            // Api Users
            .requestMatchers(GET, "/api/users/**").permitAll()
            .requestMatchers(POST, "/api/users/search").permitAll()
            .requestMatchers(POST, "/api/users/").hasRole(Role.ADMIN)
            .requestMatchers(POST, "/api/users/change-password").hasAnyRole(Role.ADMIN, Role.DOCTOR)
            .requestMatchers(PUT, "/api/users/**").hasAnyRole(Role.ADMIN, Role.DOCTOR)
            .requestMatchers(DELETE, "/api/users/**").hasRole(Role.ADMIN)
            // Api Majors
            .requestMatchers(GET, "/api/majors/**").permitAll()
            .requestMatchers(POST, "/api/majors/").hasRole(Role.ADMIN)
            .requestMatchers(PUT, "/api/majors/**").hasRole(Role.ADMIN)
            .requestMatchers(DELETE, "/api/majors/**").hasRole(Role.ADMIN)
            // Api Bookings
            .requestMatchers(GET, "/api/bookings/confirm/{id}").permitAll()
            .requestMatchers(GET, "/api/bookings/").hasAnyRole(Role.ADMIN, Role.DOCTOR)
            .requestMatchers(POST, "/api/bookings/**").permitAll()
            .requestMatchers(PUT, "/api/bookings/**").hasRole(Role.DOCTOR)
            // Api Time
            .requestMatchers(POST, "/api/times/search").permitAll()
            .anyRequest().authenticated()  // Các request còn lại yêu cầu xác thực
          )
          .addFilterBefore(jwtTokenFilter, UsernamePasswordAuthenticationFilter.class)
          .csrf(csrf -> csrf.disable())
          .cors(cors -> cors.configurationSource(corsConfigrationSource()));

        return http.build();
    }

    @Bean
    public CorsConfigurationSource corsConfigrationSource() {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.addAllowedOrigin("http://localhost:3000");  // Cho phép mọi origin
        config.setAllowedHeaders(Arrays.asList(
          HttpHeaders.AUTHORIZATION,
          HttpHeaders.CONTENT_TYPE,
          HttpHeaders.ACCEPT
        ));
        config.setAllowedMethods(Arrays.asList(
          HttpMethod.GET.name(),
          HttpMethod.POST.name(),
          HttpMethod.PUT.name(),
          HttpMethod.DELETE.name(),
          HttpMethod.OPTIONS.name()
        ));
        config.setMaxAge(3600L);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return source;
    }
}
