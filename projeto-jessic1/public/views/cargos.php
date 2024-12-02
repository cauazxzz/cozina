<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

$query = "SELECT * FROM cargos"; 
$result = $conn->query($query);

if (!$result) {
    die("Erro na consulta: " . $conn->error);
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Controle - Administrador</title>
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="icon" type="image/png" href="../images/logo-150.png">
    <link rel="stylesheet" href="../css/cargos.css">
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
            <h2>Gerenciamento de Cargos</h2>
        </div>
        <div class="search-container">
            <input type="text" placeholder="Pesquisar">
            <button>🔍</button>
            <button class="btn" onclick="window.location.href='../incluir_cargo.php'">Incluir Cargo</button>
            <button class="btn" onclick="window.location.href='../listar_cargos.php'">Listar Cargo</button>
        </div>
    </header>

    <table>
        <thead>
            <tr>
                <th>Cargo</th>
                <th>Descrição</th>
                <th>Data Início</th>
                <th>Data Fim</th>
                <th>Ativo</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($user_data = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($user_data['nome']); ?></td>
                    <td><?php echo htmlspecialchars($user_data['descricao']); ?></td>
                    <td><?php echo date('d M Y', strtotime($user_data['data_inicio'])); ?></td>
                    <td><?php echo date('d M Y', strtotime($user_data['data_fim'])); ?></td>
                    <td>
                        <span class="active">
                            <?php echo $user_data['ativo'] ? '&#10004;' : '&#10008;'; ?>
                        </span>
                    </td>
                    <td>
                        <a href="../editar_cargos.php?id=<?php echo htmlspecialchars($user_data['id']); ?>">
                            <button class="edit">&#9998;</button>
                        </a>
                        <a href="excluir_cargos.php?id=<?php echo htmlspecialchars($user_data['id']); ?>">
                            <button class="delete">&#128465;</button>
                        </a>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</div>

</body>
</html>

<?php
$conn->close();
?>
