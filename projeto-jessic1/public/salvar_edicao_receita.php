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
    $id = (int)$_POST['id'];
    $nome = trim($_POST['nome']);
    $descricao = trim($_POST['descricao']);
    $modo_preparo = trim($_POST['modo_preparo']);
    $cozinheiro = (int)$_POST['cozinheiro']; 
    $data = $_POST['data'];
    $categoria = (int)$_POST['categoria']; 

    $query = "UPDATE receita SET nome_receita = ?, descricao = ?, modo_preparo = ?, FKcozinheiro = ?, data_criacao = ?, FKcategoria = ? WHERE idReceita = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("sssissi", $nome, $descricao, $modo_preparo, $cozinheiro, $data, $categoria, $id);

    if ($stmt->execute()) {
        $quantidades = $_POST['quantidade'];
        $medidas = $_POST['medida'];
        $ingredientes = $_POST['ingrediente'];
        $idIngredientesExistentes = $_POST['idIngredienteExistente'] ?? [];
        $excluirIngredientes = $_POST['excluirIngrediente'] ?? [];

        if (!empty($excluirIngredientes)) {
            foreach ($excluirIngredientes as $idIngredienteParaExcluir) {
                $query_excluir = "DELETE FROM receita_ingrediente WHERE id = ?";
                $stmt_excluir = $conn->prepare($query_excluir);
                $stmt_excluir->bind_param("i", $idIngredienteParaExcluir);
                if (!$stmt_excluir->execute()) {
                    echo "Erro ao excluir o ingrediente: " . $stmt_excluir->error;
                }
                $stmt_excluir->close();
            }
        }

        if (!empty($idIngredientesExistentes)) {
            foreach ($idIngredientesExistentes as $index => $idIngredienteExistente) {
                if (!empty($idIngredienteExistente) && !in_array($idIngredienteExistente, $excluirIngredientes)) {
                    $quantidade = (float)$quantidades[$index];
                    $medida = (int)$medidas[$index];
                    $ingrediente = (int)$ingredientes[$index];

                    $query_ingrediente = "UPDATE receita_ingrediente SET quantidade = ?, FKMedida = ?, FKIngrediente = ? WHERE id = ?";
                    $stmt_ingrediente = $conn->prepare($query_ingrediente);
                    $stmt_ingrediente->bind_param("diii", $quantidade, $medida, $ingrediente, $idIngredienteExistente);
                    if (!$stmt_ingrediente->execute()) {
                        echo "Erro ao atualizar o ingrediente: " . $stmt_ingrediente->error;
                    }
                    $stmt_ingrediente->close();
                }
            }
        }

        foreach ($quantidades as $index => $quantidade) {
            if (empty($idIngredientesExistentes[$index])) { 
                if (!empty($ingredientes[$index])) {
                    $quantidade = (float)$quantidade;
                    $medida = (int)$medidas[$index];
                    $ingrediente = (int)$ingredientes[$index];

                    $query_novo_ingrediente = "INSERT INTO receita_ingrediente (FKreceita, quantidade, FKMedida, FKIngrediente) VALUES (?, ?, ?, ?)";
                    $stmt_novo_ingrediente = $conn->prepare($query_novo_ingrediente);
                    $stmt_novo_ingrediente->bind_param("idii", $id, $quantidade, $medida, $ingrediente);
                    if (!$stmt_novo_ingrediente->execute()) {
                        echo "Erro ao inserir o novo ingrediente: " . $stmt_novo_ingrediente->error;
                    }
                    $stmt_novo_ingrediente->close();
                }
            }
        }

        header("Location: listar_receitas.php");
        exit;
    } else {
        echo "Erro ao atualizar a receita: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
