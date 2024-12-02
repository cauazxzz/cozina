<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Receitas</title>
    <style>
        body {
            background-color: #010e3d;
            color: white;
            font-family: Garbata;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            padding: 20px;
        }

        .logo {
    position: absolute;
    top: 10px; /* topo */
    left: -100px; /* esquerda */
    width: 450px; /* tamhanho */
    height: auto; /* resolução */
    z-index: 1000; /* em cima */
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
            color:white;
            text-align: center;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        label {
            margin-bottom: 8px;
            font-weight: bold;
        }

        input, textarea {
            padding: 12px;
            border-radius: 8px;
            border: 1px solid white;
            font-size: 1rem;
            background-color: #f9f9f9;
            color: #333;
            transition: border-color 0.3s ease;
        }

        input:focus, textarea:focus {
            border-color: white;
            outline: none;
        }

        textarea {
            resize: vertical;
        }

        .add-button {
    background-color: #ffce38;
    color: white;
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
    margin: 0 auto 20px auto;
}


        .add-button:hover {
            background-color: white;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 10px;
        }

        table th,
        table td {
            padding: 12px;
            text-align: left;
        }

        table th {
            background-color: transparent;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        table td {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
        }

        table td input {
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

        .modo-preparo-container {
            display: flex;
            flex-direction: column;
            margin-top: 40px;
        }

        .modo-preparo {
    background-color: #f1f1f1;
    color: white;
    border-radius: 10px;
    padding: 20px;
    width: 95%; 
    font-size: 1rem;
}

.modo-preparo textarea {
    width: 95%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid black;
    font-size: 1rem;
    resize: vertical; 
}

        .modo-preparo h2 {
            font-size: 1.5rem;
            color: #4d4c4c;
            margin-bottom: 20px;
        }

        .right-column {
            margin-top: 20px;
        }

        .right-column .form-group {
            margin-bottom: 20px;
        }

        .indicador-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .indicador-buttons button {
            background-color: #ffd700;
            color: #333;
            font-size: 1rem;
            padding: 10px 20px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            width: 48%;
            transition: background-color 0.3s ease;
        }

        .indicador-buttons button:hover {
            background-color: #ffcc00;
        }
    </style>
</head>
<?php

$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$dbname = "artedacozinha"; 

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

$cozinheiros = $conn->query("SELECT idFuncionario, nome FROM funcionario");
$categorias = $conn->query("SELECT idCategoria, descricao FROM categoria");
$ingredientes = $conn->query("SELECT idIngrediente, nome FROM ingredientes");
$medidas = $conn->query("SELECT idMedida, descricao FROM medida");

?>

<body>
    <div class="container">
        <h1>Criar Receitas</h1>
        <form action="salvar_receita.php" method="POST" enctype="multipart/form-data">

            <div class="form-group">
                <label for="nome">Nome da Receita:</label>
                <input type="text" id="nome" name="nome" placeholder="Nome da Receita" required>
            </div>
            
            <div class="form-group">
                <label for="descricao">Descrição:</label>
                <textarea id="descricao" name="descricao" rows="4" placeholder="Descrição da Receita" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="cozinheiro">Nome do Cozinheiro:</label>
                <select id="cozinheiro" name="cozinheiro" required>
                    <?php while ($row = $cozinheiros->fetch_assoc()) { ?>
                        <option value="<?php echo $row['idFuncionario']; ?>"><?php echo $row['nome']; ?></option>
                    <?php } ?>
                </select>
            </div>

            <div class="form-group">
                <label for="data">Data de Criação:</label>
                <input type="date" id="data" name="data" required>
            </div>

            <div class="form-group">
                <label for="categoria">Categoria:</label>
                <select id="categoria" name="categoria" required>
                    <?php while ($row = $categorias->fetch_assoc()) { ?>
                        <option value="<?php echo $row['idCategoria']; ?>"><?php echo $row['descricao']; ?></option>
                    <?php } ?>
                </select>
            </div>

            <h1>Inserir Ingredientes:</h1>
            <button type="button" class="add-button" onclick="addRow()">+</button>
            <div class="table-container">
                <table id="ingredients-table">
                    <thead>
                        <tr>
                            <th>Quantidade</th>
                            <th>Medida</th>
                            <th>Ingrediente</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="text" name="quantidade[]" placeholder="Quantidade" required></td>
                            <td>
                                <select name="medida[]" required>
                                    <?php while ($row = $medidas->fetch_assoc()) { ?>
                                        <option value="<?php echo $row['idMedida']; ?>"><?php echo $row['descricao']; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                            <td>
                                <select name="nome_ingrediente[]" required>
                                    <?php while ($row = $ingredientes->fetch_assoc()) { ?>
                                        <option value="<?php echo $row['idIngrediente']; ?>"><?php echo $row['nome']; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="modo-preparo-container">
                <div class="modo-preparo">
                    <h2>Inserir Modo de Preparo:</h2>
                    <textarea id="modo-preparo-textarea" name="modo_preparo" rows="6" placeholder="Descreva aqui o modo de preparo..." required></textarea>
                </div>

                <div class="right-column">
                    <div class="form-group">
                        <label for="porcoes">Porções:</label>
                        <input type="text" id="porcoes" name="porcoes" placeholder="Ex: 4" required>
                    </div>
                    
                    <div class="form-group">
                        <h2>Indicador de Receita Inédita:</h2>
                        <label><input type="radio" name="inedita" value="Sim" required> Sim</label>
                        <label><input type="radio" name="inedita" value="Não "> Não</label>
                    </div>
                    
                    <button type="submit">Criar</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        const medidasOptions = `<?php
            $medidas->data_seek(0); 
            $options = '';
            while ($row = $medidas->fetch_assoc()) {
                $options .= '<option value="' . $row['idMedida'] . '">' . $row['descricao'] . '</option>';
            }
            echo $options;
        ?>`;

        const ingredientesOptions = `<?php
            $ingredientes->data_seek(0); 
            $options = '';
            while ($row = $ingredientes->fetch_assoc()) {
                $options .= '<option value="' . $row['idIngrediente'] . '">' . $row['nome'] . '</option>';
            }
            echo $options;
        ?>`;

        function addRow() {
            const table = document.getElementById('ingredients-table').getElementsByTagName('tbody')[0];
            const newRow = document.createElement('tr');

            newRow.innerHTML = `
                <td><input type="text" name="quantidade[]" placeholder="Quantidade" required></td>
                <td>
                    <select name="medida[]" required>
                        ${medidasOptions}
                    </select>
                </td>
                <td>
                    <select name="nome_ingrediente[]" required>
                        ${ingredientesOptions}
                    </select>
                </td>
            `;
            table.appendChild(newRow);
        }
    </script>
</body>
