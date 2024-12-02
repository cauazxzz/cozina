<?php
// Configurações do banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha"; // nome do seu banco de dados

// Cria a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

// Prepara e vincula
$stmt = $conn->prepare("INSERT INTO cargos (nome, descricao, data_inicio, data_fim, ativo) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("ssssi", $nome, $descricao, $data_inicio, $data_fim, $ativo);

// Obtém os valores do formulário
$nome = $_POST['nome'];
$descricao = $_POST['descricao'];
$data_inicio = $_POST['data_inicio'];
$data_fim = $_POST['data_fim'];
$ativo = isset($_POST['ativo']) ? 1 : 0; // 1 se o checkbox estiver marcado, 0 caso contrário

// Executa a inserção
if ($stmt->execute()) {
    // Redireciona para a página de listagem após a inserção
    header("Location: listar_cargos.php");
    exit(); // Garante que o script seja interrompido após o redirecionamento
} else {
    echo "Erro: " . $stmt->error;
}

// Fecha a declaração e a conexão
$stmt->close();
$conn->close();
?>


