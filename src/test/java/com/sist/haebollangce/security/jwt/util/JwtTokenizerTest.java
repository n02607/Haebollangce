package com.sist.haebollangce.security.jwt.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

//@SpringBootTest
//public class JwtTokenizerTest {
//    @Autowired
//    JwtTokenizer jwtTokenizer;
//
//    @Value("${jwt.secretKey}")
//    String accessSecret;
//    public final Long ACCESS_TOKEN_EXPIRE_COUNT = 30 * 60 * 1000L; // 30분
//
//    @Test
//    public void createToken() throws Exception{ // JWT 토큰 생성.
//        String email = "urstory@gmail.com";
//
//        // List<String> roles = List.of("ROLE_USER"); // [ "ROLE_USER" ]
//        // List 의 of() 는 JAVA 9 부터 가능. ==> 대체품 Arrays.asList 사용
//        List<String> roles = Arrays.asList("ROLE_USER"); // [ "ROLE_USER" ]
//        Long id = 1L;
//        Claims claims = Jwts.claims().setSubject(email);    // Jwts.claims() : JWT의 payload에 들어갈 내용(claims)을 설정.
//                                                            // .set**() 는 Registered Claims를 보여준다.
//                                                            // Private Claims 생성하려면 .put() 사용
//        // claims -- sub -- email
//        //        -- roles -- [ "ROLE_USER" ]
//        //        -- userId -- 1L
//        claims.put("roles", roles);
//
//        claims.put("userId", id);
//
//        // application.properties 파일의 secretKey 문자열 to Byte 배열
//        byte[] accessSecret = this.accessSecret.getBytes(StandardCharsets.UTF_8);
//
//        // JWT를 생성하는 부분.(체인)
//        String JwtToken = Jwts.builder() // builder() : JwtBuilder를 리턴. (Builder 패턴)
//                .setClaims(claims) // claims가 추가된 JwtBuilder를 리턴.
//                .setIssuedAt(new Date())
//                .setExpiration(new Date(new Date().getTime() + this.ACCESS_TOKEN_EXPIRE_COUNT)) // 현재시각으로부터 30분뒤에 만료.
//                .signWith(Keys.hmacShaKeyFor(accessSecret)) // 결과에 서명까지 포함시킨 JwtBuilder리턴.
//                .compact(); // 결과에 서명까지 포함된 Jwtbuilder 리턴.
//
//        System.out.println(JwtToken);
//    }
//
//    @Test
//    public void parseToken() throws Exception{
//        byte[] accessSecret = this.accessSecret.getBytes(StandardCharsets.UTF_8);
//        String jwtToken = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cnN0b3J5QGdtYWlsLmNvbSIsInJvbGVzIjpbIlJPTEVfVVNFUiJdLCJ1c2VySWQiOjEsImlhdCI6MTY4NTUxNTIzMiwiZXhwIjoxNjg1NTE3MDMyfQ.l0I6AQj1iWGKLLXpKRKjEExai6VHDaknHPbUeGcXGag";
//
//        Claims claims = Jwts.parserBuilder() // JwtParserBuilder를 반환.
//                .setSigningKey(Keys.hmacShaKeyFor(accessSecret))
//                .build()
//                .parseClaimsJws(jwtToken)
//                .getBody();
//        System.out.println(claims.getSubject());
//        System.out.println(claims.get("roles"));
//        System.out.println(claims.get("userId"));
//        System.out.println(claims.getIssuedAt());
//        System.out.println(claims.getExpiration());
//    }
//
//    @Test
//    public void createJWT(){
//        String jwtToken = jwtTokenizer.createAccessToken(1L, "urstory@gmail.com", Arrays.asList("ROLE_USER"));
//        System.out.println(jwtToken);
//    }
//
//    @Test
//    public void parseJWT(){
//        Claims claims = jwtTokenizer.parseAccessToken("eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cnN0b3J5QGdtYWlsLmNvbSIsInJvbGVzIjpbIlJPTEVfVVNFUiJdLCJ1c2VySWQiOjEsImlhdCI6MTY3NTI0Mzg4NywiZXhwIjoxNjc1MjQ1Njg3fQ.dXO2M9nQM8YvHgjrCfhuaXKcYj3fSaCP5xYQTRH94yQ");
//        System.out.println(claims.getSubject());
//        System.out.println(claims.get("roles"));
//        System.out.println(claims.get("userId"));
//    }
//}
