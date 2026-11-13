
package com.Employee.Management.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Employee.Management.Entity.Employee;
import com.Employee.Management.Service.EmployeeServiceInterface;

@RestController
@RequestMapping("/api/employees")
public class EmployeeController {

    private final EmployeeServiceInterface employeeServiceInterface;

    public EmployeeController(EmployeeServiceInterface employeeServiceInterface) {
        this.employeeServiceInterface = employeeServiceInterface;
    }

    // Create employee
    @PostMapping
    public ResponseEntity<Employee> createEmployee(
            @RequestBody Employee employee) {

        Employee savedEmployee =
                employeeServiceInterface.createEmployee(employee);

        return new ResponseEntity<>(savedEmployee, HttpStatus.CREATED);
    }

    // Get all employees
    @GetMapping
    public ResponseEntity<List<Employee>> getAllEmployees() {

        List<Employee> employees =
                employeeServiceInterface.getAllEmployees();

        return ResponseEntity.ok(employees);
    }

    // Get employee by ID
    @GetMapping("/{id}")
    public ResponseEntity<Employee> getEmployeeById(
            @PathVariable Long id) {

        Employee employee =
                employeeServiceInterface.getEmployeeById(id);

        return ResponseEntity.ok(employee);
    }

    // Update employee
    @PutMapping("/{id}")
    public ResponseEntity<Employee> updateEmployee(
            @PathVariable Long id,
            @RequestBody Employee employee) {

        Employee updatedEmployee =
                employeeServiceInterface.updateEmployee(id, employee);

        return ResponseEntity.ok(updatedEmployee);
    }

    // Delete employee
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteEmployee(
            @PathVariable Long id) {

        employeeServiceInterface.deleteEmployee(id);

        return ResponseEntity.noContent().build();
    }
    
    @PostMapping("/login")
    public ResponseEntity<?> loginEmployee(
            @RequestBody Map<String, String> credentials) {

        String email = credentials.get("email");
        String password = credentials.get("password");

        if (email == null || email.isBlank()
                || password == null || password.isBlank()) {
            return ResponseEntity.badRequest()
                    .body(Map.of("message", "Email and password are required"));
        }

        boolean authenticated =
                employeeServiceInterface.authenticateEmployee(email, password);

        if (authenticated) {

            Employee employee = employeeServiceInterface
                    .getEmployeeByEmail(email);

            Map<String, Object> response = new HashMap<>();
            response.put("message", "Employee login successful");
            response.put("employeeId", employee.getId());
            response.put("name", employee.getName());
            response.put("email", employee.getEmail());
            response.put("salary", employee.getSalary());

            return ResponseEntity.ok(response);
        }

        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body(Map.of("message", "Invalid email or password"));
    }
}
