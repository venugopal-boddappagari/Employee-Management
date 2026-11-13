<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Register Department | EMS Portal</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/styles.css">

    <style>
        .department-register-page {
            min-height: 100vh;
            padding: 45px 20px;
            background: linear-gradient(135deg, #eef2ff, #f8fafc, #f3e8ff);
        }

        .register-container {
            max-width: 1050px;
            margin: auto;
            display: grid;
            grid-template-columns: 0.9fr 1.1fr;
            background: white;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(30, 41, 59, 0.12);
        }

        .register-info {
            padding: 45px 35px;
            color: white;
            background: linear-gradient(145deg, #4338ca, #7c3aed, #a855f7);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .register-icon {
            font-size: 58px;
            margin-bottom: 20px;
        }

        .register-info h1 {
            font-size: 32px;
            line-height: 1.3;
            margin: 0 0 15px;
        }

        .register-info p {
            color: #ede9fe;
            line-height: 1.8;
        }

        .register-info ul {
            padding-left: 20px;
            margin-top: 20px;
            line-height: 2.3;
        }

        .register-form {
            padding: 45px 40px;
        }

        .register-form h2 {
            color: #1e293b;
            font-size: 28px;
            margin: 0 0 8px;
        }

        .form-subtitle {
            color: #64748b;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-group label {
            display: block;
            color: #334155;
            font-weight: 600;
            margin-bottom: 9px;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            box-sizing: border-box;
            padding: 14px 15px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            background: #f8fafc;
            color: #1e293b;
            font-size: 15px;
            font-family: inherit;
            outline: none;
            transition: 0.2s;
        }

        .form-group textarea {
            min-height: 140px;
            resize: vertical;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #6366f1;
            background: white;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.13);
        }

        .field-hint {
            display: block;
            color: #94a3b8;
            font-size: 12px;
            margin-top: 7px;
        }

        .form-actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 30px;
        }

        .submit-btn,
        .reset-btn {
            padding: 13px 20px;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            transition: 0.2s;
        }

        .submit-btn {
            flex: 1;
            color: white;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
        }

        .submit-btn:hover {
            opacity: 0.92;
            transform: translateY(-1px);
        }

        .submit-btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .reset-btn {
            color: #334155;
            background: #e2e8f0;
        }

        .message {
            display: none;
            padding: 14px 15px;
            border-radius: 10px;
            margin-bottom: 22px;
            line-height: 1.5;
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

        .back-link {
            display: inline-block;
            margin-top: 25px;
            color: #4f46e5;
            text-decoration: none;
            font-weight: 600;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 760px) {
            .register-container {
                grid-template-columns: 1fr;
            }

            .register-info {
                padding: 30px 25px;
            }

            .register-info h1 {
                font-size: 26px;
            }

            .register-form {
                padding: 30px 25px;
            }
        }
    </style>
</head>

<body>

<%
    String contextPath = request.getContextPath();
%>

<div class="department-register-page">

    <div class="register-container">

        <!-- Left information panel -->
        <section class="register-info">

            <div class="register-icon">🏢</div>

            <h1>Create a New Department</h1>

            <p>
                Organize your workforce by creating departments.
                Add a department name, password, and description to get started.
            </p>

            <ul>
                <li>🏷️ Create department records</li>
                <li>🔐 Set department login credentials</li>
                <li>👥 Organize employees by department</li>
                <li>📊 Monitor department allocation</li>
                <li>⚡ Manage records through the EMS portal</li>
            </ul>

        </section>

        <!-- Registration form -->
        <section class="register-form">

            <h2>Department Registration</h2>

            <p class="form-subtitle">
                Enter the details below to register a department.
            </p>

            <div id="message"
                 class="message"
                 role="status"
                 aria-live="polite"></div>

            <form id="departmentForm">

                <div class="form-group">
                    <label for="name">Department Name *</label>

                    <input type="text"
                           id="name"
                           name="name"
                           placeholder="e.g. Human Resources"
                           maxlength="100"
                           autocomplete="organization"
                           required>

                    <span class="field-hint">
                        Enter a clear and unique department name.
                    </span>
                </div>

                <!-- Password field added -->
                <div class="form-group">
                    <label for="password">Department Password *</label>

                    <input type="password"
                           id="password"
                           name="password"
                           placeholder="Create a password"
                           minlength="8"
                           autocomplete="new-password"
                           required>

                    <span class="field-hint">
                        Password must contain at least 8 characters.
                    </span>
                </div>

                <div class="form-group">
                    <label for="description">Department Description *</label>

                    <textarea id="description"
                              name="description"
                              placeholder="Describe the department's responsibilities..."
                              maxlength="1000"
                              required></textarea>

                    <span class="field-hint">
                        Briefly explain the purpose of this department.
                    </span>
                </div>

                <div class="form-actions">
                    <button type="submit"
                            id="submitButton"
                            class="submit-btn">
                        ➕ Register Department
                    </button>

                    <button type="reset" class="reset-btn">
                        Reset
                    </button>
                </div>

            </form>

            <a class="back-link"
               href="<%= contextPath %>/department-home">
                ← Back to Department Dashboard
            </a>

        </section>

    </div>

</div>

<script>
    const contextPath = '${pageContext.request.contextPath}';
    const departmentApi = contextPath + '/api/departments';

    const form = document.getElementById('departmentForm');
    const message = document.getElementById('message');
    const submitButton = document.getElementById('submitButton');

    function showMessage(text, type) {
        message.textContent = text;
        message.className = 'message ' + type;
    }

    form.addEventListener('submit', async function(event) {
        event.preventDefault();

        const name = document.getElementById('name').value.trim();
        const password = document.getElementById('password').value;
        const description = document.getElementById('description').value.trim();

        if (!name || !password || !description) {
            showMessage(
                'Please enter the department name, password, and description.',
                'error'
            );
            return;
        }

        if (password.length < 8) {
            showMessage(
                'Password must contain at least 8 characters.',
                'error'
            );
            return;
        }

        const department = {
            name: name,
            password: password,
            description: description
        };

        submitButton.disabled = true;
        submitButton.textContent = 'Registering...';

        try {
            const response = await fetch(departmentApi, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(department)
            });

            const responseText = await response.text();

            if (!response.ok) {
                throw new Error(
                    responseText || 'Department registration failed.'
                );
            }

            showMessage(
                '✅ Department registered successfully!',
                'success'
            );

            form.reset();

        } catch (error) {
            showMessage(
                '❌ ' + error.message,
                'error'
            );
        } finally {
            submitButton.disabled = false;
            submitButton.textContent = '➕ Register Department';
        }
    });
</script>

</body>
</html>
