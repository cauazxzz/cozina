<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cargo = htmlspecialchars($_POST["cargo"]);
    $nome = htmlspecialchars($_POST["nome"]);
    $meta = htmlspecialchars($_POST["meta"]);
    $estado = htmlspecialchars($_POST["estado"]);

    $sql = "INSERT INTO metas (cargo, nome, meta, estado) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $cargo, $nome, $meta, $estado);

    if ($stmt->execute()) {header("Location: views/metas.php");
        exit();
    } else {
        echo "Erro ao adicionar meta: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
