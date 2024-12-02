<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login-Arte della Cucina</title>
    <link rel="icon" type="png" href="images/logo-150.png">
    <link rel="stylesheet" href="css/registrar.css">
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
            <img src="images/logo-150.png" alt="Arte Della Cucina logo" class="logo">
        </div>
        <div class="register-box">
            <h1>Registrar</h1>
            <form action="src/functions/exec-register.php" method="POST">
                <input type="text" name="nome" placeholder="Insira seu nome" required>
                <input type="text" name="rg" placeholder="Insira seu RG" required>
                <input type="email" name="email" placeholder="Insira seu e-mail" required>
                <input type="password" name="senha" placeholder="Insira sua senha" required>
                <select name="cargo" required>
                    <option value="" disabled selected>Selecione seu cargo</option>
                    <option value="cozinheiro">Cozinheiro</option>
                    <option value="degustador">Degustador</option>
                    <option value="editor">Editor</option>
                </select>
                <button type="submit" name="register">Registrar</button>
            </form>
        </div>
    </div>
</body>
</html>
