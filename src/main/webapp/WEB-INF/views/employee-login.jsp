<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Employee Login | EMS Portal</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/styles.css">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Poppins', Arial, sans-serif;
        }

        .login-page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 20px;
            background: linear-gradient(135deg, #eef2ff, #f5f3ff, #ecfeff);
        }

        .login-container {
            width: 100%;
            max-width: 1000px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            background: white;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(30, 41, 59, 0.13);
        }

        .login-info {
            padding: 50px 40px;
            color: white;
            background: linear-gradient(145deg, #4338ca, #6366f1, #7c3aed);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .brand {
            font-size: 15px;
            font-weight: 700;
            letter-spacing: 1px;
            margin-bottom: 35px;
        }

        .login-illustration {
            font-size: 65px;
            margin-bottom: 20px;
        }

        .login-info h1 {
            font-size: 32px;
            line-height: 1.3;
            margin: 0 0 15px;
        }

        .login-info p {
            color: #e0e7ff;
            line-height: 1.8;
        }

        .feature-list {
            margin-top: 20px;
            padding: 0;
            list-style: none;
        }

        .feature-list li {
            margin: 15px 0;
            color: #f5f3ff;
        }

        .login-form-section {
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-form-section h2 {
            color: #1e293b;
            font-size: 29px;
            margin: 0 0 10px;
        }

        .subtitle {
            color: #64748b;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 22px;
        }

        .form-group label {
            display: block;
            margin-bottom: 9px;
            color: #334155;
            font-weight: 600;
            font-size: 14px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #818cf8;
        }

        .form-group input {
            width: 100%;
            padding: 14px 45px 14px 42px;
            border: 1px solid #cbd5e1;
            border-radius: 11px;
            background: #f8fafc;
            font-size: 14px;
            outline: none;
            transition: 0.2s;
        }

        .form-group input:focus {
            border-color: #6366f1;
            background: white;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.13);
        }

        .toggle-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            border: none;
            background: transparent;
            color: #6366f1;
            cursor: pointer;
            font-size: 12px;
            font-weight: 600;
        }

        .login-button {
            width: 100%;
            padding: 15px;
            margin-top: 8px;
            border: none;
            border-radius: 11px;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            color: white;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
        }

        .login-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(79, 70, 229, 0.22);
        }

        .login-button:disabled {
            opacity: 0.65;
            cursor: not-allowed;
            transform: none;
        }

        .message {
            display: none;
            padding: 13px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 13px;
            line-height: 1.6;
            overflow-wrap: anywhere;
        }

        .message.error {
            display: block;
            background: #fee2e2;
            color: #991b1b;
        }

        .message.success {
            display: block;
            background: #dcfce7;
            color: #166534;
        }

        .login-links {
            margin-top: 25px;
            text-align: center;
            font-size: 13px;
            line-height: 2;
        }

        .login-links a {
            color: #4f46e5;
            text-decoration: none;
            font-weight: 600;
        }

        .login-links a:hover {
            text-decoration: underline;
        }

        .security-note {
            margin-top: 25px;
            padding: 12px;
            border-radius: 10px;
            background: #f1f5f9;
            color: #64748b;
            font-size: 12px;
            text-align: center;
            line-height: 1.6;
        }

        @media (max-width: 760px) {
            .login-container {
                grid-template-columns: 1fr;
            }

            .login-info {
                padding: 30px 25px;
            }

            .brand {
                margin-bottom: 20px;
            }

            .login-illustration {
                font-size: 45px;
            }

            .login-info h1 {
                font-size: 26px;
            }

            .feature-list {
                display: none;
            }

            .login-form-section {
                padding: 35px 25px;
            }
        }
    </style>
</head>

<body>

<%
    String contextPath = request.getContextPath();
%>

<div class="login-page">

    <div class="login-container">

        <!-- Left information panel -->
        <section class="login-info">

            <div class="brand">🏢 EMS PORTAL</div>

            <div class="login-illustration">👨‍💼</div>

            <h1>Welcome Back!</h1>

            <p>
                Sign in to access your employee portal and manage
                your employee information in one place.
            </p>

            <ul class="feature-list">
                <li>✓ Access your employee dashboard</li>
                <li>✓ View employee information</li>
                <li>✓ Explore department details</li>
                <li>✓ Easy-to-use management portal</li>
            </ul>

        </section>

        <!-- Right login panel -->
        <section class="login-form-section">

            <h2>Employee Login</h2>

            <p class="subtitle">
                Enter your login details to continue.
            </p>

            <div id="message"
                 class="message"
                 role="status"
                 aria-live="polite"></div>

            <form id="loginForm">

                <div class="form-group">
                    <label for="username">Username or Email</label>

                    <div class="input-wrapper">
                        <span class="input-icon">👤</span>

                        <input type="text"
                               id="username"
                               name="username"
                               placeholder="Enter your username or email"
                               autocomplete="username"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>

                    <div class="input-wrapper">
                        <span class="input-icon">🔒</span>

                        <input type="password"
                               id="password"
                               name="password"
                               placeholder="Enter your password"
                               autocomplete="current-password"
                               required>

                        <button type="button"
                                class="toggle-password"
                                id="togglePassword">
                            Show
                        </button>
                    </div>
                </div>

                <button type="submit"
                        id="loginButton"
                        class="login-button">
                    Sign In →
                </button>

            </form>

            <div class="login-links">
                New employee?
                <a href="<%= contextPath %>/employee-register">
                    Register here
                </a>
                <br>

                <a href="<%= contextPath %>/">
                    ← Back to Home
                </a>
            </div>

            <div class="security-note">
                🔐 Keep your login credentials private.
            </div>

        </section>

    </div>

</div>

<script>
    const form = document.getElementById('loginForm');
    const message = document.getElementById('message');
    const passwordInput = document.getElementById('password');
    const togglePassword = document.getElementById('togglePassword');
    const loginButton = document.getElementById('loginButton');

    const contextPath = '${pageContext.request.contextPath}';

    togglePassword.addEventListener('click', function() {
        const isPassword = passwordInput.type === 'password';
        passwordInput.type = isPassword ? 'text' : 'password';
        togglePassword.textContent = isPassword ? 'Hide' : 'Show';
    });

    form.addEventListener('submit', async function(event) {
        event.preventDefault();

        const email = document.getElementById('username').value.trim();
        const password = passwordInput.value;

        if (!email || !password) {
            message.textContent = 'Please enter your email and password.';
            message.className = 'message error';
            return;
        }

        loginButton.disabled = true;
        loginButton.textContent = 'Logging in...';

        try {
            const response = await fetch(
                contextPath + '/api/employees/login',
                {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        email: email,
                        password: password
                    })
                }
            );

            const data = await response.json();

            if (response.ok && data.employeeId != null) {
                sessionStorage.setItem(
                    'employeeId',
                    String(data.employeeId)
                );

                window.location.href = contextPath + '/employee-home';
            } else {
                message.textContent =
                    data.message || 'Login failed. Employee ID was not returned.';
                message.className = 'message error';
            }

        } catch (error) {
            console.error('Login error:', error);
            message.textContent =
                'Unable to connect to the server. Please try again.';
            message.className = 'message error';

        } finally {
            loginButton.disabled = false;
            loginButton.textContent = 'Sign In →';
        }
    });
</script>

</body>
</html>
