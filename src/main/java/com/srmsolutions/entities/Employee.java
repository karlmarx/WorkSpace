package com.srmsolutions.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Id
    private int id;
    @Column(name="first_name")
    private String firstName;
    @Column(name="last_name")
    private String lastName;
    @Column
    private String email;
    @Column
    private String password;
    @Column(name="emergency_contact_name")
    private String emergencyContactName;
    @Column(name="emergency_contact_number")
    private String emergencyContactNumber;
    @Column
    private String address;
    @Column(name="hire_date")
    private LocalDate hireDate;
    @Column(name="termination_date")
    private LocalDate termDate;
    @Column(name="onsite_clearance")
    private String onsiteClearance;
    @Column(name="hours_of_pto")
    private int hoursPto;
    @Column(name="SSN")
    private String ssn;
    @Column(name="manager_id")
    private int managerId;
    @ManyToMany
    @JoinTable(name="event_attendee",
            joinColumns = {@JoinColumn(name="employee_id")},
            inverseJoinColumns = {@JoinColumn(name="event_id")})
    private List Event;
    @ManyToOne
    @JoinColumn(name = "user_role_id")
    private UserRole userRole;
    @ManyToOne
    @JoinColumn(name = "job_role_id")
    private JobRole jobRole;
}
