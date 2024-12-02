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

// Verifica se o ID foi passado na URL
if (isset($_GET['id'])) {
    $id = intval($_GET['id']); // Converte para inteiro para evitar injeções

    // Prepara a consulta para verificar se o cargo existe
    $sql = "SELECT * FROM cargos WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Prepara a consulta para excluir o cargo
        $sql = "DELETE FROM cargos WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            echo "<p>Cargo excluído com sucesso!</p>";
        } else {
            echo "Erro ao excluir cargo: " . $stmt->error;
        }
    } else {
        echo "<p>Cargo não encontrado.</p>";
    }

    // Fecha a declaração
    $stmt->close();
} else {
    echo "<p>ID não fornecido.</p>";
}

// Fecha a conexão com o banco de dados
$conn->close();
?>

<!-- Link para voltar à listagem de cargos -->
<a href="listar_cargos.php">Voltar para a listagem de cargos</a>


