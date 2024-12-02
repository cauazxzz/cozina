<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Controle - Administrador</title>
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="icon" type="image/png" href="../images/logo-150.png">
</head>
<body>
<div class="sidebar">
    <img src="../images/logo-150.png" alt="Logo Arte della Cucina">
    <h2>Arte della Cucina</h2>
    <nav>
        <ul>
            <li><a href="administrador.php">Início</a></li>
            <li><a href="cargos.php">Cargos</a></li>
            <li><a href="livros.php">Livros</a></li>
            <li><a href="metas.php">Metas</a></li>
            <li><a href="cozinheiro.php">Cozinheiro</a></li>
            <li><a href="receitas.php">Receitas</a></li>
            <li><a href="users.php">Usuários</a></li>
            <li><a href="register.php">Registrar</a></li>
            <li>
                <form action="/../src/functions/logout.php" method="POST">
                    <button class="btn btn-logout" type="submit">Sair</button>
                </form>
            </li>
        </ul>
    </nav>
</div>

<div class="content">
    <header>
        <h1>Painel de Controle</h1>
        <div class="welcome-message">
            <h2>Seja muito bem-vindo, Administrador!</h2>
            <p>Estamos empolgados por tê-lo conosco e ansiosos para ver suas contribuições!</p>
        </div>
    </header>

    <div class="cards">
        <div class="card blue">
            <h3>Total de Receitas</h3>
            <p>5</p>
        </div>
        <div class="card yellow">
            <h3>Receitas Pendentes</h3>
            <p>10</p>
        </div>
    </div>

    
</div>
</body>
</html>
