<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artedacozinha";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

$query = "SELECT idReceita, nome_receita FROM receita";
$result = $conn->query($query);

$receitas = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $receitas[] = $row;
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Livro</title>
    <style>
/* Global Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

/* Container to center content */
.container {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    width: 100%;
    margin-top: 20px;
    text-align: center; /* Center-align text */
}

/* Titles */
h1 {
    color: #333;
    font-size: 24px;
    margin-bottom: 20px; /* Add space below the title */
}

label {
    font-size: 14px;
    font-weight: bold;
    color: #555;
    display: block;
    margin-bottom: 5px;
    text-align: left; /* Align labels to the left */
}

input[type="text"],
textarea,
select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 14px;
}

/* Buttons */
button, 
input[type="submit"] {
    background-color: #28a745;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    margin-top: 10px;
}

button:hover,
input[type="submit"]:hover {
    background-color: #218838;
}

button[type="button"] {
    background-color: #007bff;
}

button[type="button"]:hover {
    background-color: #0056b3;
}

#listaReceitas {
    list-style-type: none;
    padding: 0;
    text-align: left; /* Align list items to the left */
}

#listaReceitas li {
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    padding: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

#listaReceitas li button {
    background-color: #dc3545;
    padding: 5px 10px;
    font-size: 12px;
    border-radius: 3px;
}

#listaReceitas li button:hover {
    background-color: #c82333;
}

</style>
    <script>
        function adicionarReceita() {
            const select = document.getElementById('receitaSelect');
            const lista = document.getElementById('listaReceitas');
            const receitaId = select.value;
            const receitaNome = select.options[select.selectedIndex].text;

            const itens = document.querySelectorAll('.item-receita');
            for (let item of itens) {
                if (item.dataset.id === receitaId) {
                    alert('Esta receita já foi adicionada.');
                    return;
                }
            }

            const li = document.createElement('li');
            li.className = 'item-receita';
            li.dataset.id = receitaId;
            li.innerHTML = `${receitaNome} <button type="button" onclick="removerReceita(this)">Remover</button>`;
            
            const inputHidden = document.createElement('input');
            inputHidden.type = 'hidden';
            inputHidden.name = 'receitasSelecionadas[]';
            inputHidden.value = receitaId;

            li.appendChild(inputHidden);
            lista.appendChild(li);
        }

        function removerReceita(button) {
            const li = button.parentElement;
            li.remove();
        }
    </script>
</head>
<body>
    <div class= "container">
    <h1>Criar Novo Livro</h1>
    <form action="salva_livro.php" method="post">
        <label for="nome">Nome do Livro:</label>
        <input type="text" id="nome" name="nome" required><br><br>

        <label for="autor">Autor:</label>
        <input type="text" id="autor" name="autor" required><br><br>

        <label for="sinopse">Sinopse:</label><br>
        <textarea id="sinopse" name="sinopse" rows="5" cols="50" required></textarea><br><br>

        <label for="receitaSelect">Adicionar Receitas:</label>
        <select id="receitaSelect">
            <option value="">Selecione uma receita</option>
            <?php foreach ($receitas as $receita): ?>
                <option value="<?= $receita['idReceita'] ?>"><?= htmlspecialchars($receita['nome_receita']) ?></option>
            <?php endforeach; ?>
        </select>
        <button type="button" onclick="adicionarReceita()">Adicionar Receita</button>

        <h3>Receitas Selecionadas:</h3>
        <ul id="listaReceitas"></ul>

        <br><br>
        <input type="submit" value="Salvar Livro">
    </form>
            </div>
</body>
</html>
