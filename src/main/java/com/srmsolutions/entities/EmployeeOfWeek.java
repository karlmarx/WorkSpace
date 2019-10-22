package com.srmsolutions.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmployeeOfWeek {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;
    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;
    @Column
    private String
}
