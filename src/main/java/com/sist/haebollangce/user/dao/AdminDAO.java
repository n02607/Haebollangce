package com.sist.haebollangce.user.dao;

import com.sist.haebollangce.common.mapper.InterMapper;
import com.sist.haebollangce.user.dto.ReportDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class AdminDAO implements InterAdminDAO {

    private final InterMapper mapper;


    @Override
    public ReportDTO getReports() { return mapper.getReports(); }
}
