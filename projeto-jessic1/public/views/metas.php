<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Controle - Administrador</title>
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="icon" type="image/png" href="../images/logo-150.png">
    <link rel="stylesheet" href="../css/metastyle.css">
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
            <h2>Gerenciamento de Metas</h2>
        </div>
    </header>
    <div class="container">
        <h1>Controle de Metas</h1>

        <div class="search-container">
            <input type="text" placeholder="Pesquisar">
            <button>🔍</button>
            <button class="add-meta-btn" onclick="window.location.href='../adicionarmetas.php'">Adicionar Metas +</button>
        </div>

        <table>
            <thead>
                <tr>
                    <th>META</th>
                    <th>NOME DO FUNCIONÁRIO</th>
                    <th>CARGO</th>
                    <th>ESTADO</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $conn = new mysqli("localhost", "root", "", "artedacozinha");

                if ($conn->connect_error) {
                    die("Falha na conexão: " . $conn->connect_error);
                }

                $sql = "SELECT meta, nome, cargo, estado FROM metas";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . htmlspecialchars($row["meta"]) . "</td>";
                        echo "<td>" . htmlspecialchars($row["nome"]) . "</td>";
                        echo "<td>" . htmlspecialchars($row["cargo"]) . "</td>";
                        echo "<td>" . htmlspecialchars($row["estado"]) . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='4'>Nenhuma meta encontrada</td></tr>";
                }

                $conn->close();
                ?>
            </tbody>
        </table>
    </div>
</div>


</body>
</html>
