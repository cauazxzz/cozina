<?php
require_once 'db.php';

// Listar todos os usuários
function listarUsuarios() {
    global $pdo;
    $stmt = $pdo->query("SELECT * FROM users");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Adicionar um novo usuário
function adicionarUsuario($nome, $email, $senha) {
    global $pdo;
    $senhaHash = password_hash($senha, PASSWORD_DEFAULT);
    $stmt = $pdo->prepare("INSERT INTO users (nome, email, senha) VALUES (?, ?, ?)");
    $stmt->execute([$nome, $email, $senhaHash]);
}

// Editar um usuário
function editarUsuario($id, $nome, $email, $senha) {
    global $pdo;
    $senhaHash = password_hash($senha, PASSWORD_DEFAULT);
    $stmt = $pdo->prepare("UPDATE users SET nome = ?, email = ?, senha = ? WHERE id = ?");
    $stmt->execute([$nome, $email, $senhaHash, $id]);
}

// Excluir um usuário
function excluirUsuario($id) {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM users WHERE id = ?");
    $stmt->execute([$id]);
}

// Buscar um usuário pelo ID
function buscarUsuarioPorId($id) {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM users WHERE id = ?");
    $stmt->execute([$id]);
    return $stmt->fetch(PDO::FETCH_ASSOC);
}
?>

