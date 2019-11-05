<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="eventos.aspx.cs" Inherits="ITAMSportsWEB.eventos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                    <a href="index.aspx">Inicio<i class="material-icons right">home</i></a>
                </li>
            </ul>
        </div>
    </nav>

    <!--Para móviles-->
    <ul id="slide-out" class="sidenav titulo-default">
        <li>
            <a href="index.aspx">Inicio<i class="material-icons right">home</i></a>
        </li>
    </ul>
    
    <!-- Main -->
    <main>
        <div class="container white">
            <form id="form1" runat="server">
                <div class="row">
                    <div class="col s12 m6 panel">
                        <span class="titulo-4">Datos del evento:</span>
                        <asp:BulletedList ID="listEvento" runat="server"></asp:BulletedList>
                    </div>
                    <div class="col s12 m6 panel valign-wrapper center" id="deporte">
                        <span class="titulo-4">Evento de:</span><br />
                        <asp:Label ID="lbEquipo" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col s12">
                        <span class="titulo-2 left">Posibles participantes:</span><br />
                        <asp:BulletedList ID="listParticipantes" runat="server"></asp:BulletedList>
                    </div>
                </div>
            </form>
        </div>
    </main>
  
</body>

</html>
