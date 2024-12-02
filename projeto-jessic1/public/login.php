<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login-Arte della Cucina</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="icon" type="image/png" href="images/logo-150.png">
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
            <img src="images/logo-150.png" alt="Arte Della Cucina logo" class="logo">
        </div>
        <div class="login-box">
            <h1>Login</h1>
            <form action="src/functions/exec-login.php" method="POST">
                <input type="text" name="rg" placeholder="Insira seu RG" required>
                <input type="password" name="senha" placeholder="Insira sua senha" required>
                <button type="submit" name="login">ENTRAR</button>
            </form>
            <a href="recover.php">Esqueci minha senha</a>
            <?php
                // Exibe erros de login
                if (isset($_SESSION['error'])) {
                    echo "<p style='color: red;'>{$_SESSION['error']}</p>";
                    unset($_SESSION['error']);
                }
                // Exibe mensagem de sucesso
                if (isset($_SESSION['success'])) {
                    echo "<p style='color: green;'>{$_SESSION['success']}</p>";
                    unset($_SESSION['success']);
                }
            ?>
        </div>
    </div>
</body>
</html>
