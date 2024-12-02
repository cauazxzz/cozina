<?php
// reset-password.php
require 'src/functions/db.php';
session_start();

if (isset($_GET['token'])) {
    $token = $_GET['token'];

    // Verificar se o token é válido
    $stmt = $pdo->prepare("SELECT * FROM users WHERE reset_token = :token AND reset_expires > :current_time");
    $stmt->bindParam(':token', $token);
    $stmt->bindParam(':current_time', time());
    $stmt->execute();

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        $_SESSION['error'] = "Link de recuperação inválido ou expirado.";
        header("Location: login.php");
        exit;
    }
} else {
    header("Location: login.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $new_password = $_POST['new_password'];
    $confirm_password = $_POST['confirm_password'];

    if ($new_password === $confirm_password) {
        // Atualizar a senha no banco de dados
        $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);
        $stmt = $pdo->prepare("UPDATE users SET password = :password, reset_token = NULL, reset_expires = NULL WHERE id = :user_id");
        $stmt->bindParam(':password', $hashed_password);
        $stmt->bindParam(':user_id', $user['id']);
        $stmt->execute();

        $_SESSION['success'] = "Senha alterada com sucesso!";
        header("Location: login.php");
        exit;
    } else {
        $_SESSION['error'] = "As senhas não coincidem.";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redefinir Senha</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
            <img src="/../images/logo-150.png" alt="Arte Della Cucina logo" class="logo">
        </div>
        <div class="register-box">
            <h1>Redefinir Senha</h1>
            <form action="reset-password.php?token=<?php echo $_GET['token']; ?>" method="POST">
                <input type="password" name="new_password" placeholder="Nova Senha" required>
                <input type="password" name="confirm_password" placeholder="Confirmar Nova Senha" required>
                <button type="submit">Alterar Senha</button>
            </form>
            <a href="login.php">Voltar ao Login</a>
        </div>
    </div>
</body>
</html>
