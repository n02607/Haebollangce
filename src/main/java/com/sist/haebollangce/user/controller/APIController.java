package com.sist.haebollangce.user.controller;

import com.sist.haebollangce.user.dto.UserDTO;
import com.sist.haebollangce.user.service.InterUserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// import javax.validation.Valid;

@RestController
@RequestMapping("/api/v1/user")
@AllArgsConstructor
public class APIController {

//    private final InterUserService service;
    private final PasswordEncoder passwordEncoder;

    @PostMapping("/signup")
    public ResponseEntity signup(@RequestBody UserDTO userDTO) {
//        if (bindingResult.hasErrors()) {
//            return new ResponseEntity(HttpStatus.BAD_REQUEST);
//        }
        userDTO.setPw(passwordEncoder.encode(userDTO.getPw()));

        return new ResponseEntity(userDTO, HttpStatus.CREATED);
    }

//    @PostMapping("/login")
//    public ResponseEntity login(@RequestBody UserDTO.UserLoginDTO userLoginDTO) {
////        if (bindingResult.hasErrors()) {
////            return new ResponseEntity(HttpStatus.BAD_REQUEST);
////        }
////        userDTO.setPw(passwordEncoder.encode(userDTO.getPw()));
//
//
//        return new ResponseEntity(userLoginDTO, HttpStatus.CREATED);
//    }

}
