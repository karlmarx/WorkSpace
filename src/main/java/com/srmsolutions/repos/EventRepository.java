package com.srmsolutions.repos;

import com.srmsolutions.entities.Category;
import com.srmsolutions.entities.Event;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EventRepository extends JpaRepository<Event, Integer> {
    List<Event> findByCategory (Category category);
}
