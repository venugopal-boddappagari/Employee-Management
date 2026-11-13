package com.Employee.Management.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.Employee.Management.Entity.Employee;

@Repository
public interface EmployeeRepositoryInterface extends JpaRepository<Employee, Long> {
	boolean existsByDepartment_Id(Long departmentId);
	Optional<Employee> findByEmail(String email);
	
	}
