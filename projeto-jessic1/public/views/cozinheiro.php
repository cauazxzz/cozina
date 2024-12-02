<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boas-Vindas Cozinheiro - Arte Della Cucina</title>
    <link rel="stylesheet" href="../css/bemvindos.css">
    <link rel="icon" type="png" href="../images/logo-150.png">
</head>
<body>
    <div class="welcome-container">
        <div class="logo-container">
            <img src="../images/logo-150.png" alt="Arte Della Cucina logo" class="logo">
        </div>
        <div class="message-container">
            <h1>Seja muito bem-vindo, Cozinheiro!</h1>
            <p>Estamos animados para compartilhar essa jornada gastronômica com você.</p>
            <button class="btn" onclick="window.location.href='../criarreceita.php'">Postar Receita</button>
            <button class="btn" onclick="window.location.href='../listar_receitas.php'">Editar Receita</button>

            <br><br>
            <!-- Botão de Logout -->
            <form action="../src/functions/logout.php" method="POST">
                <button class="btn btn-logout" type="submit">Sair</button>
            </form>
            
        </div>
    </div>
</body>
</html>
