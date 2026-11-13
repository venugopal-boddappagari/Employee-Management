package com.Employee.Management.Service;

import java.util.List;

import com.Employee.Management.Entity.Department;

public interface DepartmentServiceInterface {

	 Department createDepartment(Department department);

	    List<Department> getAllDepartments();

	    Department getDepartmentById(Long id);

	    Department updateDepartment(Long id, Department department);

	    void deleteDepartment(Long id);
}
