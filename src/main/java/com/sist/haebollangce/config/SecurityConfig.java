package com.sist.haebollangce.config;

import com.sist.haebollangce.security.jwt.exception.CustomAuthenticationEntryPoint;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsUtils;

@Configuration
@RequiredArgsConstructor
public class SecurityConfig {

    // 'SpringSecurityConfig extends WebSecurityConfigurerAdapter' 클래스 내 @Override configure()  => 예전 방식
    // JWT Token 을 사용 -> HttpSession 사용하지 않음 -> 왜 그런지, JWT의 장점 및 교체 이유 첨부

    private final AuthenticationManagerConfig authenticationManagerConfig;

    private final CustomAuthenticationEntryPoint customAuthenticationEntryPoint;

    // #IMPORTANT
    // 이해하고 사용하는 것이 아닌, 가전제품 사용하듯 '그냥' 사용한다.
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS) // Stateless(무상태) 동작
                .and()
                .formLogin().disable() // formLogin 사용 ❌ ➡️ Rather, 직접 ID - PW 입력 받아 JWT 토큰 리턴하는 API 만들어 사용
                .csrf().disable() // csrf: POST 방식으로 전송할 때, token을 사용해야 하는 보안 설정; 개발 초기엔 불편하므로 끔
                .cors()
                .and()
                .apply(authenticationManagerConfig)
                .and()
                .httpBasic().disable()
                .authorizeRequests()
                .requestMatchers(CorsUtils::isPreFlightRequest).permitAll() // 인증전 사전요청(preFlightRequest) 허용
                .mvcMatchers("/signup","/login","/users/refresh").permitAll() // 해당 URI들은 로그인 안해도 사용가능해야함; 권한 유무에 관계 없이 사용 가능
//                .mvcMatchers(HttpMethod.GET,"/**").permitAll()                    // 아래 URL들은 권한이 있어야 접근 가능
                .mvcMatchers(HttpMethod.GET,"/**").hasAnyRole("USER", "MANAGER", "ADMIN")
                .mvcMatchers(HttpMethod.POST,"/**").hasAnyRole("USER", "MANAGER", "ADMIN")
//                .mvcMatchers(HttpMethod.POST,"answers/**").hasAnyRole("USER", "MANAGER", "ADMIN")
                .anyRequest().hasAnyRole()
                .and()
                .exceptionHandling()
                .authenticationEntryPoint(customAuthenticationEntryPoint)
                .and()
                .build();

//                FROM BOOSTCOURSE
//                .antMatchers("/**", "/main").permitAll()  // 요 경로에 대해 누구나 접근 가능하다
//                .anyRequest().authenticated();              // 그 외의 경로 요청은 모두 인증/인가 필요
    }
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        // 인증 및 인가 예외 Path URL
        return (web) -> web.ignoring().antMatchers( "/**",
                                                    "/login/**",
                                                    "/bootstrap-4.6.0-dist/**",
                                                    "/css/**",
                                                    "/images/**",
                                                    "/jquery-ui-1.13.1.custom/**",
                                                    "/js/**",
                                                    "/smarteditor/**");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
