package com.ilp03.utility;

import java.sql.SQLException;

import com.ilp03.service.PortalServiceInterface;

public class PortalUtility {
    public static void getPortalDetails(PortalServiceInterface service, String departmentName, int choice) throws SQLException {
        if (choice == 1) {
            service.searchAnnouncements(departmentName);
        } else if (choice == 2) {
            service.searchNewsletters(departmentName);
        } else {
            System.out.println("Invalid choice!");
        }
    }
}
