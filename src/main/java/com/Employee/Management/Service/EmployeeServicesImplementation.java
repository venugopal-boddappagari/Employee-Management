
package com.Employee.Management.Service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Employee.Management.Entity.Department;
import com.Employee.Management.Entity.Employee;
import com.Employee.Management.Repository.EmployeeRepositoryInterface;
import com.Employee.Management.Repository.DepartmentRepositoryInterface;
import com.Employee.Management.Exception.ResourceNotFoundException;

@Service
@Transactional
public class EmployeeServicesImplementation
        implements EmployeeServiceInterface {

    private final EmployeeRepositoryInterface employeeRepositoryInterface;
    private final DepartmentRepositoryInterface departmentRepositoryInterface;

    public EmployeeServicesImplementation(
            EmployeeRepositoryInterface employeeRepositoryInterface,
            DepartmentRepositoryInterface departmentRepositoryInterface) {

        this.employeeRepositoryInterface = employeeRepositoryInterface;
        this.departmentRepositoryInterface = departmentRepositoryInterface;
    }

    // CREATE employee
    @Override
    public Employee createEmployee(Employee employee) {

        if (employee.getDepartmentId() == null) {
            throw new IllegalArgumentException(
                    "Department ID is required");
        }

        Long departmentId = employee.getDepartmentId();

        Department department = departmentRepositoryInterface
                .findById(departmentId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Department not found with ID: " + departmentId));

        employee.setId(null);
        employee.setDepartment(department);

        return employeeRepositoryInterface.save(employee);
    }

    // READ all employees
    @Override
    @Transactional(readOnly = true)
    public List<Employee> getAllEmployees() {
        return employeeRepositoryInterface.findAll();
    }

    // READ employee by ID
    @Override
    @Transactional(readOnly = true)
    public Employee getEmployeeById(Long id) {

        return employeeRepositoryInterface.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Employee not found with ID: " + id));
    }

    // UPDATE employee
    @Override
    public Employee updateEmployee(Long id, Employee employee) {

        Employee existingEmployee = getEmployeeById(id);

        if (employee.getDepartmentId() == null) {
            throw new IllegalArgumentException(
                    "Department ID is required");
        }

        Long departmentId = employee.getDepartmentId();

        Department department = departmentRepositoryInterface
                .findById(departmentId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Department not found with ID: " + departmentId));

        existingEmployee.setName(employee.getName());
        existingEmployee.setPassword(employee.getPassword());
        existingEmployee.setSalary(employee.getSalary());
        existingEmployee.setEmail(employee.getEmail());
        existingEmployee.setDepartment(department);

        return employeeRepositoryInterface.save(existingEmployee);
    }

    public EmployeeRepositoryInterface getEmployeeRepositoryInterface() {
		return employeeRepositoryInterface;
	}

	public DepartmentRepositoryInterface getDepartmentRepositoryInterface() {
		return departmentRepositoryInterface;
	}

	// DELETE employee
    @Override
    public void deleteEmployee(Long id) {

        Employee employee = getEmployeeById(id);
        employeeRepositoryInterface.delete(employee);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean authenticateEmployee(String email, String password) {
        return employeeRepositoryInterface.findByEmail(email)
                .map(employee -> employee.getPassword() != null
                        && employee.getPassword().equals(password))
                .orElse(false);
    }

    @Override
    @Transactional(readOnly = true)
    public Employee authenticateEmployee1(String email, String password) {
        return employeeRepositoryInterface.findByEmail(email)
                .filter(employee -> employee.getPassword() != null
                        && employee.getPassword().equals(password))
                .orElseThrow(() ->
                        new RuntimeException("Invalid email or password"));
    }

    @Override
    @Transactional(readOnly = true)
    public Employee getEmployeeByEmail(String email) {
        return employeeRepositoryInterface.findByEmail(email)
                .orElseThrow(() ->
                    new ResourceNotFoundException(
                        "Employee not found with email: " + email));
    }

}
