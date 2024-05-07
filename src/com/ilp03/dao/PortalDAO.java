package com.ilp03.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.ilp03.entity.Announcement;
import com.ilp03.entity.Employee;
import com.ilp03.entity.Newsletter;

public class PortalDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/employee_portal";
    private static final String USER = "root";
    private static final String PASSWORD = "Krypton007";

    public static List<Announcement> getAnnouncementsByDepartment(String departmentName) throws SQLException {
        List<Announcement> announcements = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("SELECT a.announcement_id, a.announcement_topic, a.announcement_content, a.created_by, e1.emp_name AS created_by_name, a.created_at, a.updated_by, e2.emp_name AS updated_by_name FROM announcement a JOIN employee e1 ON a.created_by = e1.emp_id LEFT JOIN employee e2 ON a.updated_by = e2.emp_id JOIN department d ON e1.dept_id = d.dept_id WHERE d.dept_name = ?;\r\n")) {
            statement.setString(1, departmentName);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("announcement_id");
                String topic = resultSet.getString("announcement_topic");
                String content = resultSet.getString("announcement_content");
                Employee createdBy = new Employee(resultSet.getInt("created_by"), resultSet.getString("created_by_name"), null);
                Timestamp createdAt = resultSet.getTimestamp("created_at");
                Employee updatedBy = resultSet.getInt("updated_by") != 0 ?
                        new Employee(resultSet.getInt("updated_by"), resultSet.getString("updated_by_name"), null) : null;

                Announcement announcement = new Announcement(id, topic, content, createdBy, createdAt, updatedBy);
                announcements.add(announcement);
            }
        }

        return announcements;
    }

    public static List<Newsletter> getNewslettersByDepartment(String departmentName) throws SQLException {
        List<Newsletter> newsletters = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("SELECT n.newsletter_id, n.newsletter_name, n.newsletter_content, n.created_by, e1.emp_name AS created_by_name, n.created_at, n.updated_by, e2.emp_name AS updated_by_name FROM newsletter n JOIN employee e1 ON n.created_by = e1.emp_id LEFT JOIN employee e2 ON n.updated_by = e2.emp_id JOIN department d ON e1.dept_id = d.dept_id WHERE d.dept_name = ?;\r\n")) {
            statement.setString(1, departmentName);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("newsletter_id");
                String name = resultSet.getString("newsletter_name");
                String content = resultSet.getString("newsletter_content");
                Employee createdBy = new Employee(resultSet.getInt("created_by"), resultSet.getString("created_by_name"), null);
                Timestamp createdAt = resultSet.getTimestamp("created_at");
                Employee updatedBy = resultSet.getInt("updated_by") != 0 ?
                        new Employee(resultSet.getInt("updated_by"), resultSet.getString("updated_by_name"), null) : null;

                Newsletter newsletter = new Newsletter(id, name, content, createdBy, createdAt, updatedBy);
                newsletters.add(newsletter);
            }
        }

        return newsletters;
    }
}
