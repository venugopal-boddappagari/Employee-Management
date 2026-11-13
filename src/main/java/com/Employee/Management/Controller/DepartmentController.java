
package com.Employee.Management.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.Employee.Management.Entity.Department;
import com.Employee.Management.Service.DepartmentServiceInterface;

@RestController
@RequestMapping("/api/departments")
public class DepartmentController {
 
    private final DepartmentServiceInterface departmentServiceInterface;

    public DepartmentController(
            DepartmentServiceInterface departmentServiceInterface) {
        this.departmentServiceInterface = departmentServiceInterface;
    }

    // Create department
    @PostMapping
    public ResponseEntity<Department> createDepartment(
            @RequestBody Department department) {

        Department savedDepartment =
                departmentServiceInterface.createDepartment(department);

        return new ResponseEntity<>(savedDepartment, HttpStatus.CREATED);
    }

    // Get all departments
    @GetMapping
    public ResponseEntity<List<Department>> getAllDepartments() {

        List<Department> departments =
                departmentServiceInterface.getAllDepartments();

        return ResponseEntity.ok(departments);
    }

    // Get department by ID
    @GetMapping("/{id}")
    public ResponseEntity<Department> getDepartmentById(
            @PathVariable Long id) {

        Department department =
                departmentServiceInterface.getDepartmentById(id);

        return ResponseEntity.ok(department);
    }

    // Update department
    @PutMapping("/{id}")
    public ResponseEntity<Department> updateDepartment(
            @PathVariable Long id,
            @RequestBody Department department) {

        Department updatedDepartment =
                departmentServiceInterface.updateDepartment(id, department);

        return ResponseEntity.ok(updatedDepartment);
    }

    // Delete department
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDepartment(
            @PathVariable Long id) {

        departmentServiceInterface.deleteDepartment(id);

        return ResponseEntity.noContent().build();
    }
}
