<?php
require __DIR__ . 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome'];
    $rg = $_POST['rg'];
    $email = $_POST['email'];
    $password = password_hash($_POST['senha'], PASSWORD_BCRYPT); // Alterado para $_POST['senha']
    $cargo = $_POST['cargo']; // Obtendo o cargo do formulário

    try {
        $stmt = $pdo->prepare("
            INSERT INTO users (nome, rg, email, pass, cargo)
            VALUES (:nome, :rg, :email, :pass, :cargo)
        ");
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':rg', $rg);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':pass', $password);
        $stmt->bindParam(':cargo', $cargo);
        $stmt->execute();

        echo "Usuário registrado com sucesso! <a href='../login.php'>Login</a>";
    } catch (PDOException $e) {
        echo "Erro ao registrar: " . $e->getMessage();
    }
}
?>
