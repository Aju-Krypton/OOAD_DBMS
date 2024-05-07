package com.ilp03.service;

import java.sql.SQLException;
import java.util.List;

import com.ilp03.dao.PortalDAO;
import com.ilp03.entity.Announcement;
import com.ilp03.entity.Newsletter;

public class PortalService implements PortalServiceInterface {
    public void searchAnnouncements(String departmentName) throws SQLException {
        List<Announcement> announcements = PortalDAO.getAnnouncementsByDepartment(departmentName);
        for (Announcement announcement : announcements) {
            announcement.display();
        }
    }

    public void searchNewsletters(String departmentName) throws SQLException {
        List<Newsletter> newsletters = PortalDAO.getNewslettersByDepartment(departmentName);
        for (Newsletter newsletter : newsletters) {
            newsletter.display();
        }
    }
}
