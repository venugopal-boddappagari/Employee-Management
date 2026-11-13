package com.Employee.Management.Service;

import java.util.List;

import com.Employee.Management.Entity.Employee;

public interface EmployeeServiceInterface {

    Employee createEmployee(Employee employee);

    List<Employee> getAllEmployees();

    Employee getEmployeeById(Long id);

    Employee updateEmployee(Long id, Employee employee);

    void deleteEmployee(Long id);
    boolean authenticateEmployee(String usernameOrEmail, String password);
    Employee authenticateEmployee1(String email, String password);
    Employee getEmployeeByEmail(String email);
}
