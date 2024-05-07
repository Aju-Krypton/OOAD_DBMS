package com.ilp03.entity;

import java.sql.Timestamp;

public class Newsletter extends Communication {
    private String name;

    public Newsletter(int id, String name, String content, Employee createdBy, Timestamp createdAt, Employee updatedBy) {
        super(id, content, createdBy, createdAt, updatedBy);
        this.name = name;
    }

    @Override
    public void display() {
        System.out.println("Newsletter ID: " + id);
        System.out.println("Newsletter Name: " + name);
        System.out.println("Newsletter Content: " + content);
        System.out.println("Created by: " + createdBy.getName());
        System.out.println("Created at: " + createdAt);
        System.out.println("Updated by: " + (updatedBy != null ? updatedBy.getName() : "N/A"));
        System.out.println();
    }
}
