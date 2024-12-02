<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

$query = "SELECT id, nome, autor FROM livros";
$result = $conn->query($query);

if ($result->num_rows == 0) {
    die("Nenhum livro encontrado.");
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livros</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1c2a52;
            padding: 10px 20px;
            color: #fff;
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 50px;
            margin-right: 10px;
        }

        nav a {
            color: #fff;
            margin: 0 15px;
            text-decoration: none;
        }

        main {
            padding: 20px;
        }

        h1 {
            color: #1c2a52;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .search-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-container input[type="text"] {
            padding: 10px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
        }

        .search-container button {
            padding: 10px 15px;
            background-color: #fbc33a;
            color: #1c2a52;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #1c2a52;
            color: #fff;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #333;
        }

        th {
            background-color: #fbc33a;
            color: #1c2a52;
        }

        td .active {
            color: #fbc33a;
            font-size: 20px;
        }

        .edit, .delete {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 18px;
            color: #fbc33a;
        }

        .edit:hover, .delete:hover {
            color: #ffd700;
        }

        /* Estilo para a galeria */
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .gallery-item {
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .gallery-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        .gallery-item img {
            width: 100%;
            height: auto;
            max-height: 200px; 
            object-fit: cover; 
            border-radius: 5px;
        }

        h2 {
            font-size: 1.6em;
            margin-top: 15px;
            color: #2c3e50;
            font-weight: bold;
            line-height: 1.4;
        }

        p {
            font-size: 1em;
            margin-top: 10px;
            color: #7f8c8d;
            line-height: 1.5;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            h1 {
                font-size: 2em;
            }

            .gallery {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            }

            .gallery-item {
                padding: 15px;
            }

            h2 {
                font-size: 1.4em;
            }

            p {
                font-size: 0.9em;
            }
        }
    </style>
</head>
<body>
<header>
        <div class="logo">
            <img src="images/logo-150.png" alt="logo-150.png">
            <span>Arte Della Cucina</span>
        </div>
        <nav>
            <a href="livros_usuario.php">Livros</a>
            <a href="receita_para_usuario.php">Receitas</a>
            <a href="listar_cargos.php">Cargos</a>
            <a href="listar_func.php">Funcionários</a>
            <a href="controle_metas.php">Metas</a>
            <a href="views/administrador.php">Adm</a>
        </nav>
    </header>
    <div class="container">
        <h1>Biblioteca de Livros</h1>
        <div class="gallery">
            <?php while ($livro = $result->fetch_assoc()): ?>
                <div class="gallery-item">
                    <img src="images_livros/<?php echo strtolower(str_replace(" ", "_", $livro['nome'])); ?>.jpg" alt="Imagem do livro <?php echo $livro['nome']; ?>">
                    <h2><?php echo htmlspecialchars($livro['nome']); ?></h2>
                    <p>Autor: <?php echo htmlspecialchars($livro['autor']); ?></p>
                    <a href="detalhes_livro.php?id=<?= $livro['id'] ?>" class="ver-detalhes">Ver Detalhes</a>
                </div>
            <?php endwhile; ?>
        </div>
    </div>
</body>
</html>

<?php $conn->close(); // Fecha a conexão ?>
