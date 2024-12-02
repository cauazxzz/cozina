<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];


    $stmt = $conn->prepare("DELETE FROM receita WHERE idReceita = ?");
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        header("Location: views/receitas.php");
        exit;
    } else {
        echo "Erro ao excluir receita: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
