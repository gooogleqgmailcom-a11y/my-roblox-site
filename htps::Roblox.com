<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Roblox</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap');
        
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Roboto', sans-serif;
            background: #0f0f0f;
            color: #fff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        
        .container {
            width: 100%;
            max-width: 400px;
            background: #1f1f1f;
            border-radius: 8px;
            box-shadow: 0 0 40px rgba(0, 170, 255, 0.4);
            overflow: hidden;
        }
        
        .header {
            background: #00a2ff;
            padding: 20px;
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            letter-spacing: 2px;
        }
        
        .logo {
            font-size: 48px;
            margin-bottom: 8px;
        }
        
        .form-container {
            padding: 40px 30px 30px;
        }
        
        .input-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 6px;
            color: #ddd;
            font-size: 14px;
        }
        
        input {
            width: 100%;
            padding: 14px 16px;
            background: #2a2a2a;
            border: 1px solid #444;
            border-radius: 6px;
            color: #fff;
            font-size: 16px;
        }
        
        input:focus {
            outline: none;
            border-color: #00a2ff;
            box-shadow: 0 0 0 3px rgba(0, 162, 255, 0.3);
        }
        
        .btn {
            width: 100%;
            padding: 14px;
            background: #00a2ff;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 18px;
            font-weight: 500;
            cursor: pointer;
            margin-top: 10px;
        }
        
        .btn:hover {
            background: #0088dd;
        }
        
        .links {
            text-align: center;
            margin-top: 20px;
        }
        
        .links a {
            color: #00a2ff;
            text-decoration: none;
            font-size: 14px;
        }
        
        .footer {
            text-align: center;
            padding: 20px;
            font-size: 12px;
            color: #666;
        }
        
        .error {
            color: #ff4444;
            text-align: center;
            margin: 10px 0;
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">R</div>
            ROBLOX
        </div>
        
        <div class="form-container">
            <div class="input-group">
                <label>اسم المستخدم أو البريد الإلكتروني</label>
                <input type="text" id="username" placeholder="Username or Email" autocomplete="username">
            </div>
            
            <div class="input-group">
                <label>كلمة المرور</label>
                <input type="password" id="password" placeholder="••••••••" autocomplete="current-password">
            </div>
            
            <div class="error" id="error-msg">اسم المستخدم أو كلمة المرور غير صحيحة</div>
            
            <button onclick="login()" class="btn">تسجيل الدخول</button>
            
            <div class="links">
                <a href="#">نسيت كلمة المرور؟</a>
            </div>
        </div>
        
        <div class="footer">
            © 2026 Roblox Corporation. جميع الحقوق محفوظة.
        </div>
    </div>

    <script>
        function login() {
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();
            const errorMsg = document.getElementById('error-msg');
            
            if (username === '' || password === '') {
                errorMsg.style.display = 'block';
                errorMsg.textContent = 'يرجى ملء جميع الحقول';
                return;
            }
            
            errorMsg.style.display = 'none';
            
            // محاكاة تسجيل الدخول
            setTimeout(() => {
                alert(`✅ تم تسجيل الدخول بنجاح!\n\nاسم المستخدم: ${username}\n\n(موقع تجريبي مزيف للتجربة فقط)`);
                console.log('Roblox Fake Login - Username:', username, 'Password:', password);
            }, 800);
        }
        
        // دعم زر Enter
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') login();
        });
    </script>
</body>
</html>
