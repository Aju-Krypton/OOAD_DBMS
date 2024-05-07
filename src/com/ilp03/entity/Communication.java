package com.ilp03.entity;

import java.sql.Timestamp;

public abstract class Communication {
    protected int id;
    protected String content;
    protected Employee createdBy;
    protected Timestamp createdAt;
    protected Employee updatedBy;

    public Communication(int id, String content, Employee createdBy, Timestamp createdAt, Employee updatedBy) {
        this.id = id;
        this.content = content;
        this.createdBy = createdBy;
        this.createdAt = createdAt;
        this.updatedBy = updatedBy;
    }

    public abstract void display();
}
