package com.srmsolutions.repos;

import com.srmsolutions.entities.Category;
import com.srmsolutions.entities.Event;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
//    List<Category> findByEvent (Event event); might need this but prob not
}
