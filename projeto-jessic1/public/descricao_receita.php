<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

if (isset($_GET['idReceita'])) {
    $idReceita = (int)$_GET['idReceita'];

    $query_receita = "SELECT nome_receita, modo_preparo, descricao, num_porcao, data_criacao 
                      FROM receita WHERE idReceita = ?";
    $stmt_receita = $conn->prepare($query_receita);
    $stmt_receita->bind_param("i", $idReceita);
    $stmt_receita->execute();
    $result_receita = $stmt_receita->get_result();

    if ($result_receita->num_rows > 0) {
        $receita = $result_receita->fetch_assoc();
    } else {
        echo "Receita não encontrada.";
        exit;
    }

    $query_ingredientes = "
    SELECT i.nome, ri.quantidade, m.descricao AS medida
    FROM ingredientes i
    INNER JOIN receita_ingrediente ri ON ri.FKIngrediente = i.idIngrediente
    INNER JOIN medida m ON ri.FKMedida = m.idMedida
    WHERE ri.FKreceita = ?";
    $stmt_ingredientes = $conn->prepare($query_ingredientes);
    $stmt_ingredientes->bind_param("i", $idReceita);
    $stmt_ingredientes->execute();
    $result_ingredientes = $stmt_ingredientes->get_result();
} else {
    echo "ID da receita não fornecido.";
    exit;
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Descrição da Receita</title>
    <style>/* Reset de estilo para todos os elementos */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Estilo geral do corpo */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f9;
    color: #333;
    padding: 20px;
    max-width: 1200px;
    margin: 0 auto;
}

/* Container principal */
.container {
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-top: 30px;
    text-align: center;
}

/* Título principal */
h1 {
    font-size: 2.5em;
    margin-bottom: 20px;
    color: #333;
}

/* Título das seções */
h2 {
    font-size: 2em;
    margin-top: 20px;
    color: #3498db;
}

/* Parágrafos de informações */
p {
    font-size: 1.2em;
    line-height: 1.6;
    margin-bottom: 15px;
}

/* Listagem de ingredientes */
ul {
    list-style-type: none;
    padding: 0;
}

ul li {
    font-size: 1.2em;
    line-height: 1.6;
    margin-bottom: 10px;
}

/* Link para voltar */
a {
    display: inline-block;
    font-size: 1.2em;
    color: #3498db;
    text-decoration: none;
    margin-top: 20px;
    padding: 10px 20px;
    border: 2px solid #3498db;
    border-radius: 5px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

/* Efeito de hover para o link de voltar */
a:hover {
    background-color: #3498db;
    color: #fff;
}

/* Ajustes para dispositivos menores */
@media (max-width: 768px) {
    .container {
        padding: 15px;
    }

    h1 {
        font-size: 2em;
    }

    h2 {
        font-size: 1.8em;
    }

    p {
        font-size: 1.1em;
    }

    ul li {
        font-size: 1.1em;
    }

    a {
        font-size: 1em;
        padding: 8px 15px;
    }
}
</style>
</head>
<body>
    <h1>Detalhes da Receita: <?= htmlspecialchars($receita['nome_receita']) ?></h1>

    <p><strong>Modo de Preparo:</strong> <?= nl2br(htmlspecialchars($receita['modo_preparo'])) ?></p>
    <p><strong>Descrição:</strong> <?= nl2br(htmlspecialchars($receita['descricao'])) ?></p>
    <p><strong>Número de Porções:</strong> <?= htmlspecialchars($receita['num_porcao']) ?></p>
    <p><strong>Data de Criação:</strong> <?= htmlspecialchars($receita['data_criacao']) ?></p>

    <h2>Ingredientes:</h2>
    <ul>
        <?php if ($result_ingredientes->num_rows > 0): ?>
            <?php while ($ingrediente = $result_ingredientes->fetch_assoc()): ?>
                <li><?= htmlspecialchars($ingrediente['nome']) ?> - <?= htmlspecialchars($ingrediente['quantidade']) ?> <?= htmlspecialchars($ingrediente['medida']) ?></li>
            <?php endwhile; ?>
        <?php else: ?>
            <li>Nenhum ingrediente encontrado para esta receita.</li>
        <?php endif; ?>
    </ul>

    <br>
    <a href="views/livros.php">Voltar para a lista de livros</a>
</body>
</html>

<?php
$conn->close();
?>
