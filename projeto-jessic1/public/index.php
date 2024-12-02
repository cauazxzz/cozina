
<!DOCTYPE html>
<html lang="pt-br">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--LINK GOOGLE FONTS-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!--FIM GOOGLE FONTS-->

    <!--LINK BOOTSTRAP ICONS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!--FIM  BOOTSTRAP ICONS-->

    <!--link que conecta o html com css -->
    <link rel="stylesheet" href="css/index.css">

    <title>Arte della Cuzina</title>

    <!--adicione o link favicon aqui-->
    <link rel="icon" type="png" href="images/logo-150.png">
    <!--fim favicon-->

</head>

<body>

    <header>
        <div class="interface">
            <div class="logo">
                <a href="images/logo-150.png">
                    <img src="images/logo-150.png" alt="Logo">
                    <!--logo tamanho: 150 x 150 -->
                </a>
            </div>


            <!--botão de login-->
            <div class="btn-login">
                <a href="login.php">
                    <button>Faça Login</button>
                </a>

            </div>
            <!--btn-->
        </div>
        <!--interface-->
    </header>

    <main>

        <section class="topo-do-site">
            <div class="interface">
                <div class="flex">
                    <div class="txt-topo-site">
                        <p>Italian Acervo</p>
                        <h1><span>ARTE DELLA CUCINA</span></h1>
                        <p> Explore o acervo orgânico da culinária italiana: receitas autênticas, sabor irresistível, tudo ao alcance de um clique! </p>

                        <!--botão login-->
                        <div class="btn-login">
                            <a href="usuarios.php">
                                <button>Sou usuario</button>
                            </a>
                        </div>

                    </div>
                    <!--txt-topo-site-->

                    <div class="img-topo-site">
                        <img src="images/logo-400.png" alt="img-principal">
                        <!--tamanho 400 x 400-->

                    </div>
                    <!--img-topo-site-->

                </div>
                <!--flex-->
            </div>
            <!--interface-->
        </section>
        <!--topo-do-site-->

        <section class="sobre">
            <div class="interface">
                <div class="flex">
                    <div class="img-sobre">
                        <img src="images/img-sobre-350.png" alt="img-sobre">
                        <!--tamanho 350 x 350-->
                    </div>
                    <!--img-sobre-->

                    <div class="txt-sobre">
                        <h2><span>Italian Acervo</span></h2>
                        <P>
                            Bem-vindo ao Arte della Cucina, seu hub digital para a culinária italiana. Nosso sistema facilita a criação, organização e comercialização de receitas, reunindo cozinheiros, degustadores e editores. Cozinhe, experimente e publique suas receitas italianas
                            autênticas, tudo em um só lugar. Transforme pratos deliciosos em livros e compartilhe a magia da gastronomia italiana com o mundo!
                        </P>

                        <div class="btn-social">
                            <a href="#">
                                <button><i class="bi bi-instagram"></i></button></a>
                            <!--link-btn-instagram-->

                            <a href="#">
                                <button><i class="bi bi-facebook"></i></button></a>
                            <!--link-btn-facebook--->

                            <a href="#">
                                <button><i class="bi bi-twitter"></i></button></a>
                            <!--link-btn-twitter-->


                        </div>
                        <!--btn-social-->
                    </div>
                    <!--txt-sobre-->
                </div>
                <!--flex-->
            </div>
            <!--interface-->
        </section>
        <!--sobre-->
    </main>

    <footer>
        <!--define um rodapé-->
        <div class="interface">
            <div class="line-footer">
                <div class="flex">
                    <div class="logo-footer">
                        <img src="images/logo-150.png" alt="logo">
                        <!-- logo tamanho: 150 x 150 -->
                    </div>
                    <!--logo-footer-->
                    <div class="btn-social">
                        <a href="#">
                            <button><i class="bi bi-instagram"></i></button></a>
                        <!--link-btn-instagram-->

                        <a href="#">
                            <button><i class="bi bi-facebook"></i></button></a>
                        <!--link-btn-facebook--->

                        <a href="#">
                            <button><i class="bi bi-twitter"></i></button></a>
                        <!--link-btn-twitter-->

                    </div>
                    <!--btn-social-->
                </div>
            </div>
            <!--line-footer-->

            <!--E-mail-->
            <div class="line-footer borda">
                <p><i class="bi bi-envelope-fill"></i><a href="mailto:claravoss@gmail.com">Artedellacuzina@gmail.com</a></p>

            </div>
            <!--line-footer-->
        </div>
        <!--interface-->
    </footer>
</body>

</html>