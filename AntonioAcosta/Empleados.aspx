<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="AntonioAcosta.Empleados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title>CRUD</title>
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="http://aacosta.com.mx/">Aacosta.com.mx</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="Default.aspx">Alta de empleado <span class="sr-only">(current)</span></a></li>
                        <li><a href="Empleados.aspx">Consultar empleado</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <h1>Consulta de empleados</h1>
        <form id="Form1" runat="server">
        
            <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    </form>
        
        </div>
    <script src="Scripts/Crud_Example.js"></script>
    <script src="Scripts/jquery-2.1.4.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/json2.js"></script>
</body>
</html>
