<?php 
// Configurações do banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

// Cria a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

// Consulta os cargos
$sql = "SELECT id, nome, descricao, data_inicio, data_fim, ativo FROM cargos";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar Cargos</title>
    <link rel="stylesheet" href="css/listar.css">
    <!--adicione o link favicon aqui-->
    <link rel="icon" type="png" href="images/logo-150.png">
     <!--fim favicon-->
</head>
<body>
<header>
        <div class="logo">
            <img src="images/logo-150.png" alt="logo-150.png">
            <span>Arte Della Cucina</span>
        </div>
        <nav>
            <a href="livros_usuario.php">Livros</a>
            <a href="receita_para_usuario.php">Receitas</a>
            <a href="listar_cargos.php">Cargos</a>
            <a href="listar_func.php">Funcionários</a>
            <a href="controle_metas.php">Metas</a>
            <a href="views/administrador.php">Adm</a>
        </nav>
    </header>

    <main>
        <h1>Listar Cargos</h1>

        <!-- Barra de pesquisa e botão de inclusão -->
        <div class="search-container">
            <input type="text" placeholder="Pesquisar">
            <button onclick="window.location.href='incluir_cargo.php'">Incluir Cargos</button>
        </div>

        <!-- Tabela com os cargos -->
        <?php if ($result->num_rows > 0): ?>
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
                                <!-- Botões de ação (editar e excluir) -->
                                <a href="editar_cargos.php?id=<?php echo htmlspecialchars($user_data['id']); ?>">
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
        <?php else: ?>
            <p>Nenhum cargo encontrado.</p>
        <?php endif; ?>
    </main>
</body>
</html>

<?php $conn->close(); // Fecha a conexão ?>
