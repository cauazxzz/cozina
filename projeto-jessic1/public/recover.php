<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Senha - Arte Della Cucina</title>
    <link rel="stylesheet" href="../css/login.css">
    <link rel="icon" type="png" href="../images/logo-150.png">
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
            <img src="../images/logo-150.png" alt="Arte Della Cucina logo" class="logo">
        </div>
        <div class="register-box">
            <h1>Recuperar Senha</h1>
            <form action="src/functions/recover-pass1.php" method="POST">
                <input type="email" name="email" placeholder="Insira seu e-mail" required>
                <button type="submit" name="recover">Enviar Link de Recuperação</button>
            </form>
            <a href="login.php">Voltar ao Login</a></br>
            <?php
                if (isset($_SESSION['error'])) {
                    echo "<p style='color: red;'>{$_SESSION['error']}</p>";
                    unset($_SESSION['error']);
                }
                if (isset($_SESSION['success'])) {
                    echo "<p style='color: green;'>{$_SESSION['success']}</p>";
                    unset($_SESSION['success']);
                }
            ?>
        </div>
    </div>
</body>
</html>
