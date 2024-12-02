<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
   die("Conexão falhou: " . $conn->connect_error);
}

if (!isset($_GET['id']) || empty($_GET['id'])) {
   die("ID da receita não foi especificado.");
}

$id = (int)$_GET['id'];

$query = "SELECT * FROM receita WHERE idReceita = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$receita = $result->fetch_assoc();
$stmt->close();

if (!$receita) {
   die("Receita não encontrada.");
}

$cozinheiros = $conn->query("SELECT idFuncionario, nome FROM funcionario");
$categorias = $conn->query("SELECT idCategoria, descricao FROM categoria");
$ingredientes = $conn->query("SELECT idIngrediente, nome FROM ingredientes");
$medidas = $conn->query("SELECT idMedida, descricao FROM medida");

$query_ingredientes = "
   SELECT ri.*, i.nome, m.descricao AS medida_descricao
   FROM receita_ingrediente ri
   INNER JOIN ingredientes i ON ri.FKingrediente = i.idIngrediente
   INNER JOIN medida m ON ri.FKmedida = m.idMedida
   WHERE ri.FKreceita = ?
";
$stmt = $conn->prepare($query_ingredientes);
$stmt->bind_param("i", $id);
$stmt->execute();
$ingredientes_result = $stmt->get_result();
$ingredientes_receita = $ingredientes_result->fetch_all(MYSQLI_ASSOC);
$stmt->close();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Editar Receita</title>
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
    max-width: 800px;
    padding: 30px;
    background-color: #041240;
    border-radius: 10px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    color: white;
    margin: 20px 0;
}

h1 {
    margin-bottom: 20px;
    font-size: 2rem;
    color: #ffd700;
    text-align: center;
}

h2 {
    font-size: 1.5rem;
    color: #ffd700;
    margin-bottom: 20px;
}

.form-group {
    display: flex;
    flex-direction: column;
    margin-bottom: 20px;
}

label {
    margin-bottom: 8px;
    font-weight: bold;
    color: #ffce38;
}

input, textarea, select {
    padding: 12px;
    border-radius: 8px;
    border: 1px solid #ffce38;
    font-size: 1rem;
    background-color: #f9f9f9;
    color: #333;
    transition: border-color 0.3s ease;
}

input:focus, textarea:focus, select:focus {
    border-color: #ffd700;
    outline: none;
}

textarea {
    resize: vertical;
}

.add-button {
    background-color: #ffce38;
    color: #010e3d;
    border: none;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    font-size: 1.5rem;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin: 20px auto;
}

.add-button:hover {
    background-color: #ffd700;
}

.table-container {
    margin-top: 20px;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 10px;
}

table th, table td {
    padding: 12px;
    text-align: left;
}

table th {
    background-color: transparent;
    color: #ffd700;
    font-weight: bold;
    text-transform: uppercase;
}

table td {
    background-color: #ffffff;
    color: #010e3d;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
}

table td input, table td select {
    width: 90%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fff;
    color: #333;
}

button {
    background-color: #007bff;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.3s ease;
    display: block;
    width: 100%;
    margin-top: 20px;
}

button:hover {
    background-color: #0056b3;
}

button[type="button"] {
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 8px;
    padding: 8px 12px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button[type="button"]:hover {
    background-color: #a71d2a;
}

.modo-preparo {
    background-color: #f1f1f1;
    color: #010e3d;
    border-radius: 10px;
    padding: 20px;
    width: 100%;
    font-size: 1rem;
    margin-top: 20px;
}

.modo-preparo textarea {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #010e3d;
    font-size: 1rem;
    resize: vertical;
}

@media (max-width: 768px) {
    .container {
        padding: 20px;
    }
    
    .add-button {
        width: 40px;
        height: 40px;
        font-size: 1.2rem;
    }
}
</style>
</head>
<body>
   <div class="container">
       <h1>Editar Receita</h1>
       <form action="salvar_edicao_receita.php" method="POST">
           <input type="hidden" name="id" value="<?php echo htmlspecialchars($receita['idReceita']); ?>">

           <div class="form-group">
               <label for="nome">Nome da Receita:</label>
               <input type="text" id="nome" name="nome" value="<?php echo htmlspecialchars($receita['nome_receita']); ?>" required>
           </div>
           
           <div class="form-group">
               <label for="descricao">Descrição:</label>
               <textarea id="descricao" name="descricao" rows="4" required><?php echo htmlspecialchars($receita['descricao']); ?></textarea>
           </div>
           
           <div class="form-group">
               <label for="modo_preparo">Modo de Preparo:</label>
               <textarea id="modo_preparo" name="modo_preparo" rows="6" required><?php echo htmlspecialchars($receita['modo_preparo']); ?></textarea>
           </div>
           
           <div class="form-group">
               <label for="cozinheiro"> Nome do Cozinheiro:</label>
               <select id="cozinheiro" name="cozinheiro" required>
                   <?php while ($row = $cozinheiros->fetch_assoc()) { ?>
                       <option value="<?php echo $row['idFuncionario']; ?>" <?php echo ($row['idFuncionario'] == $receita['FKcozinheiro']) ? 'selected' : ''; ?>>
                           <?php echo htmlspecialchars($row['nome']); ?>
                       </option>
                   <?php } ?>
               </select>
           </div>

           <div class="form-group">
               <label for="data">Data de Criação:</label>
               <input type="date" id="data" name="data" value="<?php echo htmlspecialchars($receita['data_criacao']); ?>" required>
           </div>

           <div class="form-group">
               <label for="categoria">Categoria:</label>
               <select id="categoria" name="categoria" required>
                   <?php while ($row = $categorias->fetch_assoc()) { ?>
                       <option value="<?php echo $row['idCategoria']; ?>" <?php echo ($row['idCategoria'] == $receita['FKcategoria']) ? 'selected' : ''; ?>>
                           <?php echo htmlspecialchars($row['descricao']); ?>
                       </option>
                   <?php } ?>
               </select>
 </div>

           <h2>Ingredientes</h2>
           <div class="table-container">
               <table id="ingredients-table">
                   <thead>
                       <tr>
                           <th>Quantidade</th>
                           <th>Medida</th>
                           <th>Ingrediente</th>
                           <th>Ação</th>
                       </tr>
                   </thead>
                   <tbody>
                   <?php foreach ($ingredientes_receita as $ingrediente) { ?>
    <tr>
        <td>
            <input type="text" name="quantidade[]" value="<?php echo isset($ingrediente['quantidade']) ? htmlspecialchars($ingrediente['quantidade']) : ''; ?>" required>
            <input type="hidden" name="idIngredienteExistente[]" value="<?php echo isset($ingrediente['idReceitaIngrediente']) ? htmlspecialchars($ingrediente['idReceitaIngrediente']) : ''; ?>">
        </td>
        <td>
            <select name="medida[]">
                <?php
                $medidas->data_seek(0); 
                while ($row = $medidas->fetch_assoc()) { ?>
                    <option value="<?php echo $row['idMedida']; ?>" <?php echo (isset($ingrediente['FKmedida']) && $row['idMedida'] == $ingrediente['FKmedida']) ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars($row['descricao']); ?>
                    </option>
                <?php } ?>
            </select>
        </td>
        <td>
            <select name="ingrediente[]">
                <?php
                $ingredientes->data_seek(0); 
                while ($row = $ingredientes->fetch_assoc()) { ?>
                    <option value="<?php echo $row['idIngrediente']; ?>" <?php echo (isset($ingrediente['FKingrediente']) && $row['idIngrediente'] == $ingrediente['FKingrediente']) ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars($row['nome']); ?>
                    </option>
                <?php } ?>
            </select>
        </td>
        <td>
            <button type="button" onclick="removeRow(this)">Remover</button>
        </td>
    </tr>
<?php } ?>
                                   </select>
                               </td>
                               <td>
                                   <button type="button" onclick="removeRow(this)">Remover</button>
                               </td>
                           </tr>
                       <?php  ?>
                   </tbody>
               </table>
               <button type="button" class="add-button" onclick="addRow()">Adicionar Ingrediente</button>
           </div>

           <div class="form-group">
               <button type="submit">Salvar Alterações</button>
           </div>
       </form>
   </div>
   <script>
       function addRow() {
    const table = document.getElementById('ingredients-table').getElementsByTagName('tbody')[0];
    const newRow = table.insertRow();

    newRow.innerHTML = `
        <td><input type="text" name="quantidade[]" required></td>
        <td><select name="medida[]"><?php
            $medidas->data_seek(0);
            while ($row = $medidas->fetch_assoc()) {
                echo '<option value="' . $row['idMedida'] . '">' . htmlspecialchars($row['descricao']) . '</option>';
            }
        ?></select></td>
        <td><select name="ingrediente[]"><?php
            $ingredientes->data_seek(0);
            while ($row = $ingredientes->fetch_assoc()) {
                echo '<option value="' . $row['idIngrediente'] . '">' . htmlspecialchars($row['nome']) . '</option>';
            }
        ?></select></td>
        <td><button type="button" onclick="removeRow(this)">Remover</button></td>
    `;
}

       function removeRow(button) {
           const row = button.parentNode.parentNode;
           row.parentNode.removeChild(row);
       }
   </script>
</body>
</html>