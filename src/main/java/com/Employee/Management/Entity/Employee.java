
package com.Employee.Management.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.PositiveOrZero;

@Entity
@Table(name = "employees")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(nullable = false, length = 100)
    private String name;
    private String gender;
    public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	private String password;

    @PositiveOrZero
    @Column(nullable = false)
    private Double salary;

    @Email
    @NotBlank
    @Column(nullable = false, unique = true)
    private String email;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "department_id", nullable = false)
    private Department department;

    public Employee() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    // Accept departmentId from the JSP JSON request
    public void setDepartmentId(Long departmentId) {
        if (departmentId == null) {
            this.department = null;
        } else {
            this.department = new Department();
            this.department.setId(departmentId);
        }
    }

    // Return departmentId when needed
    public Long getDepartmentId() {
        return department == null ? null : department.getId();
    }
}
