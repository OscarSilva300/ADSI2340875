<%-- 
    Document   : ListarUsuario
    Created on : 30/09/2022, 09:22:30 AM
    Author     : HPLAPTOP01
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.UsuarioDAO"%>
<%@page import="Configuracion.Conectar"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/> 
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"  crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        
        <title>Listar Usuarios</title>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link active dropdown-toggle navbar-brand" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="Imagenes/logo_cinyuje.png" width="90" alt="logo_cinyuje"/>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/Proyecto_Cinyuje/CtrProducto?accion=Listar"  data-bs-target="#item"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Productos</a></li>
                            <li><a class="dropdown-item" href="#"><i class="fa fa-cubes" aria-hidden="true"></i> Categorias</a></li>
                                <%--<li><hr class="dropdown-divider"></li>--%>
                            <li><a class="dropdown-item" href="/Proyecto_Cinyuje/CtrUsuario?accion=Listar"><i class="fa fa-users" aria-hidden="true"></i> Usuarios</a></li>
                        </ul>
                    </li>   
                    
                </ul>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="/Proyecto_Cinyuje/CtrProducto?accion=home">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Oferta del día</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="/Proyecto_Cinyuje/CtrProducto?accion=Carrito">Carrito <i class="fas fa-shopping-cart">(<label style="color: darkorange">${contador}</label>)</i></a>
                        </li> 
                    </ul>
                    <form class="d-flex" action="/Proyecto_Cinyuje/CtrProducto?accion=buscar" method="POST">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="busqueda">
                        <button class="btn btn-outline-primary" type="submit">Buscar</button>
                    </form>
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                ${usuario.getNombre()} ${usuario.getApellido()}
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item text-center" href="#">
                                        <img src="/tienda1/Imagenes/usuario4-peque.png" alt="60" width ="60"/>
                                    </a></li>
                                <li><a class="dropdown-item text-center" href="#">${usuario.getUsuario()}</a></li>
                                <li><a class="dropdown-item text-center" href="#">${usuario.getTipo()}</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-center" href="/Proyecto_Cinyuje/Vistas/Logout.jsp">Salir</a></li>
                                <%--<form class="form-inline" action="/TiendaVirtual/Vistas/Logout.jsp" method="POST">
                                    <button name="accion" value="Salir" class="dropdown-item text-center" href="#">Salir</button>
                                </form>--%>
                            </ul>
                        </li>
                    </ul>

                </div>       
            </div>
        </nav>

        <div class="container mt-5 border">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"></div>
                <div class="col-sm-4 ">
                    <form class="form-inline mt-4" >

                        <div class="form-group mx-sm-3 mb-2">

                            <input type="text" class="form-control" name="txtbuscar" placeholder="Digite Nombre">
                        </div>

                        <button type="submit" class="btn btn-success mb-2" name="buscar" value="listar">Buscar <i class="fa fa-search" aria-hidden="true"></i></button>
                            <%--<a class="btn btn-success mb-2" href="CtrUsuario?accion=listar&nomusu=<%=nomb %>" name="buscar">Buscar <i class="fa fa-search" aria-hidden="true"></i></a>--%>
                    </form>
                </div> 
            </div>
            <table class="table" >
                <thead class="thead-dark border">
                    <tr>
                        <th scope="col" colspan="7" class ="text-center border">Usuarios</th>
                        <th scope="col" class ="text-center border"> <a class="btn btn-primary ml-2" href="/Proyecto_Cinyuje/Vistas/CrearUsuario.jsp"><i class="fa fa-user-plus" aria-hidden ="true"></i></a></th>
                    </tr>
                    <tr>
                        <th scope="col" class="text-center border">Id</th>
                        <th scope="col" class="text-center border">Nombre</th>
                        <th scope="col" class="text-center border">Apelido</th>
                        <th scope="col" class="text-center border">Direccion</th>
                        <th scope="col" class="text-center border">Telefono</th>
                        <th scope="col" class="text-center border">Correo</th> 
                        <th scope="col" class="text-center border">Tipo</th>
                        <th scope="col" class="text-center border">Acciones</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="usu" items="${usuario1}">
                        <tr>
                            <th scope="row" class="border">${usu.getId()}</th>
                            <td class="border">${usu.getNombre()}</td>
                            <td class="border">${usu.getApellido()}</td>
                            <td class="border">${usu.getDireccion()}</td>
                            <td class="border">${usu.getTelefono()}</td>
                            <td class="border">${usu.getCorreo()}</td>
                            <td class="border">${usu.getTipo()}</td>
                            <td scope="col" class ="text-center border">
                                <input type="hidden" name="id" id="id" value="${usu.getId()}">
                                <a class="btn btn-warning" href="/Proyecto_Cinyuje/CtrUsuario?accion=editar&id=${usu.getId()}"><i class="fa fa-pencil" aria-hidden ="true"></i></a> 
                                <a class="btn btn-danger" href="#" id="delusuario" ><i class="fa fa-trash" aria-hidden ="true"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>




        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="/Proyecto_Cinyuje/JS/Funciones3.js" type="text/javascript"></script>

    </body>

</html>
