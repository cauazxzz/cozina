<?php
// Configurações do banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";// nome do seu banco de dados

// Cria a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

// Verifica se o ID do cargo foi passado
if (isset($_GET['id'])) {
    $id = intval($_GET['id']);

    // Busca os dados do cargo
    $sql = "SELECT id, nome, descricao, data_inicio, data_fim, ativo FROM cargos WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        die("Cargo não encontrado.");
    }

    $cargo = $result->fetch_assoc();
} else {
    die("ID do cargo não especificado.");
}

// Atualiza os dados do cargo ao enviar o formulário
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = trim($_POST['nome']);
    $descricao = trim($_POST['descricao']);
    $data_inicio = $_POST['data_inicio'];
    $data_fim = $_POST['data_fim'];
    $ativo = isset($_POST['ativo']) ? 1 : 0; // Ativo é um inteiro

    // Validação simples
    if (empty($nome) || empty($descricao) || empty($data_inicio) || empty($data_fim)) {
        die("Por favor, preencha todos os campos.");
    }

    // Atualiza os dados no banco de dados
    $sql = "UPDATE cargos SET nome=?, descricao=?, data_inicio=?, data_fim=?, ativo=? WHERE id=?";
    $stmt = $conn->prepare($sql);

    // Aqui, o 'i' é para o id e o 'i' para o ativo
    $stmt->bind_param("sssssi", $nome, $descricao, $data_inicio, $data_fim, $ativo, $id);

    if ($stmt->execute()) {
        $_SESSION['message'] = "Cargo atualizado com sucesso!";
        header("Location: listar_cargos.php");
        exit;
    } else {
        echo "Erro ao atualizar: " . $stmt->error;
    }
}


$conn->close();
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Editar Cargo</title>

    <link rel="stylesheet" href="css/editar_cargo.css">

    <!--adicione o link favicon aqui-->
    <link rel="icon" type="png" href="images/logo-150.png">
     <!--fim favicon-->
</head>
<body>
    <div class="navbar">
        <a href="incluir_cargo.php">Incluir Cargos</a>
        <a href="listar_cargos.php">Cargos</a>
        <a href="incluir_func.php">Funcionários</a>
        <a href="incluir_restaurante.html">Restaurante</a>
        <a href="metas.html">Metas</a>
    </div>

    <h1>Editar Cargo</h1>
    <form method="POST" action="">
        <input type="hidden" id="id" name="id" value="<?php echo htmlspecialchars($cargo['id']); ?>">
        
        <div class="form-group">
            <label for="nome">Nome do cargo:</label>
            <input type="text" id="nome" name="nome" value="<?php echo htmlspecialchars($cargo['nome']); ?>" required>
        </div>
        
        <div class="form-group">
            <label for="descricao">Descrição:</label>
            <input type="text" id="descricao" name="descricao" value="<?php echo htmlspecialchars($cargo['descricao']); ?>" required>
        </div>
        
        <div class="form-group">
            <label for="data_inicio">Data Início:</label>
            <input type="date" id="data_inicio" name="data_inicio" value="<?php echo htmlspecialchars($cargo['data_inicio']); ?>" required>
        </div>
        
        <div class="form-group">
            <label for="data_fim">Data Fim:</label>
            <input type="date" id="data_fim" name="data_fim" value="<?php echo htmlspecialchars($cargo['data_fim']); ?>" required>
        </div>
        
        <div class="form-group">
            <label>
                <input type="checkbox" name="ativo" <?php echo $cargo['ativo'] ? 'checked' : ''; ?>>
                Cargo Ativo
            </label>
        </div>
        
        <button type="submit">Salvar</button>
        <button type="button" onclick="window.history.back()">Voltar</button>
    </form>

    <div class="image-container">
        <img src="images/logo-150.png" alt="imagem">
    </div>
</body>
</html>
