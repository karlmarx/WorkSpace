package com.srmsolutions.repos;

import com.srmsolutions.entities.Employee;
import com.srmsolutions.entities.Event;
import com.srmsolutions.entities.JobRole;
import com.srmsolutions.entities.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
    public Employee findEmployeeById(int id);
    public List<Employee> findEmployeeByEvent(Event event);
    public List<Employee> findByJobRole (JobRole jobRole);
    public List<Employee> findByUserRole (UserRole userRole);
}
