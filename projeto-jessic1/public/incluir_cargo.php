<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Incluir Cargos</title>
    <link rel="stylesheet" href="css/incluir_cargo.css"> <!-- Arquivo de estilo atualizado -->
    <!--adicione o link favicon aqui-->
    <link rel="icon" type="png" href="Images/logo-150.png">
     <!--fim favicon-->
     
</head>
<body>
    <div class="container">
        <!-- Navbar -->
        <nav class="navbar">
                <li><a href="incluir_cargo.php">Incluir Cargos</a></li>
                <li><a href="listar_cargos.php">Cargos</a></li>
                <li><a href="incluir_func.php">Funcionários</a></li>
                <li><a href="incluir_restaurante.html">Restaurante</a></li>
                <li><a href="metas.php">Metas</a></li>
        </nav>
        
        <!-- Formulário de Inclusão de Cargos -->
        <div class="content">
            <h2>Incluir Cargos</h2>
            <form action="processar_cargos.php" method="POST">
                <input type="hidden" id="id" name="id" value="<?php echo isset($id) ? $id : ''; ?>">
                
                <label for="nomeCargo">Nome Cargo:</label>
                <input type="text" id="nomeCargo" name="nome" placeholder="Ex: Cozinheiro" value="<?php echo isset($nome) ? $nome : ''; ?>" required>
 
                <label for="descricao">Descrição:</label>
                <input type="text" id="descricao" name="descricao" placeholder="Descrição do cargo" value="<?php echo isset($descricao) ? $descricao : ''; ?>" required>
 
                <label for="dataInicio">Data Início:</label>
                <input type="date" id="dataInicio" name="data_inicio" value="<?php echo isset($data_inicio) ? $data_inicio : ''; ?>" required>
 
                <label for="dataFim">Data Fim:</label>
                <input type="date" id="dataFim" name="data_fim" value="<?php echo isset($data_fim) ? $data_fim : ''; ?>" required>
 
                <label for="ativo">Cargo Ativo</label>
                <input type="checkbox" id="ativo" name="ativo" <?php echo isset($ativo) && $ativo ? 'checked' : ''; ?>

                <div class="buttons">
                    <button type="button" class="voltar" onclick="window.history.back()">Voltar</button>
                    <button type="submit" class="salvar">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
