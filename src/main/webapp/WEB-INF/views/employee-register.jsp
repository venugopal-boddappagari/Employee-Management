
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Registration | EMS</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            padding: 30px 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .register-container {
            width: 100%;
            max-width: 560px;
            padding: 38px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.20);
        }

        .header {
            margin-bottom: 28px;
            text-align: center;
        }

        .header .icon {
            width: 72px;
            height: 72px;
            margin: 0 auto 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            color: white;
            font-size: 30px;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .header h1 {
            margin-bottom: 8px;
            color: #333;
            font-size: 27px;
            font-weight: 700;
        }

        .header p {
            color: #777;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 19px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-size: 14px;
            font-weight: 500;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 13px 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            outline: none;
            background: #fafafa;
            color: #333;
            font-size: 14px;
            transition: 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #667eea;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.12);
        }

        .password-wrapper {
            position: relative;
        }

        .password-wrapper input {
            padding-right: 75px;
        }

        .toggle-password {
            position: absolute;
            top: 50%;
            right: 13px;
            transform: translateY(-50%);
            border: none;
            background: transparent;
            color: #667eea;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .submit-btn {
            width: 100%;
            margin-top: 8px;
            padding: 14px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 18px rgba(102, 126, 234, 0.35);
        }

        .submit-btn:disabled {
            cursor: not-allowed;
            opacity: 0.65;
            transform: none;
        }

        .message {
            display: none;
            margin-top: 18px;
            padding: 12px;
            border-radius: 8px;
            font-size: 13px;
            overflow-wrap: anywhere;
        }

        .message.success {
            display: block;
            color: #166534;
            background: #dcfce7;
        }

        .message.error {
            display: block;
            color: #991b1b;
            background: #fee2e2;
        }

        .footer {
            margin-top: 24px;
            text-align: center;
            color: #777;
            font-size: 13px;
            line-height: 2.2;
        }

        .footer a {
            color: #667eea;
            font-weight: 600;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        @media (max-width: 500px) {
            .register-container {
                padding: 25px 20px;
            }

            .header h1 {
                font-size: 23px;
            }
        }
    </style>
</head>

<body>

<div class="register-container">

    <div class="header">
        <div class="icon">&#128100;</div>
        <h1>Employee Registration</h1>
        <p>Create your employee account</p>
    </div>

    <form id="employeeForm">

        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name"
                   placeholder="Enter your full name" required>
        </div>

        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email"
                   placeholder="Enter your email address" required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <div class="password-wrapper">
                <input type="password" id="password" name="password"
                       placeholder="Create a password" minlength="8" required>
                <button type="button" class="toggle-password"
                        id="togglePassword">Show</button>
            </div>
        </div>

        <div class="form-group">
            <label for="gender">Gender</label>
            <select id="gender" name="gender" required>
                <option value="">Select your gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="form-group">
            <label for="salary">Salary</label>
            <input type="number" id="salary" name="salary"
                   placeholder="Enter salary" min="0" step="0.01" required>
        </div>

        <div class="form-group">
            <label for="departmentId">Department</label>
            <select id="departmentId" name="departmentId" required>
                <option value="">Loading departments...</option>
            </select>
        </div>

        <button type="submit" class="submit-btn" id="submitBtn">
            Register Employee
        </button>

        <div id="message" class="message" role="status"></div>

    </form>

    <div class="footer">
        <p>Already registered?
            <a href="${pageContext.request.contextPath}/employee-login">Login here</a>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/">← Back to Home</a>
        </p>
    </div>

</div>

<script>
    const contextPath = '${pageContext.request.contextPath}';
    const employeeApi = contextPath + '/api/employees';
    const departmentApi = contextPath + '/api/departments';

    const form = document.getElementById('employeeForm');
    const message = document.getElementById('message');
    const submitBtn = document.getElementById('submitBtn');
    const departmentSelect = document.getElementById('departmentId');

    function showMessage(text, type) {
        message.textContent = text;
        message.className = 'message ' + type;
    }

    // Show or hide password
    document.getElementById('togglePassword').addEventListener('click', function () {
        const password = document.getElementById('password');
        const isPassword = password.type === 'password';

        password.type = isPassword ? 'text' : 'password';
        this.textContent = isPassword ? 'Hide' : 'Show';
    });

    // Load department names and their generated IDs
    async function loadDepartments() {
        departmentSelect.disabled = true;

        try {
            const response = await fetch(departmentApi);

            if (!response.ok) {
                throw new Error('Unable to load departments.');
            }

            const departments = await response.json();

            departmentSelect.replaceChildren();

            const defaultOption = document.createElement('option');
            defaultOption.value = '';
            defaultOption.textContent = 'Select Department';
            departmentSelect.appendChild(defaultOption);

            departments.forEach(department => {
                const option = document.createElement('option');

                // ID is sent to the backend
                option.value = department.id;

                // Name is displayed to the user
                option.textContent = department.name;

                departmentSelect.appendChild(option);
            });

            if (departments.length === 0) {
                showMessage(
                    'Please register a department before registering an employee.',
                    'error'
                );
            } else {
                message.className = 'message';
                message.textContent = '';
            }

        } catch (error) {
            departmentSelect.innerHTML =
                '<option value="">Unable to load departments</option>';

            showMessage(error.message, 'error');

        } finally {
            departmentSelect.disabled = false;
        }
    }

    // Register employee
    form.addEventListener('submit', async function (event) {
        event.preventDefault();

        if (!form.reportValidity()) {
            return;
        }

        if (!departmentSelect.value) {
            showMessage('Please select a department.', 'error');
            return;
        }

        const employee = {
            name: document.getElementById('name').value.trim(),
            email: document.getElementById('email').value.trim(),
            password: document.getElementById('password').value,
            gender: document.getElementById('gender').value,
            salary: Number(document.getElementById('salary').value),
            departmentId: Number(departmentSelect.value)
        };

        submitBtn.disabled = true;
        submitBtn.textContent = 'Registering...';

        try {
            const response = await fetch(employeeApi, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(employee)
            });

            const result = await response.text();

            if (!response.ok) {
                throw new Error(
                    result || 'Employee registration failed.'
                );
            }

            showMessage('Employee registered successfully!', 'success');

            form.reset();

        } catch (error) {
            showMessage(
                error.message || 'Something went wrong.',
                'error'
            );

        } finally {
            submitBtn.disabled = false;
            submitBtn.textContent = 'Register Employee';
        }
    });

    // Load departments when the page opens
    loadDepartments();
</script>

</body>
</html>
