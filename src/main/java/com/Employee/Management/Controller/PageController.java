package com.Employee.Management.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/employee-register")
    public String employeeRegister() {
        return "employee-register";
    }

    @GetMapping("/employee-login")
    public String employeeLogin() {
        return "employee-login";
    }

    @GetMapping("/employee-home")
    public String employeeHome() {
        return "employee-home";
    }

    @GetMapping("/department-register")
    public String departmentRegister() {
        return "department-register";
    }

    @GetMapping("/department-login")
    public String departmentLogin() {
        return "department-login";
    }

    @GetMapping("/department-home")
    public String departmentHome() {
        return "department-home";
    }
}