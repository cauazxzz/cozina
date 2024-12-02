<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = trim($_POST['nome']);
    $autor = trim($_POST['autor']);
    $sinopse = trim($_POST['sinopse']);
    $receitasSelecionadas = $_POST['receitasSelecionadas'] ?? [];

    $query = "INSERT INTO livros (nome, autor, sinopse) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("sss", $nome, $autor, $sinopse);

    if ($stmt->execute()) {
        $livroId = $stmt->insert_id;  

        $query_livros_receita = "INSERT INTO livros_receita (livro_id, receita_id) VALUES (?, ?)";
        $stmt_livros_receita = $conn->prepare($query_livros_receita);

        foreach ($receitasSelecionadas as $receitaId) {
            $stmt_livros_receita->bind_param("ii", $livroId, $receitaId);
            if (!$stmt_livros_receita->execute()) {
                echo "Erro ao salvar a receita: " . $stmt_livros_receita->error;
            }
        }

        header("Location: views/livros.php"); 
        exit;
    } else {
        echo "Erro ao salvar o livro: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
