<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $livroId = (int)$_GET['id'];

    $query_livro = "SELECT id, nome, autor, sinopse FROM livros WHERE id = ?";
    $stmt = $conn->prepare($query_livro);
    $stmt->bind_param("i", $livroId);
    $stmt->execute();
    $result_livro = $stmt->get_result();

    if ($result_livro->num_rows > 0) {
        $livro = $result_livro->fetch_assoc();
    } else {
        die("Livro não encontrado.");
    }

    $query_receitas = "SELECT receita.idReceita, receita.nome_receita 
                       FROM receita 
                       INNER JOIN livros_receita ON receita.idReceita = livros_receita.receita_id 
                       WHERE livros_receita.livro_id = ?";
    $stmt_receitas = $conn->prepare($query_receitas);
    $stmt_receitas->bind_param("i", $livroId);
    $stmt_receitas->execute();
    $result_receitas = $stmt_receitas->get_result();
} else {
    die("ID de livro não fornecido.");
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Descrição do Livro</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }

        nav {
            background-color: #1c2a52;
            padding: 10px 20px;
            text-align: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 1.1em;
        }

        nav a:hover {
            color: #fbc33a;
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .livro-info {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: left;
        }

        .livro-info p {
            font-size: 1.2em;
            line-height: 1.6;
            margin: 10px 0;
        }

        .livro-info strong {
            color: #1c2a52;
        }

        h3 {
            font-size: 2em;
            margin-top: 30px;
            color: #333;
            text-align: center;
        }

        .receitas-list {
            list-style: none;
            padding: 0;
            text-align: left;
        }

        .receitas-list li {
            background-color: #f9f9f9;
            margin: 10px 0;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .receitas-list li:hover {
            background-color: #f0f0f0;
        }

        .receitas-list a {
            color: #3498db;
            font-size: 1.2em;
            text-decoration: none;
        }

        .receitas-list a:hover {
            color: #2980b9;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        .back-link:hover {
            background-color: #2980b9;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            h1 {
                font-size: 2em;
            }

            .livro-info {
                padding: 15px;
            }

            h3 {
                font-size: 1.5em;
            }

            .receitas-list li {
                padding: 12px;
            }

            .receitas-list a {
                font-size: 1em;
            }

            .back-link {
                font-size: 1em;
                padding: 8px 16px;
            }
        }
    </style>
</head>
<body>

    <!-- Barra de navegação -->
    <nav>
        <a href="livros_usuario.php">Livros</a>
    </nav>

    <!-- Conteúdo do Livro -->
    <div class="container">
        <h1><?= htmlspecialchars($livro['nome']) ?></h1>

        <div class="livro-info">
            <p><strong>Autor:</strong> <?= htmlspecialchars($livro['autor']) ?></p>
            <p><strong>Sinopse:</strong> <?= htmlspecialchars($livro['sinopse']) ?></p>
        </div>

        <h3>Receitas Relacionadas</h3>
        <ul class="receitas-list">
            <?php if ($result_receitas->num_rows > 0): ?>
                <?php while ($receita = $result_receitas->fetch_assoc()): ?>
                    <li><a href="descricao_receita.php?idReceita=<?= $receita['idReceita'] ?>"><?= htmlspecialchars($receita['nome_receita']) ?></a></li>
                <?php endwhile; ?>
            <?php else: ?>
                <li>Nenhuma receita inclusa para este livro.</li>
            <?php endif; ?>
        </ul>

        <a href="livros_usuario.php" class="back-link">Voltar para a Lista de Livros</a>
    </div>
</body>
</html>

<?php
$conn->close();
?>
