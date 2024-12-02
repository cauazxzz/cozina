
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Metas</title>
    <link rel="stylesheet" href="css/adicionarmetas.css">
</head>
<body>
    <div class="navbar"> <!-- precisa arrumar os hrefs -->
        <a href="#">Receitas</a>
        <a href="incluir_cargo.php">Cargos</a>
        <a href="incluir_func.html">Funcionários</a>
        <a href="incluir_restaurante.html">Restaurantes</a>
        <a href="controle_metas.php">Metas</a>
    </div>

    <h1>Adicionar Metas</h1>
    <div class="container">
        <div class="form-container">
            <form id="metaForm" action="salvar_metas.php" method="POST">
                <div class="form-group">
                    <label for="cargo">Cargo:</label>
                    <input type="text" id="cargo" name="cargo" placeholder="Cargo do Funcionário(a)" required>
                </div>

                <div class="form-group">
                    <label for="nome">Nome:</label>
                    <input type="text" id="nome" name="nome" placeholder="Nome do Funcionário(a)" required>
                </div>

                <div class="form-group">
                    <label for="meta">Meta:</label>
                    <input type="text" id="meta" name="meta" placeholder="A meta estabelecida" required>
                </div>
                
                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <input type="text" id="estado" name="estado" placeholder="Exemplo: em andamento" required>
                </div>

                <button type="submit">Salvar</button>
                <button type="button" onclick="window.history.back()">Voltar</button>
            </form>
        </div>
    </div>
</body>
</html>
