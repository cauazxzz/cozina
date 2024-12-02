<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

$query = "SELECT idReceita, nome_receita, descricao FROM receita";
$result = $conn->query($query);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Controle - Administrador</title>
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="icon" type="image/png" href="../images/logo-150.png">
    <link rel="stylesheet" href="../css/receitas.css">
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
            <h2>Gerenciamento de Receitas</h2>
        </div>
    </header>
    <div class="container">
        <h1>Lista de Receitas</h1>
        <div class="search-container">
            <input type="text" placeholder="Pesquisar">
            <button>🔍</button>
            <button class="add-meta-btn" onclick="window.location.href='../criarreceita.php'">Criar Receita +</button>
        </div>

        <?php if (isset($_GET['msg'])): ?>
            <div class="alert">
                <?php echo htmlspecialchars($_GET['msg']); ?>
            </div>
        <?php endif; ?>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome da Receita</th>
                    <th>Descrição</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()) { ?>
                    <tr>
                        <td><?php echo $row['idReceita']; ?></td>
                        <td><?php echo htmlspecialchars($row['nome_receita']); ?></td>
                        <td><?php echo htmlspecialchars($row['descricao']); ?></td>
                        <td>
                          <button>  <a href="../editar_receita.php?id=<?php echo $row['idReceita']; ?>">Editar</a> </button>
                           <button> <a href="../excluir_receita.php?id=<?php echo $row['idReceita']; ?>" onclick ="return confirm('Tem certeza que deseja excluir esta receita?');">Excluir</a> </button>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</div>



</body>
</html>

<?php
$conn->close();
?>
