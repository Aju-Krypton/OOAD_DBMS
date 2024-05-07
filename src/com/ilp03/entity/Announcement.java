package com.ilp03.entity;
import java.sql.Timestamp;

public class Announcement extends Communication {
    private String topic;

    public Announcement(int id, String topic, String content, Employee createdBy, Timestamp createdAt, Employee updatedBy) {
        super(id, content, createdBy, createdAt, updatedBy);
        this.topic = topic;
    }

    @Override
    public void display() {
        System.out.println("Announcement ID: " + id);
        System.out.println("Announcement Topic: " + topic);
        System.out.println("Announcement Content: " + content);
        System.out.println("Created by: " + createdBy.getName());
        System.out.println("Created at: " + createdAt);
        System.out.println("Updated by: " + (updatedBy != null ? updatedBy.getName() : "N/A"));
        System.out.println();
    }
}

