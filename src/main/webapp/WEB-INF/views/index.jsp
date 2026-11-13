<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Employee Management System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/styles.css">
</head>

<body class="home-page">

<nav class="navbar">
    <div class="brand">
        <span class="brand-icon">✦</span>
        <span>EMS<span class="brand-highlight"> Portal</span></span>
    </div>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/employee-home">Employees</a>
        <a href="${pageContext.request.contextPath}/department-home">Departments</a>
    </div>
</nav>

<section class="hero">
    <div class="hero-content">
        <span class="eyebrow">✦ SMART WORKPLACE MANAGEMENT</span>

        <h1>Manage Your Team.<br>
            <span>Build Your Future.</span>
        </h1>

        <p>
            A smarter way to organize employees, manage departments,
            and keep your organization running smoothly.
        </p>

        <div class="hero-buttons">
            <a class="btn btn-primary"
               href="${pageContext.request.contextPath}/employee-register">
                + Register Employee
            </a>

            <a class="btn btn-light"
               href="${pageContext.request.contextPath}/department-register">
                + Add Department
            </a>
        </div>

        <div class="hero-stats">
            <div>
                <strong>01</strong>
                <span>Employee Management</span>
            </div>
            <div>
                <strong>02</strong>
                <span>Department Management</span>
            </div>
            <div>
                <strong>03</strong>
                <span>Centralized Records</span>
            </div>
        </div>
    </div>

    <div class="hero-visual">
        <div class="visual-circle circle-one"></div>
        <div class="visual-circle circle-two"></div>

        <div class="visual-card">
            <div class="visual-icon">👥</div>
            <h2>Your Team</h2>
            <p>One place. Better management.</p>

            <div class="mini-row">
                <span class="mini-avatar avatar-purple">E</span>
                <span class="mini-avatar avatar-orange">D</span>
                <span class="mini-avatar avatar-blue">M</span>
                <span class="mini-avatar avatar-green">T</span>
                <span class="mini-count">+ More</span>
            </div>

            <div class="visual-footer">
                <span>●</span> Organized and connected
            </div>
        </div>
    </div>
</section>

<section class="services">
    <div class="section-heading">
        <span class="eyebrow">YOUR WORKSPACE</span>
        <h2>Everything You Need</h2>
        <p>Choose a portal to get started.</p>
    </div>

    <div class="portal-grid">

        <div class="portal-card employee-card">
            <div class="portal-icon">👨‍💼</div>
            <span class="card-label">EMPLOYEE PORTAL</span>
            <h3>Employee Management</h3>
            <p>
                Register employees and view their information,
                salaries, and assigned departments.
            </p>

            <a href="${pageContext.request.contextPath}/employee-register"
               class="portal-link">
                Register Employee <span>→</span>
            </a>

            <a href="${pageContext.request.contextPath}/employee-home"
               class="portal-link">
                View Employees <span>→</span>
            </a>

            <a href="${pageContext.request.contextPath}/employee-login"
               class="portal-link">
                Employee Login <span>→</span>
            </a>
        </div>

        <div class="portal-card department-card">
            <div class="portal-icon">🏢</div>
            <span class="card-label">DEPARTMENT PORTAL</span>
            <h3>Department Management</h3>
            <p>
                Create departments, maintain descriptions,
                and view employee allocation.
            </p>

            <a href="${pageContext.request.contextPath}/department-register"
               class="portal-link">
                Add Department <span>→</span>
            </a>

            <a href="${pageContext.request.contextPath}/department-home"
               class="portal-link">
                View Departments <span>→</span>
            </a>

            <a href="${pageContext.request.contextPath}/department-login"
               class="portal-link">
                Department Login <span>→</span>
            </a>
        </div>

    </div>
</section>

<footer class="footer">
    <p>© 2026 Employee Management System · Designed for better teamwork 💙</p>
</footer>

</body>
</html>
