<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Controle de Metas</title>
    <link rel="stylesheet" href="css/listar.css">
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

    <div class="container">
        <h1>Controle de Metas</h1>

        <div class="search-container">
            <input type="text" placeholder="Pesquisar">
            <button>🔍</button>
            <button class="add-meta-btn" onclick="window.location.href='adicionarmetas.php'">Adicionar Metas +</button>
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
</body>
</html>
