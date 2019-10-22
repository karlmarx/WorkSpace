package com.srmsolutions.repos;

import com.srmsolutions.entities.EmployeeOfWeek;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeOfWeekRepository extends JpaRepository<EmployeeOfWeek, Integer> {

}
