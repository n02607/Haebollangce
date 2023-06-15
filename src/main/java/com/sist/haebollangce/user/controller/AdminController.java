package com.sist.haebollangce.user.controller;

import com.sist.haebollangce.user.dto.ReportDTO;
import com.sist.haebollangce.user.service.InterAdminService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

    private final InterAdminService adminService;

    @GetMapping("/report")
    public String getReports(HttpServletRequest request) {

        List<ReportDTO> reports = adminService.getReports();

        System.out.println("reports size "+reports.size());
        for(ReportDTO dto: reports) {
            System.out.println("reportNo "+dto.getReportNo());
        }

        request.setAttribute("reports", reports);

        return "admin.tiles1";
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
