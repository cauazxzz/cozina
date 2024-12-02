<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

$query = "SELECT idReceita, nome_receita, descricao FROM receita";
$result = $conn->query($query);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar Receitas</title>
    <style>
body {
    background-color: #010e3d;
    color: white;
    font-family: Arial, sans-serif;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
    padding: 20px;
}

.container {
    width: 100%;
    max-width: 900px;
    padding: 30px;
    background-color: #041240;
    border-radius: 10px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    color: white;
    margin: 20px 0;
}

/* Títulos */
h1 {
    margin-bottom: 20px;
    font-size: 2rem;
    color: #ffd700;
    text-align: center;
}

/* Alertas */
.alert {
    background-color: #ffce38;
    color: #010e3d;
    padding: 10px 15px;
    border-radius: 8px;
    margin-bottom: 20px;
    text-align: center;
    font-weight: bold;
}

/* Tabela de Listagem */
table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 10px;
}

table th, table td {
    padding: 12px;
    text-align: left;
}

table thead {
    background-color: transparent;
}

table th {
    color: #ffd700;
    font-weight: bold;
    text-transform: uppercase;
}

table tbody tr {
    background-color: #ffffff;
    color: #010e3d;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
    transition: transform 0.2s ease;
}

table tbody tr:hover {
    transform: scale(1.02);
}

table td {
    border-radius: 8px;
}

/* Ações */
table td a {
    text-decoration: none;
    background-color: #007bff;
    color: white;
    padding: 8px 12px;
    border-radius: 8px;
    font-size: 0.9rem;
    margin-right: 5px;
    transition: background-color 0.3s ease;
}

table td a:hover {
    background-color: #0056b3;
}

table td a:last-child {
    background-color: #dc3545;
}

table td a:last-child:hover {
    background-color: #a71d2a;
}

/* Responsividade */
@media (max-width: 768px) {
    .container {
        padding: 20px;
    }
    
    table th, table td {
        padding: 10px;
        font-size: 0.9rem;
    }
}
</style>
</head>
<body>
    <div class="container">
        <h1>Lista de Receitas</h1>
        
        <?php if (isset($_GET['msg'])): ?>
            <div class="alert">
                <?php echo htmlspecialchars($_GET['msg']); ?>
            </div>
        <?php endif; ?>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome da Receita</th>
                    <th>Descrição</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()) { ?>
                    <tr>
                        <td><?php echo $row['idReceita']; ?></td>
                        <td><?php echo htmlspecialchars($row['nome_receita']); ?></td>
                        <td><?php echo htmlspecialchars($row['descricao']); ?></td>
                        <td>
                            <a href="editar_receita.php?id=<?php echo $row['idReceita']; ?>">Editar</a>
                            <a href="excluir_receita.php?id=<?php echo $row['idReceita']; ?>" onclick ="return confirm('Tem certeza que deseja excluir esta receita?');">Excluir</a>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</body>
</html>

<?php
$conn->close();
?>