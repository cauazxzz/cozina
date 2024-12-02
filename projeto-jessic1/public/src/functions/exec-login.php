<?php
require 'db.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recebe os dados do formulário
    $rg = $_POST['rg'];
    $senha = $_POST['senha'];

    try {
        // Buscar o usuário pelo RG
        $stmt = $pdo->prepare("SELECT * FROM usuarios WHERE rg = :rg");
        $stmt->bindParam(':rg', $rg);
        $stmt->execute();

        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verifica se o usuário foi encontrado
        if ($user) {
            // Verifica a senha
            if (password_verify($senha, $user['pass'])) {

                // Armazena as informações do usuário na sessão
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['nome'] = $user['nome'];
                $_SESSION['cargo'] = $user['cargo'];

                // Redirecionar com base no cargo
                switch ($user['cargo']) {
                    case 'cozinheiro':
                        header("Location: ../../views/cozinheiro.php");
                        break;
                    case 'degustador':
                        header("Location: ../../views/degustador.php");
                        break;
                    case 'editor':
                        header("Location: ../../views/editor.php");
                        break;
                    case 'administrador':
                        header("Location: ../../views/administrador.php");
                        break;
                    default:
                        // Caso cargo não seja reconhecido
                        $_SESSION['error'] = "Cargo não reconhecido.";
                        header("Location: ../../login.php");
                }
                exit;
            } else {
                // Senha incorreta
                $_SESSION['error'] = "Senha incorreta!";
                header("Location: ../../login.php");
                exit;
            }
        } else {
            // Usuário não encontrado
            $_SESSION['error'] = "RG não encontrado!";
            header("Location: ../../login.php");
            exit;
        }
    } catch (PDOException $e) {
        // Caso ocorra um erro com o banco de dados
        $_SESSION['error'] = "Erro ao fazer login: " . $e->getMessage();
        header("Location: ../../login.php");
        exit;
    }
}
?>
