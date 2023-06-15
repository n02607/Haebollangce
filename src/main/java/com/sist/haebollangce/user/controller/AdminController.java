package com.sist.haebollangce.user.controller;

import com.sist.haebollangce.user.dto.ReportDTO;
import com.sist.haebollangce.user.service.InterAdminService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

    private final InterAdminService adminService;

    @GetMapping("/report")
    public String getReports(HttpServletRequest request) {

        ReportDTO reports = adminService.getReports();
        request.setAttribute("reports", reports);

        return "/userEntryPoint/admin";
    }

//    @DeleteMapping("/report")
//    public String deleteReports(@RequestBody ArrayList<>,
//                                HttpServletRequest request) {
//
//        int n = adminService.delete(reports);
//
//        request.setAttribute();
//        return "";
//    }


}
