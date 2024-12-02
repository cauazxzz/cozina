<?php
// Inclua a conexão com o banco de dados
include('db.php');

// Verificar se os dados foram enviados
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userId = $_POST['userId'];
    $nome = $_POST['nome'];
    $email = $_POST['email'];

    // Validar os dados (você pode adicionar mais validações aqui)
    if (empty($nome) || empty($email)) {
        echo json_encode(['success' => false, 'message' => 'Nome e email são obrigatórios.']);
        exit;
    }

    // Atualizar o usuário no banco de dados
    $query = "UPDATE usuarios SET nome = :nome, email = :email WHERE id = :id";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':nome', $nome);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':id', $userId);

    if ($stmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Erro ao atualizar o usuário.']);
    }
}
?>
