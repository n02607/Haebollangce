package com.sist.haebollangce.user.service;

import com.sist.haebollangce.user.dao.InterAdminDAO;
import com.sist.haebollangce.user.dto.ReportDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class AdminService implements InterAdminService {

    private final InterAdminDAO adminDAO;
    @Override
    public ReportDTO getReports() { return adminDAO.getReports(); }
}
