package com.Employee.Management.Service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Employee.Management.Entity.Department;
import com.Employee.Management.Repository.DepartmentRepositoryInterface;
import com.Employee.Management.Repository.EmployeeRepositoryInterface;
import com.Employee.Management.Exception.ResourceNotFoundException;

@Service
@Transactional
public class DepartmentServicesImplementation
        implements DepartmentServiceInterface {

    private final DepartmentRepositoryInterface departmentRepositoryInterface;
    private final EmployeeRepositoryInterface employeeRepositoryInterface;

    public DepartmentServicesImplementation(
            DepartmentRepositoryInterface departmentRepositoryInterface,
            EmployeeRepositoryInterface employeeRepositoryInterface) {

        this.departmentRepositoryInterface = departmentRepositoryInterface;
        this.employeeRepositoryInterface = employeeRepositoryInterface;
    }

    // CREATE department
    @Override
    public Department createDepartment(Department department) {
        department.setId(null);
        return departmentRepositoryInterface.save(department);
    }

    // READ all departments
    @Override
    @Transactional(readOnly = true)
    public List<Department> getAllDepartments() {
        return departmentRepositoryInterface.findAll();
    }

    // READ department by ID
    @Override
    @Transactional(readOnly = true)
    public Department getDepartmentById(Long id) {

        return departmentRepositoryInterface.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Department not found with ID: " + id));
    }

    // UPDATE department
    @Override
    public Department updateDepartment(Long id, Department department) {

        Department existingDepartment = getDepartmentById(id);

        existingDepartment.setName(department.getName());
        existingDepartment.setDescription(department.getDescription());

        return departmentRepositoryInterface.save(existingDepartment);
    }

    // DELETE department
    @Override
    public void deleteDepartment(Long id) {

        Department department = getDepartmentById(id);

        if (employeeRepositoryInterface.existsByDepartment_Id(id)) {
            throw new IllegalStateException(
                    "Cannot delete department because employees "
                    + "are assigned to it.");
        }

        departmentRepositoryInterface.delete(department);
    }
}