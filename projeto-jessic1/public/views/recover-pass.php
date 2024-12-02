<!-- public/views/recover-pass.php -->
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperação de Senha</title>
    <link rel="stylesheet" href="/../css/style.css">
</head>
<body>
    <div class="recover-container">
        <h1>Recuperação de Senha</h1>
        <form action="/src/functions/recover-pass.php" method="POST">
            <label for="email">Digite seu e-mail:</label>
            <input type="email" id="email" name="email" required placeholder="Seu e-mail">
            <button type="submit">Enviar Link de Recuperação</button>
        </form>
        <?php
        session_start();
        if (isset($_SESSION['success'])) {
            echo "<p style='color: green;'>{$_SESSION['success']}</p>";
            unset($_SESSION['success']);
        }
        if (isset($_SESSION['error'])) {
            echo "<p style='color: red;'>{$_SESSION['error']}</p>";
            unset($_SESSION['error']);
        }
        ?>
    </div>
</body>
</html>
