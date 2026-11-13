<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department Dashboard | EMS Portal</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/styles.css">

    <style>
        .department-dashboard {
            min-height: 100vh;
            padding: 35px 20px 50px;
            background: linear-gradient(135deg, #f0f9ff, #f8fafc, #f5f3ff);
        }

        .dashboard-container {
            max-width: 1200px;
            margin: auto;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 28px;
        }

        .dashboard-header h1 {
            color: #172554;
            font-size: 30px;
            margin-bottom: 8px;
        }

        .dashboard-header p {
            color: #64748b;
            margin: 0;
        }

        .header-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .action-btn {
            display: inline-block;
            text-decoration: none;
            padding: 12px 18px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 14px;
            border: none;
            cursor: pointer;
            transition: 0.2s;
        }

        .primary-btn {
            color: white;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
        }

        .secondary-btn {
            color: #3730a3;
            background: #e0e7ff;
        }

        .action-btn:hover {
            transform: translateY(-2px);
            opacity: 0.92;
        }

        .welcome-banner {
            padding: 32px;
            border-radius: 22px;
            color: white;
            background: linear-gradient(120deg, #4338ca, #7c3aed, #9333ea);
            margin-bottom: 28px;
            box-shadow: 0 12px 30px rgba(79, 70, 229, 0.18);
        }

        .welcome-banner h2 {
            font-size: 27px;
            margin: 0 0 12px;
        }

        .welcome-banner p {
            color: #ede9fe;
            line-height: 1.7;
            margin: 0;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            padding: 24px;
            border-radius: 18px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 5px 18px rgba(15, 23, 42, 0.04);
        }

        .stat-icon {
            font-size: 30px;
            margin-bottom: 12px;
        }

        .stat-card p {
            color: #64748b;
            margin: 0 0 10px;
            font-size: 14px;
        }

        .stat-card h3 {
            font-size: 30px;
            color: #1e293b;
            margin: 0;
        }

        .table-card {
            background: white;
            border-radius: 20px;
            padding: 26px;
            box-shadow: 0 8px 28px rgba(15, 23, 42, 0.06);
            border: 1px solid #e2e8f0;
        }

        .table-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 22px;
        }

        .table-heading h2 {
            color: #1e293b;
            font-size: 22px;
            margin: 0;
        }

        .search-input {
            width: 280px;
            max-width: 100%;
            padding: 12px 15px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            outline: none;
            font-size: 14px;
            box-sizing: border-box;
        }

        .search-input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.12);
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .department-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 650px;
        }

        .department-table th {
            padding: 15px;
            background: #eef2ff;
            color: #3730a3;
            text-align: left;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.4px;
        }

        .department-table td {
            padding: 16px 15px;
            border-bottom: 1px solid #f1f5f9;
            color: #475569;
            font-size: 14px;
        }

        .department-table tbody tr:hover {
            background: #fafaff;
        }

        .department-name {
            color: #1e293b;
            font-weight: 700;
        }

        .department-id {
            display: inline-block;
            background: #e0e7ff;
            color: #4338ca;
            padding: 5px 10px;
            border-radius: 7px;
            font-weight: 700;
        }

        .employee-count {
            display: inline-block;
            min-width: 28px;
            text-align: center;
            padding: 6px 10px;
            border-radius: 20px;
            background: #dcfce7;
            color: #166534;
            font-weight: 700;
        }

        .empty-state {
            text-align: center;
            padding: 35px 15px;
            color: #64748b;
        }

        .empty-state .empty-icon {
            font-size: 40px;
            margin-bottom: 10px;
        }

        .status-message {
            display: none;
            margin-bottom: 18px;
            padding: 13px 15px;
            border-radius: 10px;
            overflow-wrap: anywhere;
        }

        .status-message.error {
            display: block;
            background: #fee2e2;
            color: #991b1b;
        }

        .status-message.info {
            display: block;
            background: #e0f2fe;
            color: #075985;
        }

        .dashboard-footer {
            text-align: center;
            color: #94a3b8;
            font-size: 13px;
            margin-top: 28px;
        }

        @media (max-width: 760px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }

            .welcome-banner {
                padding: 25px;
            }

            .welcome-banner h2 {
                font-size: 23px;
            }

            .dashboard-header h1 {
                font-size: 25px;
            }

            .table-card {
                padding: 18px;
            }

            .table-heading {
                align-items: stretch;
                flex-direction: column;
            }

            .search-input {
                width: 100%;
            }
        }
    </style>
</head>

<body>

<%
    String contextPath = request.getContextPath();
%>

<div class="department-dashboard">

    <div class="dashboard-container">

        <!-- Dashboard header -->
        <header class="dashboard-header">
            <div>
                <h1>🏢 Department Dashboard</h1>
                <p>Manage departments and monitor employee allocation.</p>
            </div>

            <div class="header-actions">
                <a href="<%= contextPath %>/"
                   class="action-btn secondary-btn">🏠 Home</a>

                <a href="<%= contextPath %>/department-register"
                   class="action-btn primary-btn">＋ Add Department</a>
            </div>
        </header>

        <!-- Welcome banner -->
        <section class="welcome-banner">
            <h2>Welcome to Department Management 👋</h2>
            <p>
                View all departments, monitor how many employees belong to
                each department, and keep your organization organized.
            </p>
        </section>

        <!-- Statistics -->
        <section class="stats-grid">

            <div class="stat-card">
                <div class="stat-icon">🏢</div>
                <p>Total Departments</p>
                <h3 id="totalDepartments">—</h3>
            </div>

            <div class="stat-card">
                <div class="stat-icon">👥</div>
                <p>Total Employees</p>
                <h3 id="totalEmployees">—</h3>
            </div>

            <div class="stat-card">
                <div class="stat-icon">📊</div>
                <p>Departments with Employees</p>
                <h3 id="activeDepartments">—</h3>
            </div>

        </section>

        <!-- Department table -->
        <section class="table-card">

            <div class="table-heading">
                <h2>Department Directory</h2>

                <input type="search"
                       id="searchInput"
                       class="search-input"
                       placeholder="🔎 Search by ID, name or description">
            </div>

            <div id="statusMessage"
                 class="status-message"
                 role="status"
                 aria-live="polite"></div>

            <div class="table-wrapper">
                <table class="department-table">

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Department Name</th>
                            <th>Description</th>
                            <th>Employees</th>
                        </tr>
                    </thead>

                    <tbody id="departmentTableBody">
                        <tr>
                            <td colspan="4" class="empty-state">
                                Loading departments...
                            </td>
                        </tr>
                    </tbody>

                </table>
            </div>

        </section>

        <footer class="dashboard-footer">
            Employee Management System · Department Overview
        </footer>

    </div>
</div>

<script>
    const contextPath = '${pageContext.request.contextPath}';
    const departmentApi = contextPath + '/api/departments';
    const employeeApi = contextPath + '/api/employees';

    let allDepartments = [];
    let allEmployees = [];

    const tableBody = document.getElementById('departmentTableBody');
    const searchInput = document.getElementById('searchInput');
    const statusMessage = document.getElementById('statusMessage');

    function showStatus(text, type) {
        statusMessage.textContent = text;
        statusMessage.className = 'status-message ' + type;
    }

    function clearStatus() {
        statusMessage.textContent = '';
        statusMessage.className = 'status-message';
    }

    async function loadDashboard() {
        clearStatus();

        tableBody.replaceChildren();

        const loadingRow = document.createElement('tr');
        const loadingCell = document.createElement('td');
        loadingCell.colSpan = 4;
        loadingCell.className = 'empty-state';
        loadingCell.textContent = 'Loading department information...';
        loadingRow.appendChild(loadingCell);
        tableBody.appendChild(loadingRow);

        try {
            const results = await Promise.all([
                fetch(departmentApi),
                fetch(employeeApi)
            ]);

            if (!results[0].ok || !results[1].ok) {
                throw new Error('Unable to retrieve department or employee data.');
            }

            const departments = await results[0].json();
            const employees = await results[1].json();

            if (!Array.isArray(departments) || !Array.isArray(employees)) {
                throw new Error('The APIs did not return the expected JSON arrays.');
            }

            allDepartments = departments;
            allEmployees = employees;

            updateStatistics();
            renderDepartments();

        } catch (error) {
            tableBody.replaceChildren();

            const row = document.createElement('tr');
            const cell = document.createElement('td');
            cell.colSpan = 4;
            cell.className = 'empty-state';
            cell.textContent = 'Unable to load department data.';
            row.appendChild(cell);
            tableBody.appendChild(row);

            showStatus(
                error.message + ' Check that your Spring Boot application and APIs are running.',
                'error'
            );
        }
    }

    function updateStatistics() {
        const activeDepartmentIds = new Set(
            allEmployees
                .filter(employee => employee.department &&
                    employee.department.id != null)
                .map(employee => String(employee.department.id))
        );

        document.getElementById('totalDepartments').textContent =
            allDepartments.length;

        document.getElementById('totalEmployees').textContent =
            allEmployees.length;

        document.getElementById('activeDepartments').textContent =
            activeDepartmentIds.size;
    }

    function renderDepartments() {
        const query = searchInput.value.trim().toLowerCase();

        const filteredDepartments = allDepartments.filter(function(department) {
            const searchableText = [
                department.id,
                department.name,
                department.description
            ].map(value => value == null ? '' : String(value))
             .join(' ')
             .toLowerCase();

            return searchableText.includes(query);
        });

        tableBody.replaceChildren();

        if (filteredDepartments.length === 0) {
            const row = document.createElement('tr');
            const cell = document.createElement('td');

            cell.colSpan = 4;
            cell.className = 'empty-state';

            const icon = document.createElement('div');
            icon.className = 'empty-icon';
            icon.textContent = '🔍';

            const text = document.createElement('div');
            text.textContent = allDepartments.length === 0
                ? 'No departments found. Register your first department.'
                : 'No departments match your search.';

            cell.append(icon, text);
            row.appendChild(cell);
            tableBody.appendChild(row);
            return;
        }

        filteredDepartments.forEach(function(department) {
            const employeeCount = allEmployees.filter(function(employee) {
                return employee.department &&
                    String(employee.department.id) === String(department.id);
            }).length;

            const row = document.createElement('tr');

            const idCell = document.createElement('td');
            const idBadge = document.createElement('span');
            idBadge.className = 'department-id';
            idBadge.textContent = department.id ?? '—';
            idCell.appendChild(idBadge);

            const nameCell = document.createElement('td');
            nameCell.className = 'department-name';
            nameCell.textContent = department.name || 'Unnamed Department';

            const descriptionCell = document.createElement('td');
            descriptionCell.textContent =
                department.description || 'No description provided';

            const countCell = document.createElement('td');
            const countBadge = document.createElement('span');
            countBadge.className = 'employee-count';
            countBadge.textContent = employeeCount;
            countCell.appendChild(countBadge);

            row.append(idCell, nameCell, descriptionCell, countCell);
            tableBody.appendChild(row);
        });
    }

    searchInput.addEventListener('input', renderDepartments);

    loadDashboard();
</script>

</body>
</html>
