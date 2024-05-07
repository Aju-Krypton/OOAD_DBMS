package com.ilp03.service;

import java.sql.SQLException;

public interface PortalServiceInterface {
    void searchAnnouncements(String departmentName) throws SQLException;

    void searchNewsletters(String departmentName) throws SQLException;
}
