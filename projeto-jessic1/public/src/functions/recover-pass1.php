<?php
// src/functions/recover-pass.php
require 'db.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];

    try {
        // Verificar se o e-mail existe no banco de dados
        $stmt = $pdo->prepare("SELECT * FROM users WHERE email = :email");
        $stmt->bindParam(':email', $email);
        $stmt->execute();

        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Gerar token único para o link de recuperação
            $token = bin2hex(random_bytes(50));
            $expires = date("U") + 1800; // O link expira em 30 minutos

            // Inserir o token e a data de expiração no banco de dados
            $stmt = $pdo->prepare("UPDATE users SET reset_token = :token, reset_expires = :expires WHERE email = :email");
            $stmt->bindParam(':token', $token);
            $stmt->bindParam(':expires', $expires);
            $stmt->bindParam(':email', $email);
            $stmt->execute();

            // Criar o link de recuperação
            $reset_link = "http://yourdomain.com/reset-password.php?token=$token";

            // Enviar o link por e-mail via MailHog (SMTP)
            $to = $email;
            $subject = "Recuperação de Senha - Arte Della Cucina";
            $message = "Olá, clique no link abaixo para redefinir sua senha:\n\n$reset_link";
            $headers = "From: no-reply@yourdomain.com";

            if (mail($to, $subject, $message, $headers)) {
                $_SESSION['success'] = "Um link de recuperação foi enviado para o seu e-mail.";
            } else {
                $_SESSION['error'] = "Erro ao enviar o e-mail. Tente novamente mais tarde.";
            }
        } else {
            $_SESSION['error'] = "E-mail não encontrado!";
        }
    } catch (PDOException $e) {
        $_SESSION['error'] = "Erro ao processar sua solicitação: " . $e->getMessage();
    }

    header("Location: /../recover-pass.php");
    exit;
}
?>
