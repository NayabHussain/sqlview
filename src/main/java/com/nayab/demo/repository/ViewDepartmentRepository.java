package com.nayab.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nayab.demo.domain.ViewDepartment;

@Repository
public interface ViewDepartmentRepository extends JpaRepository<ViewDepartment, Long> {

}
