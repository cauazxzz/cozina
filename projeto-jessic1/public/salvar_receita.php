<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

$stmt = $conn->prepare("INSERT INTO receita (nome_receita, descricao, FKcozinheiro, data_criacao, FKcategoria, modo_preparo, num_porcao, ind_inedita) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssisssis", $nome, $descricao, $cozinheiro, $data, $categoria, $modo_preparo, $porcoes, $ind_inedita);

$nome = $_POST['nome'];
$descricao = $_POST['descricao'];
$cozinheiro = $_POST['cozinheiro'];
$data = $_POST['data'];
$categoria = $_POST['categoria'];
$modo_preparo = $_POST['modo_preparo'];
$porcoes = $_POST['porcoes'];
$ind_inedita = $_POST['inedita'];

if ($stmt->execute()) {
    $last_id = $conn->insert_id;

    $quantidades = $_POST['quantidade'];
    $medidas = $_POST['medida'];
    $id_ingredientes = $_POST['nome_ingrediente'];

    foreach ($quantidades as $index => $quantidade) {
        $FKIngrediente = $id_ingredientes[$index]; 
        $FKMedida = $medidas[$index]; 

        $ingrediente_stmt = $conn->prepare("INSERT INTO receita_ingrediente (FKreceita, FKIngrediente, FKMedida, quantidade) VALUES (?, ?, ?, ?)");
        $ingrediente_stmt->bind_param("iiis", $last_id, $FKIngrediente, $FKMedida, $quantidade);

        if (!$ingrediente_stmt->execute()) {
            echo "Erro ao inserir ingrediente: " . $ingrediente_stmt->error;
        }

        $ingrediente_stmt->close();
    }

    header("Location: receita_para_usuario.php?id=$last_id");
    exit;

} else {
    echo "Erro: " . $stmt->error;
}

if (isset($_FILES['imagem']) && !empty($_FILES['imagem']['name'][0])) {
    $target_dir = "uploads";
    foreach ($_FILES['imagem']['tmp_name'] as $key => $tmp_name) {
        $target_file = $target_dir . basename($_FILES['imagem']['name'][$key]);
        $file_type = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        
        // Validar tipos de arquivo permitidos
        $allowed_types = ['jpg', 'jpeg', 'png', 'gif'];
        if (in_array($file_type, $allowed_types)) {
            if (move_uploaded_file($tmp_name, $target_file)) {
                // Salvar o nome do arquivo no banco de dados
                $stmt = $conn->prepare("INSERT INTO receita_imagem (FKreceita, imagem) VALUES (?, ?)");
                $stmt->bind_param("is", $idReceita, $_FILES['imagem']['name'][$key]);
                $stmt->execute();
                $stmt->close();
            } else {
                echo "Erro ao fazer upload do arquivo: " . htmlspecialchars($_FILES['imagem']['name'][$key]);
            }
        } else {
            echo "Tipo de arquivo não permitido: " . htmlspecialchars($file_type);
        }
    }
}

$stmt->close();
$conn->close();
?>
