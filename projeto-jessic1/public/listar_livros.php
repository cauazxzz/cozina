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

    header("Location: listar_livros.php");
    exit;
}

$query_livros = "SELECT id, nome, autor, sinopse FROM livros";
$result_livros = $conn->query($query_livros);
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar Livros</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        button {
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Lista de Livros</h1>

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
                        <a href="detalhes_livro.php?id=<?= $livro['id'] ?>">Ver Detalhes</a>
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
    <br>
    <a href="criarlivro.php">Adicionar Novo Livro</a>
</body>
</html>

<?php
$conn->close();
?>
