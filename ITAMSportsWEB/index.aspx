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

    <script src="assets/js/jQuery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script src="assets/js/materialize/bon/materialize.min.js"></script>
    <script src="assets/js/main.js"></script>

<body>
  
    <!--Navbar-->
    <nav class="primary-bgColor-0 titulo-default">
        <div class="nav-wrapper">
            <a href="#" class="brand-logo title">ITAMSports</a>
            <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li>
                    <a href="#Eventos">Eventos<i class="material-icons right">event</i></a>
                </li>
                <li>
                    <a href="#Equipos">Equipos                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         <i class="material-icons right">contacts</i></a>
                </li>
            </ul>
        </div>
    </nav>

    <!--Para móviles-->
    <ul id="slide-out" class="sidenav titulo-default">
        <li>
            <a href="#Eventos">Eventos<i class="material-icons right">event</i></a>
        </li>
        <li>
            <a href="#Equipos">Equipos <i class="material-icons right">contacts</i></a>
        </li>
    </ul>

    <!--Main: bienvenida, eventos recientes, equipos-->
    <main>

        <!-- Bienvenida -->
        <div class="section white"> 
            <div class="row container">
                <span class="titulo-6">Bienvenido a ITAMSports</span>
                <p class="texto-3 justify">
                    En este portal econtrarás toda la información importante
                    sobre tus equipos favoritos del ITAM, los eventos próximos y los
                    resultados obtenidos a lo largo del semestre y porqué no, la historia.
                </p>
            </div>
        </div>      

        <div class="parallax-container">
            <div class="parallax"><img src="assets/images/americano_itam.jpg" alt="Balón de futbol americano con el logo del ITAM"/></div>
        </div>

        <form runat="server">

            <!-- Eventos recientes -->
            <div class="section white" id="Eventos"> 
                <div class="row container">
                    <span class="titulo-6">Próximos Eventos</span>
                    <p class="texto-3 justify">
                        Los eventos más próximos:
                    </p>
                        <!--Para hacer la primera conexión con la BD-->                  
                    <div class="row">
                        <div class="col s12">
                            <asp:GridView ID="proximosEventosView" runat="server" CssClass="striped responsive-table" AutoGenerateColumns="true" EmptyDataText="<span class='texto-2'>No hay información por mostrar</span>"></asp:GridView>
                        </div>              
                        <div class="col s6 offset-s3">
                            <div class="row valign-wrapper">
                                <div class="col s4 valign-wrapper">
                                    <span class="texto-2 center">Ver más de: </span>
                                </div>
                                <div class="col s4 valign-wrapper center-align">
                                    <div class="input-field">
                                        <asp:DropDownList ID="eventosList" runat="server" CssClass="right"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col s4 valign-wrapper center-align">
                                    <div class="input-field">
                                        <asp:Button ID="btEventos" runat="server" Text="Saber..." CssClass="waves-effect waves-light btn primary-bgColor-2" OnClick="btEventos_Click" />
                                    </div>
                                </div>
                            </div>                         
                        </div>                   
                    </div>
                </div>
            </div>      

            <div class="parallax-container">
                <div class="parallax"><img src="assets/images/futbol_femenil_itam.jpg" alt="Juego reciente"/></div>
            </div>

            <!-- Equipos -->
            <div class="section white" id="Equipos">
                <div class="row container">
                    <span class="titulo-6 right">Equipos del ITAM</span><br />
                    <p class="texto-3 justify">
                        Conoce a los diversos equipos con los que cuenta el ITAM:
                    </p>
                    <!-- Segunda conexión a la BD -->
                    <div>
                        <asp:GridView ID="equiposView" runat="server" CssClass="striped responsive-table"></asp:GridView>
                    </div>
                </div>
            </div>

            <div class="parallax-container">
                <div class="parallax"><img src="assets/images/cheer_itam.jpg" alt="Equipo Cheer (Porristas) del ITAM"/></div>
            </div>

        </form>
        
    </main>

    <!-- Un pequeño footer con información de desarrollo -->
    <footer class="page-footer primary-bgColor-2">
        <div class="conatiner">
            <div class="row">
                <div class="col l6 s12">
                    <span class="titulo-3">ITAMSports Proyecto DAI</span>
                    <p class="texto-2">
                        Esta página es parte de un proyecto de la clase de Desarrollo de
                        Aplicaciones Informáticas (DAI), el cual está desarrollado con .NET
                        y lo clásico para web (HTML, JS, CSS) agregando el uso de jQuery, 
                        Materialize, Animate.css, sweetalert2, la paleta de colores obtenida
                        con <a href="http://paletton.com/#uid=1000u0kllllaFw0g0qFqFg0w0aF" class="white-text"><u>Paletton</u></a>
                        y las fotos obtenidas en las redes sociales de los distintos equipos del ITAM.
                    </p>
                </div>  
                <div class="col l6 s12">
                    <span class="titulo-2">Desarrolladores: </span>
                    <div class="row texto-2 valign-wrapper">
                        <div class="col m4 s12 center">
                            <i class="medium material-icons">face</i><br />
                            <a href="https://github.com/Tanque40" class="white-text"><u>Bruno Vitte</u></a>
                        </div>
                        <div class="col m4 s12 center">
                            <i class="medium material-icons">face</i><br />
                            <a href="https://github.com/josepe43" class="white-text"><u>Jose Luis Gutiérrez</u></a>
                        </div>
                        <div class="col m4 s12 center">
                            <i class="medium material-icons">face</i><br />
                            <a href="https://github.com/Xer0-0reX" class="white-text"><u>Rodrigo Gonzalez</u></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class ="primary-bgColor-3 footer-copyright">
            <div class="container">
                © 2019 Copyright Clase DAI Semestre Otoño 2019
            </div>
        </div>
    </footer>

</body>
</html>
