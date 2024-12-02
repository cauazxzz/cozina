<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Boas-Vindas Usuário - Arte Della Cucina</title>

    <link rel="stylesheet" href="css/bemvindos.css">

    <!--adicione o link favicon aqui-->
    <link rel="icon" type="png" href="images/logo-150.png">
    <!--fim favicon-->

</head>

<body>
    <div class="welcome-container">
        <div class="logo-container">
            <img src="images/logo-150.png" alt="Arte Della Cucina logo" class="logo">
        </div>
        <div class="message-container">
            <h1>Seja muito bem-vindo, Usuário!</h1>
            <p>Estamos entusiasmados em compartilhar esta experiência gastronômica única com você! Como deseja explorar nossas deliciosas opções hoje?</p>
            <a href="livros_usuario.php">
    <button>Livros</button>
</a>
<a href="receita_para_usuario.php">
    <button>Receitas</button>
</a>

            <br><br>
            <!-- Botão de Logout -->
            <form action="src/functions/logout.php" method="POST">
                <button class="btn btn-logout" type="submit">Sair</button>
            </form>
            
        </div>
    </div>

</body>

</html>