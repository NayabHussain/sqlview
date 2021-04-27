package com.nayab.demo.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "csdepartement")
@Getter
@Setter
@ToString
public class ViewDepartment {
	
	@Id
	@Column(name = "id")
	private long id;

	@Column(name = "usn")
	private String usn;
	
	@Column(name = "department_name")
	private String departmentName;

}
