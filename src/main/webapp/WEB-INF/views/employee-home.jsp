<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Employee Dashboard | EMS Portal</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/styles.css">

    <style>
        .dashboard {
            max-width: 1200px;
            margin: 35px auto;
            padding: 0 24px;
        }

        .dashboard-banner {
            padding: 30px;
            border-radius: 20px;
            color: white;
            background: linear-gradient(120deg, #5145cd, #8b5cf6, #3b82f6);
            box-shadow: 0 12px 30px #6554e82e;
        }

        .dashboard-banner h1 {
            margin: 0 0 10px;
            font-size: 30px;
        }

        .dashboard-banner p {
            margin: 0;
            color: #f0edff;
            font-size: 14px;
        }

        .dashboard-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 22px;
        }

        .dashboard-actions a,
        .dashboard-actions button {
            padding: 12px 17px;
            border-radius: 9px;
            font-size: 13px;
            font-weight: 700;
        }

        .action-white {
            color: #5145cd;
            background: white;
        }

        .action-transparent {
            color: white;
            background: #ffffff20;
            border: 1px solid #ffffff80;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
            margin: 25px 0;
        }

        .stat-card {
            padding: 23px;
            background: white;
            border: 1px solid #e8e9f6;
            border-radius: 16px;
            box-shadow: 0 6px 20px #26346b0a;
        }

        .stat-icon {
            display: grid;
            place-items: center;
            width: 48px;
            height: 48px;
            margin-bottom: 16px;
            border-radius: 14px;
            font-size: 24px;
        }

        .stat-purple { background: #eeeaff; }
        .stat-blue { background: #e0f2fe; }
        .stat-green { background: #dcfce7; }

        .stat-label {
            color: #69738b;
            font-size: 13px;
        }

        .stat-value {
            display: block;
            margin-top: 7px;
            color: #18213b;
            font-size: 29px;
            font-weight: 800;
        }

        .employee-panel {
            padding: 25px;
            border: 1px solid #e8e9f6;
            border-radius: 18px;
            background: white;
            box-shadow: 0 6px 20px #26346b0a;
        }

        .panel-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
        }

        .panel-heading h2 {
            margin: 0 0 5px;
            font-size: 22px;
        }

        .panel-heading p {
            margin: 0;
            color: #69738b;
            font-size: 12px;
        }

        .search-box {
            width: 100%;
            max-width: 320px;
            margin: 0;
        }

        .employee-table {
            min-width: 650px;
        }

        .employee-table th {
            padding: 15px;
            background: #eeeaff;
            color: #5145cd;
            text-transform: uppercase;
            font-size: 11px;
            letter-spacing: 0.5px;
        }

        .employee-table td {
            padding: 15px;
            color: #45516b;
        }

        .employee-name {
            color: #202944;
            font-weight: 700;
        }

        .id-badge {
            display: inline-block;
            padding: 5px 9px;
            color: #5145cd;
            background: #eeeaff;
            border-radius: 7px;
            font-weight: 700;
        }

        .salary-badge {
            display: inline-block;
            padding: 5px 9px;
            color: #087b55;
            background: #dcfce7;
            border-radius: 7px;
            font-weight: 700;
        }

        .department-badge {
            display: inline-block;
            padding: 5px 9px;
            color: #1769aa;
            background: #e0f2fe;
            border-radius: 7px;
        }

        .empty-state {
            padding: 30px;
            color: #69738b;
            text-align: center;
        }

        .status-message {
            margin: 12px 0;
            font-size: 13px;
        }

        .dashboard-footer {
            padding: 25px 10px;
            color: #788198;
            text-align: center;
            font-size: 12px;
        }

        @media (max-width: 700px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }

            .dashboard-banner {
                padding: 23px;
            }

            .dashboard-banner h1 {
                font-size: 25px;
            }

            .employee-panel {
                padding: 16px;
            }

            .panel-heading {
                align-items: stretch;
                flex-direction: column;
            }

            .search-box {
                max-width: none;
            }
        }
    </style>
</head>

<body>

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

<main class="dashboard">

    <!-- Dashboard Header -->
    <section class="dashboard-banner">
        <h1>👋 Employee Dashboard</h1>
        <p>View and manage your organization's employee records.</p>

        <div class="dashboard-actions">
            <a class="action-white"
               href="${pageContext.request.contextPath}/employee-register">
                + Add New Employee
            </a>

            <button class="action-transparent" type="button"
                    onclick="loadEmployees()">
                ↻ Refresh Data
            </button>

            <a class="action-transparent"
               href="${pageContext.request.contextPath}/department-home">
                View Departments →
            </a>
        </div>
    </section>

    <!-- Statistics -->
    <section class="stats-grid">
        <div class="stat-card">
            <div class="stat-icon stat-purple">👥</div>
            <span class="stat-label">Total Employees</span>
            <strong class="stat-value" id="employeeCount">0</strong>
        </div>

        <div class="stat-card">
            <div class="stat-icon stat-blue">🏢</div>
            <span class="stat-label">Departments Represented</span>
            <strong class="stat-value" id="departmentCount">0</strong>
        </div>

        <div class="stat-card">
            <div class="stat-icon stat-green">💰</div>
            <span class="stat-label">Average Salary</span>
            <strong class="stat-value" id="averageSalary">—</strong>
        </div>
    </section>

    <!-- Employee Table -->
    <section class="employee-panel">
        <div class="panel-heading">
            <div>
                <h2>Employee Directory</h2>
                <p>Employee information retrieved from your database</p>
            </div>

            <input
                type="search"
                id="searchInput"
                class="search-box"
                placeholder="🔎 Search name, email or department..."
                aria-label="Search employees">
        </div>

        <p id="message" class="status-message" role="status"></p>

        <div class="table-container">
            <table class="employee-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Employee</th>
                        <th>Email</th>
                        <th>Salary</th>
                        <th>Department</th>
                    </tr>
                </thead>

                <tbody id="employeeRows">
                    <tr>
                        <td colspan="5" class="empty-state">
                            Loading employee records...
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <p id="resultCount" class="stat-label"></p>
    </section>

</main>

<footer class="dashboard-footer">
    © 2026 Employee Management System · Manage people, build success 💙
</footer>

<script>
    const contextPath = '${pageContext.request.contextPath}';
    const employeeApi = contextPath + '/api/employees';

    let allEmployees = [];

    function formatSalary(value) {
        if (value === null || value === undefined || value === '') {
            return '—';
        }

        const salary = Number(value);

        if (!Number.isFinite(salary)) {
            return String(value);
        }

        return salary.toLocaleString('en-IN', {
            maximumFractionDigits: 2
        });
    }

    function renderEmployees(employees) {
        const tbody = document.getElementById('employeeRows');
        tbody.replaceChildren();

        if (employees.length === 0) {
            const row = document.createElement('tr');
            const cell = document.createElement('td');

            cell.colSpan = 5;
            cell.className = 'empty-state';
            cell.textContent = allEmployees.length === 0
                ? 'No employees found. Register your first employee!'
                : 'No matching employees found. Try another search.';

            row.appendChild(cell);
            tbody.appendChild(row);
        } else {
            employees.forEach(employee => {
                const row = document.createElement('tr');

                const idCell = document.createElement('td');
                const idBadge = document.createElement('span');
                idBadge.className = 'id-badge';
                idBadge.textContent = employee.id ?? '—';
                idCell.appendChild(idBadge);
                row.appendChild(idCell);

                const nameCell = document.createElement('td');
                nameCell.className = 'employee-name';
                nameCell.textContent = employee.name ?? '—';
                row.appendChild(nameCell);

                const emailCell = document.createElement('td');
                emailCell.textContent = employee.email ?? '—';
                row.appendChild(emailCell);

                const salaryCell = document.createElement('td');
                const salaryBadge = document.createElement('span');
                salaryBadge.className = 'salary-badge';
                salaryBadge.textContent = formatSalary(employee.salary);
                salaryCell.appendChild(salaryBadge);
                row.appendChild(salaryCell);

                const departmentCell = document.createElement('td');
                const departmentBadge = document.createElement('span');
                departmentBadge.className = 'department-badge';
                departmentBadge.textContent =
                    employee.department?.name ?? 'Not assigned';
                departmentCell.appendChild(departmentBadge);
                row.appendChild(departmentCell);

                tbody.appendChild(row);
            });
        }

        document.getElementById('resultCount').textContent =
            'Showing ' + employees.length + ' of ' +
            allEmployees.length + ' employee(s)';
    }

    function updateStatistics() {
        document.getElementById('employeeCount').textContent =
            allEmployees.length;

        const departments = new Set(
            allEmployees
                .filter(employee => employee.department?.id != null)
                .map(employee => String(employee.department.id))
        );

        document.getElementById('departmentCount').textContent =
            departments.size;

        const salaries = allEmployees
            .map(employee => Number(employee.salary))
            .filter(salary => Number.isFinite(salary));

        const average = salaries.length
            ? salaries.reduce((sum, salary) => sum + salary, 0)
                / salaries.length
            : null;

        document.getElementById('averageSalary').textContent =
            average === null ? '—' : formatSalary(average);
    }

    async function loadEmployees() {
        const message = document.getElementById('message');
        const tbody = document.getElementById('employeeRows');

        message.textContent = 'Loading employee records...';
        message.style.color = '#5145cd';

        try {
            const response = await fetch(employeeApi, {
                headers: {
                    'Accept': 'application/json'
                }
            });

            if (!response.ok) {
                throw new Error(
                    'Server returned HTTP ' + response.status
                );
            }

            const data = await response.json();

            if (!Array.isArray(data)) {
                throw new Error(
                    'Expected a list of employees from ' + employeeApi
                );
            }

            allEmployees = data;
            updateStatistics();
            filterEmployees();

            message.textContent = 'Employee data loaded successfully.';
            message.style.color = '#087b55';

        } catch (error) {
            message.textContent = 'Could not load employees: ' + error.message;
            message.style.color = '#d14343';

            tbody.replaceChildren();

            const row = document.createElement('tr');
            const cell = document.createElement('td');

            cell.colSpan = 5;
            cell.className = 'empty-state';
            cell.textContent =
                'Unable to retrieve employee records. Check your API URL and server logs.';

            row.appendChild(cell);
            tbody.appendChild(row);
        }
    }

    function filterEmployees() {
        const query = document.getElementById('searchInput')
            .value.trim().toLowerCase();

        const filtered = allEmployees.filter(employee => {
            const name = String(employee.name ?? '').toLowerCase();
            const email = String(employee.email ?? '').toLowerCase();
            const department = String(
                employee.department?.name ?? ''
            ).toLowerCase();
            const id = String(employee.id ?? '').toLowerCase();

            return name.includes(query)
                || email.includes(query)
                || department.includes(query)
                || id.includes(query);
        });

        renderEmployees(filtered);
    }

    document.getElementById('searchInput')
        .addEventListener('input', filterEmployees);

    loadEmployees();
</script>

</body>
</html>
