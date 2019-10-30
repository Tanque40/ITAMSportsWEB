<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ITAMSportsWEB.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ITAMSports</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="assets/css/master.min.css" rel="stylesheet" />
    <link rel="shortcut icon" href="favicon.ico" />
</head>
<body>
    <!--Navbar-->
    <nav class="primary-bgColor-0 titulo-default">
        <div class="nav-wrapper">
            <a href="#" class="brand-logo title">ITAMSports</a>
            <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            <!-- Faltan links -->
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li>
                    <a href="#">Eventos<i class="material-icons right">event</i></a>
                </li>
                <li>
                    <a href="#">Equipos                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         <i class="material-icons right">contacts</i></a>
                </li>
            </ul>
        </div>
    </nav>

    <!--Para móviles-->
    <ul id="slide-out" class="sidenav titulo-default">
        <!-- Faltan links -->
        <li>
            <a href="#">Eventos<i class="material-icons right">event</i></a>
        </li>
        <li>
            <a href="#">Equipos <i class="material-icons right">contacts</i></a>
        </li>
    </ul>

    <!--Panel uno, bienvanida y foto de colmillos-->
    <div class="container">
        <div class="row">
            <div class="section white"> 
                <div class="row container">
                    <span class="titulo-3">Bienvenido a ITAMSports</span>
                    <p class="texto-1 justify">
                        En este portal econtrarás toda la información importante
                        sobre tus equipos favoritos del ITAM, los eventos próximos y los
                        resultados obtenidos a lo largo del semestre y porqué no, la historia.
                    </p>
                </div>
            </div>      

            <div class="parallax-container">
                <img src="assets/images/americano_itam.jpg" alt="Balón de futbol americano con el logo del ITAM" class=""/>
            </div>

            <div class="section white"> 
                <div class="row container">
                    <span class="titulo-2">Eventos Recientes</span>
                     <!--Para hacer la primera conexión con la BD-->
                    <form id="form1" runat="server">
                        <div>
                        </div>
                    </form>
                </div>
            </div>      

            <div class="parallax-container">
                <img src="assets/images/rasultado_partido.jpg" alt="Juego reciente" class=""/>
            </div>
        </div>
        
    </div>


    <script src="assets/js/jQuery.min.js"></script>
    <script src="assets/js/materialize/bon/materialize.min.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
