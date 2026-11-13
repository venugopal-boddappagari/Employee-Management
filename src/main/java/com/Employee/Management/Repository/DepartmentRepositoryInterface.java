package com.Employee.Management.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Employee.Management.Entity.Department;
@Repository
public interface DepartmentRepositoryInterface extends JpaRepository<Department ,Long> {

}
