<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Boas-Vindas Editor - Arte Della Cucina</title>

    <link rel="stylesheet" href="../css/bemvindos.css">

    <!--adicione o link favicon aqui-->
    <link rel="icon" type="png" href="/../images/logo-150.png">
    <!--fim favicon-->

</head>

<body>

    <div class="welcome-container">
        <div class="logo-container">
            <img src="../images/logo-150.png" alt="Arte Della Cucina logo" class="logo">
        </div>
        <div class="message-container">
            <h1>Seja muito bem-vindo, editor!</h1>
            <p>Estamos empolgados por tê-lo conosco e ansiosos para ver suas contribuições!</p>
            <button class="btn">Livros</button>

            <br><br>
            <!-- Botão de Logout -->
            <form action="/../src/functions/logout.php" method="POST">
                <button class="btn btn-logout" type="submit">Sair</button>
            </form>
            
        </div>
    </div>

</body>

</html>