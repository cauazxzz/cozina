<?php
session_start();
require __DIR__ . '/../functions/db.php'; // Certifique-se de que db.php configura corretamente o PDO

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome'] ?? null;
    $descricao = $_POST['descricao'] ?? null;
    $data_inicio = $_POST['data_inicio'] ?? null;
    $data_fim = $_POST['data_fim'] ?? null;
    $ativo = isset($_POST['ativo']) ? 1 : 0; // Checkbox: 1 (ativo) ou 0 (inativo)

    try {
        // Prepara a query para inserir os dados
        $stmt = $pdo->prepare("
            INSERT INTO cargos (nome, descricao, data_inicio, data_fim, ativo)
            VALUES (:nome, :descricao, :data_inicio, :data_fim, :ativo)
        ");
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':descricao', $descricao);
        $stmt->bindParam(':data_inicio', $data_inicio);
        $stmt->bindParam(':data_fim', $data_fim);
        $stmt->bindParam(':ativo', $ativo);
        
        // Executa a query
        $stmt->execute();

        // Redireciona para a página de administrador
        header("Location: /views/administrador.php");
        exit; // Encerra o script para evitar execução adicional
     } catch (PDOException $e) {
        echo "Erro ao inserir Cargo: " . $e->getMessage();
     }
 }
