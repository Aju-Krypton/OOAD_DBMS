package com.ilp03.utility;

import java.sql.SQLException;
import java.util.Scanner;

import com.ilp03.service.PortalService;

public class EmployeeCommunicationUtility {
    public static void main(String[] args) {
    	char goToChar = 'y';
    	Scanner scanner = new Scanner(System.in);
    	do {
        try {
            
            System.out.println("Select an option:");
            System.out.println("1. Search for Announcements");
            System.out.println("2. Search for Newsletters");
            System.out.print("Enter your choice (1 or 2): ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // consume newline

            System.out.print("Enter the department name: ");
            String departmentName = scanner.nextLine();

            PortalService portalService = new PortalService();
            PortalUtility.getPortalDetails(portalService, departmentName, choice);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Go to main menu y/n?");
        goToChar = scanner.next().charAt(0);
    }while(goToChar == 'y'); scanner.close();
    	}
}
