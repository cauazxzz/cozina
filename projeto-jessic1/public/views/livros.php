<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

if (isset($_GET['excluir']) && is_numeric($_GET['excluir'])) {
    $livroId = (int)$_GET['excluir'];

    $query_remover_associacao = "DELETE FROM livros_receita WHERE livro_id = ?";
    $stmt = $conn->prepare($query_remover_associacao);
    $stmt->bind_param("i", $livroId);
    $stmt->execute();
    $stmt->close();

    $query_excluir_livro = "DELETE FROM livros WHERE id = ?";
    $stmt_excluir = $conn->prepare($query_excluir_livro);
    $stmt_excluir->bind_param("i", $livroId);
    $stmt_excluir->execute();
    $stmt_excluir->close();

    header("Location: livros.php");
    exit;
}

$query_livros = "SELECT id, nome, autor, sinopse FROM livros";
$result_livros = $conn->query($query_livros);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Controle - Administrador</title>
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="icon" type="image/png" href="../images/logo-150.png">
    <link rel="stylesheet" href="../css/livros.css">
   
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
            <h2>Gerenciamento de Livros</h2>
            <div class="search-container">
            <input type="text" placeholder="Pesquisar">
            <button>🔍</button>
            <button class="add-meta-btn" onclick="window.location.href='../criarlivro.php'">Adicionar Novo Livro</button>
        </div>
        </div>
    </header>

    <?php if ($result_livros->num_rows > 0): ?>
    <table>
        <thead>
            <tr>
                <th>Nome do Livro</th>
                <th>Autor</th>
                <th>Ação</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($livro = $result_livros->fetch_assoc()): ?>
                <tr>
                    <td><?= htmlspecialchars($livro['nome']) ?></td>
                    <td><?= htmlspecialchars($livro['autor']) ?></td>
                    <td>
                        <a href="../detalhes_livro.php?id=<?= $livro['id'] ?>"><button>Ver Detalhes</button> </a>
                        <a href="?excluir=<?= $livro['id'] ?>" onclick="return confirm('Você tem certeza que deseja excluir este livro?');">
                            <button>Excluir</button>
                        </a>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
<?php else: ?>
    <p>Nenhum livro cadastrado.</p>
<?php endif; ?>


   
   
</div>
</body>
</html>
