package com.nayab.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.nayab.demo.domain.ViewDepartment;
import com.nayab.demo.repository.ViewDepartmentRepository;

@RestController
public class DepartmentController {
	
	@Autowired
	ViewDepartmentRepository viewDepartmentRepository;
	
	@GetMapping("/{id}")
	public ViewDepartment getViewsDepartment(@PathVariable(value = "id") Long id) {
		return viewDepartmentRepository.findById(id).get();
	}

}
