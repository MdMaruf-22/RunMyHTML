import '../models/html_template.dart';

class Templates {
  static const List<HtmlTemplate> templates = [
    HtmlTemplate(
      name: 'Basic HTML',
      description: 'A simple HTML template to get started',
      category: 'Basic',
      content: '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML Preview</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f0f0f0;
        }
        
        h1 {
            color: #333;
            text-align: center;
        }
        
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to RunMyHTML!</h1>
        <p>Edit the HTML and CSS code to see your changes in real-time.</p>
        <p>You can create beautiful web pages right here in the app!</p>
    </div>
</body>
</html>''',
    ),

    HtmlTemplate(
      name: 'Card Layout',
      description: 'A modern card-based layout',
      category: 'Layout',
      content: '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Card Layout</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            margin: 20px auto;
            max-width: 400px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            transform: translateY(0);
            transition: transform 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .card h2 {
            color: #333;
            margin-bottom: 15px;
            font-size: 24px;
        }
        
        .card p {
            color: #666;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        
        .btn {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 16px;
            transition: opacity 0.3s ease;
        }
        
        .btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Beautiful Card</h2>
        <p>This is a modern card design with gradient background and hover effects. Perfect for showcasing content in an elegant way.</p>
        <button class="btn">Learn More</button>
    </div>
    
    <div class="card">
        <h2>Another Card</h2>
        <p>Cards are great for organizing content into digestible sections. They provide visual separation and hierarchy.</p>
        <button class="btn">Get Started</button>
    </div>
</body>
</html>''',
    ),

    HtmlTemplate(
      name: 'Dashboard',
      description: 'A simple dashboard layout with stats',
      category: 'Layout',
      content: '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
        }
        
        .header {
            background: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        
        .dashboard {
            padding: 20px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }
        
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }
        
        .stat-card:hover {
            transform: scale(1.05);
        }
        
        .stat-number {
            font-size: 36px;
            font-weight: bold;
            color: #3498db;
            margin-bottom: 10px;
        }
        
        .stat-label {
            color: #7f8c8d;
            font-size: 14px;
            text-transform: uppercase;
        }
        
        .progress-bar {
            background: #ecf0f1;
            border-radius: 10px;
            height: 10px;
            margin-top: 15px;
            overflow: hidden;
        }
        
        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, #3498db, #2ecc71);
            border-radius: 10px;
            transition: width 0.3s ease;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Analytics Dashboard</h1>
        <p>Real-time statistics and metrics</p>
    </div>
    
    <div class="dashboard">
        <div class="stat-card">
            <div class="stat-number">1,234</div>
            <div class="stat-label">Total Users</div>
            <div class="progress-bar">
                <div class="progress-fill" style="width: 75%"></div>
            </div>
        </div>
        
        <div class="stat-card">
            <div class="stat-number">56,789</div>
            <div class="stat-label">Revenue</div>
            <div class="progress-bar">
                <div class="progress-fill" style="width: 60%"></div>
            </div>
        </div>
        
        <div class="stat-card">
            <div class="stat-number">987</div>
            <div class="stat-label">Orders</div>
            <div class="progress-bar">
                <div class="progress-fill" style="width: 90%"></div>
            </div>
        </div>
        
        <div class="stat-card">
            <div class="stat-number">4.8</div>
            <div class="stat-label">Rating</div>
            <div class="progress-bar">
                <div class="progress-fill" style="width: 95%"></div>
            </div>
        </div>
    </div>
</body>
</html>''',
    ),

    HtmlTemplate(
      name: 'Login Form',
      description: 'A modern login form with animations',
      category: 'Form',
      content: '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .login-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
            width: 100%;
            max-width: 400px;
            animation: slideUp 0.5s ease;
        }
        
        @keyframes slideUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        
        .login-header {
            background: linear-gradient(135deg, #74b9ff, #0984e3);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .login-header h2 {
            font-size: 28px;
            margin-bottom: 10px;
        }
        
        .login-form {
            padding: 30px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: 500;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #74b9ff;
        }
        
        .login-btn {
            width: 100%;
            background: linear-gradient(135deg, #74b9ff, #0984e3);
            color: white;
            border: none;
            padding: 15px;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: transform 0.2s ease;
        }
        
        .login-btn:hover {
            transform: translateY(-2px);
        }
        
        .forgot-password {
            text-align: center;
            margin-top: 20px;
        }
        
        .forgot-password a {
            color: #74b9ff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h2>Welcome Back!</h2>
            <p>Please sign in to your account</p>
        </div>
        
        <form class="login-form">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit" class="login-btn">Sign In</button>
            
            <div class="forgot-password">
                <a href="#">Forgot your password?</a>
            </div>
        </form>
    </div>
</body>
</html>''',
    ),
  ];
}
