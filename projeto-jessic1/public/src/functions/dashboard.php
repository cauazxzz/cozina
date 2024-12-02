<?php
require_once '../src/functions/db.php';

// Consultar o número de usuários
$stmt = $pdo->query("SELECT COUNT(*) FROM users");
$user_count = $stmt->fetchColumn();

// Consultar o número de receitas
$stmt = $pdo->query("SELECT COUNT(*) FROM receitas");
$recipe_count = $stmt->fetchColumn();

// Consultar o número de receitas pendentes
$stmt = $pdo->query("SELECT COUNT(*) FROM receitas WHERE status = 'pendente'");
$pending_count = $stmt->fetchColumn();
?>
