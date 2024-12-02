<?php
session_start();
require_once '../src/functions/user.php';
$usuarios = listarUsuarios();
$totalUsuarios = count($usuarios); 
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Controle - Administrador</title>
    <link rel="stylesheet" href="../css/users.css">
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
                <form action="../src/functions/logout.php" method="POST">
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
            <h2>Gerenciamento de Usuários</h2>
        </div>
    </header>

    <div class="cards">
        <div class="card purple">
            <h3>Total de Usuários</h3>
            <p><?php echo $totalUsuarios; ?></p>
        </div>
    </div>

    <div class="listar">
        <h2>Lista de Usuários</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($usuarios as $usuario): ?>
                    <tr>
                        <td><?php echo $usuario['id']; ?></td>
                        <td><?php echo $usuario['nome']; ?></td>
                        <td><?php echo $usuario['email']; ?></td>
                        <td>
                            <a href="javascript:void(0)" onclick="openModal(<?php echo $usuario['id']; ?>, '<?php echo $usuario['nome']; ?>', '<?php echo $usuario['email']; ?>')">Editar</a>
                            <a href="administrador.php?delete=<?php echo $usuario['id']; ?>" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
