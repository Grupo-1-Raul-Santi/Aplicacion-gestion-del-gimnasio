<%@page import="com.sanvalero.gimnasio.domain.Tipo"%>
<%@page import="com.sanvalero.gimnasio.dao.TipoDao"%>
<%@page import="com.sanvalero.gimnasio.domain.Socio"%>
<%@page import="com.sanvalero.gimnasio.dao.*"%>
<%@page import="com.sanvalero.gimnasio.domain.*"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin area | Metropolitan Gym</title>
        <meta name="description" content="Access the admin area of ​​our gym.">

        <%@ include file="includes/head.jsp" %>
    </head>
    <body>
        <%@ include file="includes/menu-en.jsp" %>

        <header class="banner-hero inner-pages" style="background-image: url('images/hero-area-admin.jpg'); background-size: cover; background-position: center center;">
            <h1>Admin area</h1>
        </header>

        <main>
            <section class="container">
                <div class="row">
                    <div class="col-lg-3 col-xs-12">
                        <div class="nav flex-column nav-pills admin-sidebar" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#socios" role="tab" aria-controls="v-pills-home" aria-selected="true">Members</a>
                            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#actividades" role="tab" aria-controls="v-pills-profile" aria-selected="false">Activities</a>
                            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#monitores" role="tab" aria-controls="v-pills-messages" aria-selected="false">Instructors</a>
                            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#salas" role="tab" aria-controls="v-pills-settings" aria-selected="false">Rooms</a>
                        </div>
                    </div>

                    <div class="col-lg-9 col-xs-12">
                        <div class="tab-content" id="v-pills-tabContent">

                            <%
                                String messageSocio = request.getParameter("messageSocio");
                                if (messageSocio == null) {
                                    messageSocio = "";
                                }

                                if (messageSocio.equals("ok")) {
                                    out.println("<div class='message msg-ok'><p>El cliente se ha eliminado de la base de datos</p></div>");
                                } else if (messageSocio.equals("error")) {
                                    out.println("<div class='message msg-fail'><p>No se ha podido eliminar el cliente</p></div>");
                                }
                            %>

                            <!---- Mensaje lanzado cuando se AÑADE un socio ---->
                            <%
                                String statusSocio = request.getParameter("statusSocio");
                                if (statusSocio == null) {
                                    statusSocio = "";
                                }
                                if (statusSocio.equals("ok")) {
                                    out.println("<div class='message msg-ok'><p>El cliente se ha registrado correctamente</p></div>");
                                } else if (statusSocio.equals("error")) {
                                    out.println("<div class='message msg-fail'><p>No se ha podido registrar el socio</p></div>");
                                }
                            %>

                            <!---- Mensaje lanzado cuando se EDITA un socio ---->
                            <%
                                String statusSocioEdit = request.getParameter("statusSocioEdit");
                                if (statusSocioEdit == null) {
                                    statusSocioEdit = "";
                                }
                                if (statusSocioEdit.equals("ok")) {
                                    out.println("<div class='message msg-ok'><p>El cliente se ha editado correctamente</p></div>");
                                } else if (statusSocioEdit.equals("error")) {
                                    out.println("<div class='message msg-fail'><p>No se ha podido editar el socio</p></div>");
                                }
                            %>

                            <!---- Mensaje lanzado cuando se ELIMINA un monitor ---->
                            <%
                                String messageMonitor = request.getParameter("messageMonitor");
                                if (messageMonitor == null) {
                                    messageMonitor = "";
                                }

                                if (messageMonitor.equals("ok")) {
                                    out.println("<div class='message msg-ok'><p>El monitor se ha eliminado de la base de datos</p></div>");
                                } else if (messageMonitor.equals("error")) {
                                    out.println("<div class='message msg-fail'><p>No se ha podido eliminar el monitor</p></div>");
                                }
                            %>

                            <!---- Mensaje lanzado cuando se AÑADE un monitor ---->
                            <%
                                String statusMonitor = request.getParameter("statusMonitor");
                                if (statusMonitor == null) {
                                    statusMonitor = "";
                                }
                                if (statusMonitor.equals("ok")) {
                                    out.println("<div class='message msg-ok'><p>El monitor se ha registrado correctamente</p></div>");
                                } else if (statusMonitor.equals("error")) {
                                    out.println("<div class='message msg-fail'><p>No se ha podido registrar el monitor</p></div>");
                                }
                            %>

                            <!---- Mensaje lanzado cuando se EDITA un monitor ---->
                            <%
                                String statusMonitorEdit = request.getParameter("statusMonitorEdit");
                                if (statusMonitorEdit == null) {
                                    statusMonitorEdit = "";
                                }
                                if (statusMonitorEdit.equals("ok")) {
                                    out.println("<div class='message msg-ok'><p>El monitor se ha editado correctamente</p></div>");
                                } else if (statusMonitorEdit.equals("error")) {
                                    out.println("<div class='message msg-fail'><p>No se ha podido editar el monitor</p></div>");
                                }
                            %>

                            <!---- Mensaje lanzado cuando se CREA una actividad ---->
                            <%
                                String crearActividad = request.getParameter("crearActividad");
                                if (crearActividad == null) {
                                    crearActividad = "";
                                }

                                if (crearActividad.equals("ok")) {
                                    out.println("<div class='message msg-ok'><p>Actividad creada correctamente</p></div>");
                                } else if (crearActividad.equals("error")) {
                                    out.println("<div class='message msg-fail'><p>No se ha podido crear la actividad</p></div>");
                                }
                            %>

                            <!---- Mensaje lanzado cuando se ELIMINA una actividad ---->
                            <%
                                // Muestra el mensaje (si lo hay)
                                String messageTipo = request.getParameter("messageTipo");
                                if (messageTipo != null) {
                            %>
                            <div class='message msg-ok'><p><%= messageTipo%></p></div>
                                    <%
                                        }
                                    %>

                            <!---- Mensaje lanzado cuando se AÑADE una actividad ---->
                            <%
                                String statusTipo = request.getParameter("statusTipo");
                                if (statusTipo == null) {
                                    statusTipo = "";
                                }

                                if (statusTipo.equals("ok")) {
                                    out.println("<div class='message msg-ok'><p>El tipo de actividad se ha registrado con éxito</p></div>");
                                } else if (statusTipo.equals("error")) {
                                    out.println("<div class='message msg-fail'><p>No se ha podido registrar el tipo de actividad</p></div>");
                                }
                            %>

                            <!---- Mensaje lanzado cuando se ELIMINA una sala ---->
                            <%
                                // Muestra el mensaje (si lo hay)
                                String messageSala = request.getParameter("messageSala");
                                if (messageSala != null) {
                            %>
                            <div class='message msg-ok'><p><%= messageSala%></p></div>
                            <%
                                }
                            %>

                            <!---- Mensaje lanzado cuando se AÑADE una sala ---->
                            <%
                                String statusSala = request.getParameter("statusSala");
                                if (statusSala == null) {
                                    statusSala = "";
                                }

                                if (statusSala.equals("ok")) {
                                    out.println("<div class='message msg-ok'><p>La sala se ha registrado con éxito</p></div>");
                                } else if (statusSala.equals("error")) {
                                    out.println("<div class='message msg-fail'><p>No se ha podido registrar la sala</p></div>");
                                }
                            %>

                            <!----------------------------->
                            <!--- INICIO PESTAÑA SOCIOS --->
                            <!----------------------------->

                            <div class="tab-pane fade show active" id="socios" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#ver-socios" role="tab" aria-controls="home" aria-selected="true">Members list</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#anadir-socios" role="tab" aria-controls="profile" aria-selected="false">Add members</a>
                                    </li>
                                </ul>

                                <div class="tab-content" id="myTabContent">

                                    <!--------------------------------------->
                                    <!--- INICIO SUBPESTAÑA LISTAR SOCIOS --->
                                    <!--------------------------------------->
                                    <div class="tab-pane fade show active" id="ver-socios" role="tabpanel" aria-labelledby="home-tab">
                                        <h2>Members list</h2>
                                        <p>On this page you will be able to see the members registered to the club, see their data and delete them from the database.</p><br>


                                        <table class="table lista-socios">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">Member ID</th>
                                                    <th scope="col">First name</th>
                                                    <th scope="col">Last name</th>
                                                    <th scope="col">DNI</th>
                                                    <th scope="col">Address</th>
                                                    <th scope="col"> </th>
                                                    <th scope="col"> </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    Conexion conexion = new Conexion();
                                                    conexion.connect();
                                                    SocioDao socioDao = new SocioDao(conexion);
                                                    ArrayList<Socio> socios = socioDao.listarSocio();

                                                %>
                                                <%   for (Socio socio : socios) {
                                                %>
                                                <tr>
                                                    <th scope="row"><%= socio.getIdSocio()%></th>
                                                    <td><%= socio.getNombre()%></td>
                                                    <td><%= socio.getApellido()%></td>
                                                    <td><%= socio.getDni()%></td>
                                                    <td><%= socio.getDireccion()%></td>
                                                    <td><button class="w-100 btn btn-lg btn-primary button-dark admin" data-toggle="collapse" href="#collapse-<%= socio.getIdSocio()%>" role="button" aria-expanded="false" aria-controls="collapseExample">Edit</button></td>
                                                    <td><a href="borrar-socio?id=<%= socio.getIdSocio()%>"> <button class="w-100 btn btn-lg btn-primary button-dark admin">Delete</button></a></td>
                                                </tr>

                                                <tr class="row-hidden">
                                                    <td colspan="7">
                                                        <div class="collapse" id="collapse-<%= socio.getIdSocio()%>">
                                                            <form method="post" action="editar-socio">
                                                                <div class="form-field">
                                                                    <p>Member ID:</p>
                                                                    <input type="text"  name="txtId" readonly="" class="form-control" value="<%= socio.getIdSocio()%>"/>
                                                                </div>
                                                                <div class="form-field">
                                                                    <p>First name:</p>
                                                                    <input type="text" required="" name="txtNom" class="form-control" value="<%= socio.getNombre()%>"/><br>
                                                                </div>
                                                                <div class="form-field">
                                                                    <p>Last name:</p>
                                                                    <input type="text" name="txtApe" class="form-control" value="<%= socio.getApellido()%>"/><br>
                                                                </div>
                                                                <div class="form-field">
                                                                    <p>DNI:</p>
                                                                    <input type="text" required="" name="txtDNI" class="form-control" value="<%= socio.getDni()%>"/><br>
                                                                </div>
                                                                <div class="form-field">
                                                                    <p>Address:</p>
                                                                    <input type="text" name="txtDirec" class="form-control" value="<%= socio.getDireccion()%>"/><br>
                                                                </div>         
                                                                <input class="w-100 btn btn-lg btn-primary button-dark" type="submit" value="Update info""/>

                                                            </form>

                                                        </div>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>
                                        </table>


                                    </div>
                                    <!------------------------------------> 
                                    <!--- FIN SUBPESTAÑA LISTAR SOCIOS --->
                                    <!------------------------------------>

                                    <!--------------------------------------->
                                    <!--- INICIO SUBPESTAÑA AÑADIR SOCIOS --->
                                    <!--------------------------------------->

                                    <div class="tab-pane fade" id="anadir-socios" role="tabpanel" aria-labelledby="profile-tab">
                                        <h2>Add a member</h2>
                                        <p>Add a member to the METROPOLITAN CLUB using the following form.<p>
                                        <form method="post" action="anadir-socio-admin">
                                            <div class="form-field">
                                                <p>First name:</p>
                                                <input type="text" name="nombre" placeholder="Write here your first name..."/>
                                            </div>
                                            <div class="form-field">
                                                <p>Last name:</p>
                                                <input type="text" name="apellido" placeholder="Write here your last name..."/>
                                            </div>
                                            <div class="form-field">
                                                <p>DNI:</p>
                                                <input type="text" name="dni" placeholder="Write here your DNI..."/>
                                            </div>
                                            <div class="form-field">
                                                <p>Address:</p>
                                                <input type="text" name="direccion" placeholder="Write here your address..."/>
                                            </div>                
                                            <input class="w-100 btn btn-lg btn-primary button-dark" type="submit" value="Add member"/>
                                        </form>

                                    </div>

                                    <!------------------------------------>
                                    <!--- FIN SUBPESTAÑA AÑADIR SOCIOS --->
                                    <!------------------------------------>

                                </div>
                            </div>

                            <!-------------------------->
                            <!--- FIN PESTAÑA SOCIOS --->
                            <!-------------------------->

                            <!---------------------------------->
                            <!--- INICIO PESTAÑA ACTIVIDADES --->
                            <!---------------------------------->

                            <div class="tab-pane fade" id="actividades" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#ver-actividades" role="tab" aria-controls="home" aria-selected="true">Activities list</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#anadir-actividad" role="tab" aria-controls="profile" aria-selected="false">Add activities</a>
                                    </li>
                                </ul>

                                <!-------------------------------------------->
                                <!--- INICIO SUBPESTAÑA LISTAR ACTIVIDADES --->
                                <!-------------------------------------------->
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="ver-actividades" role="tabpanel" aria-labelledby="home-tab">
                                        <h2>Activities list</h2>
                                        <p>Check the list of all the activities available in our center and delete those that are no longer going to be taught.</p><br>
                                        <table class="table lista-socios">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Activity name</th>
                                                    <th scope="col"> </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    TipoDao tipoDao = new TipoDao(conexion);
                                                    ArrayList<Tipo> tipos = tipoDao.listarTipo();
                                                %>

                                                <%
                                                    for (Tipo tipo : tipos) {
                                                %>
                                                <tr>
                                                    <th scope="row"><%= tipo.getIdTipo()%></th>
                                                    <td><%= tipo.getNombreTipo()%></td>
                                                    <td><a href="borrar-tipo?id=<%= tipo.getIdTipo()%>"> <button class="w-100 btn btn-lg btn-primary button-dark admin">Delete</button></a></td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!----------------------------------------->
                                    <!--- FIN SUBPESTAÑA LISTAR ACTIVIDADES --->
                                    <!----------------------------------------->

                                    <!-------------------------------------------->
                                    <!--- INICIO SUBPESTAÑA AÑADIR ACTIVIDADES --->
                                    <!-------------------------------------------->
                                    <div class="tab-pane fade" id="anadir-actividad" role="tabpanel" aria-labelledby="profile-tab">
                                        <h2>Add an activity</h2>
                                        <p>Add a new activity that can be taught in our center.</p><br>
                                        <form method="post" action="anadir-tipo-admin">
                                            <div class="form-field">
                                                <p>Step 1: Activity name</p>
                                                <input type="text" name="nombre" placeholder="Write here the activity name..."/>
                                            </div>
                                            <input class="w-100 btn btn-lg btn-primary button-dark" type="submit" value="Add activity"/>
                                        </form>
                                        
                                        <br><p>Complete the activity info so that users can book an appointment in the app and reserve a place.</p><br>
                                        <%
                                            ArrayList<Tipo> tiposAux = new ArrayList<>();
                                            ArrayList<Sala> salasAux = new ArrayList<>();
                                            ArrayList<Monitor> monitoresAux = new ArrayList<>();
                                            TipoDao tipodaoAux = new TipoDao(conexion);
                                            SalaDao saladaoAux = new SalaDao(conexion);
                                            MonitorDao monitordaoAux = new MonitorDao(conexion);
                                            tiposAux = tipodaoAux.listarTipo();
                                            salasAux = saladaoAux.listarSala();
                                            monitoresAux = monitordaoAux.listarMonitor();
                                        %>
                                        <form method="post" action="crear-actividad">

                                            <div class="form-field">
                                                <p>Step 2: Activity description</p>
                                                <input type="textAux" name="descripcionAux" value="" placeholder="Write here the activity name..."> 
                                            </div>
                                            <br>
                                            <div class="form-field">
                                                <p>Step 3: Choose the activity to complete, the monitor and the room where it'll be taught</p>
                                            </div>
                                            <div class="seleccion-actividad">
                                                <select class="custom-select" name="tipoAux">
                                                    <option selected="selected"> --Choose an activity-- </option> 
                                                    <%
                                                        for (Tipo tipoAux : tiposAux) {%>
                                                    <option value="<%= tipoAux.getIdTipo()%>" ><%= tipoAux.getNombreTipo()%></option>
                                                    <%}%>
                                                </select> 

                                                <select class="custom-select" name="salaAux">
                                                    <option selected="selected"> --Choose a room-- </option> 
                                                    <%
                                                        for (Sala salaAux : salasAux) {%>
                                                    <option value="<%= salaAux.getIdSala()%>" ><%= salaAux.getNombre()%></option>
                                                    <%}%>
                                                </select> 

                                                <select class="custom-select" name="monitorAux">
                                                    <option selected="selected"> --Choose a monitor-- </option> 
                                                    <%
                                                        for (Monitor monitorAux : monitoresAux) {%>
                                                    <option value="<%= monitorAux.getIdMonitor()%>" ><%= monitorAux.getNombre()%></option>
                                                    <%}%>
                                                </select>
                                            </div>

                                            <input class="w-100 btn btn-lg btn-primary button-dark" type="submit" value="Save info"/>
                                        </form>
                                    </div>
                                    <!----------------------------------------->
                                    <!--- FIN SUBPESTAÑA AÑADIR ACTIVIDADES --->
                                    <!----------------------------------------->

                                </div>
                            </div>
                            <!------------------------------->
                            <!--- FIN PESTAÑA ACTIVIDADES --->
                            <!------------------------------->

                            <!-------------------------------->
                            <!--- INICIO PESTAÑA MONITORES --->
                            <!-------------------------------->
                            <div class="tab-pane fade" id="monitores" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#ver-monitores" role="tab" aria-controls="home" aria-selected="true">Instructors list</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#anadir-monitor" role="tab" aria-controls="profile" aria-selected="false">Add an instructor</a>
                                    </li>
                                </ul>

                                <div class="tab-content" id="myTabContent">
                                    <!--------------------------------------->
                                    <!--- INICIO SUBPESTAÑA VER MONITORES --->
                                    <!---------------------------------------->
                                    <div class="tab-pane fade show active" id="ver-monitores" role="tabpanel" aria-labelledby="profile-tab">
                                        <h2>Instructors list</h2>
                                        <p>In this list you can check the personal data of each instructor and delete them from the database.</p><br>
                                        <table class="table lista-socios">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">First name</th>
                                                    <th scope="col">Last name</th>
                                                    <th scope="col">DNI</th>
                                                    <th scope="col">Address</th>
                                                    <th scope="col"> </th>
                                                    <th scope="col"> </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    MonitorDao monitorDao = new MonitorDao(conexion);
                                                    ArrayList<Monitor> monitores = monitorDao.listarMonitor();

                                                %>
                                                <%   for (Monitor monitor : monitores) {
                                                %>
                                                <tr>
                                                    <th scope="row"><%= monitor.getIdMonitor()%></th>
                                                    <td><%= monitor.getNombre()%></td>
                                                    <td><%= monitor.getApellido()%></td>
                                                    <td><%= monitor.getDni()%></td>
                                                    <td><%= monitor.getDireccion()%></td>
                                                    <td><button class="w-100 btn btn-lg btn-primary button-dark admin" data-toggle="collapse" href="#collapse-monitor-<%= monitor.getIdMonitor()%>" role="button" aria-expanded="false" aria-controls="collapseExample">Edit</button></td>
                                                    <td><a href="borrar-monitor?id=<%= monitor.getIdMonitor()%>"> <button class="w-100 btn btn-lg btn-primary button-dark admin">Delete</button></a></td>
                                                </tr>

                                                <tr class="row-hidden">
                                                    <td colspan="7">
                                                        <div class="collapse" id="collapse-monitor-<%= monitor.getIdMonitor()%>">
                                                            <form method="post" action="editar-monitor">
                                                                <div class="form-field">
                                                                    <p>ID:</p>
                                                                    <input type="text"  name="txtId" readonly="" class="form-control" value="<%= monitor.getIdMonitor()%>"/>
                                                                </div>
                                                                <div class="form-field">
                                                                    <p>First name:</p>
                                                                    <input type="text" required="" name="txtNom" class="form-control" value="<%= monitor.getNombre()%>"/><br>
                                                                </div>
                                                                <div class="form-field">
                                                                    <p>Last name:</p>
                                                                    <input type="text" name="txtApe" class="form-control" value="<%= monitor.getApellido()%>"/><br>
                                                                </div>
                                                                <div class="form-field">
                                                                    <p>DNI:</p>
                                                                    <input type="text" required="" name="txtDNI" class="form-control" value="<%= monitor.getDni()%>"/><br>
                                                                </div>
                                                                <div class="form-field">
                                                                    <p>Address:</p>
                                                                    <input type="text" name="txtDirec" class="form-control" value="<%= monitor.getDireccion()%>"/><br>
                                                                </div>         
                                                                <input class="w-100 btn btn-lg btn-primary button-dark" type="submit" value="Update info""/>

                                                            </form>

                                                        </div>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!------------------------------------>
                                    <!--- FIN SUBPESTAÑA VER MONITORES --->
                                    <!------------------------------------>


                                    <!---------------------------------------->
                                    <!--- INICIO SUBPESTAÑA AÑADIR MONITOR --->
                                    <!---------------------------------------->
                                    <div class="tab-pane fade" id="anadir-monitor" role="tabpanel" aria-labelledby="profile-tab">
                                        <h2>Add an instructor</h2>
                                        <p>Add an instructor to the METROPOLITAN CLUB using the following form.</p><br>
                                        <form method="post" action="anadir-monitor">
                                            <div class="form-field">
                                                <p>First name:</p>
                                                <input type="text" name="nombre" placeholder="Write here your first name..."/>
                                            </div>
                                            <div class="form-field">
                                                <p>Last name:</p>
                                                <input type="text" name="apellido" placeholder="Write here your last name..."/>
                                            </div>
                                            <div class="form-field">
                                                <p>DNI:</p>
                                                <input type="text" name="dni" placeholder="Write here your DNI..."/>
                                            </div>
                                            <div class="form-field">
                                                <p>Address:</p>
                                                <input type="text" name="direccion" placeholder="Write here your addresss..."/>
                                            </div>                
                                            <input class="w-100 btn btn-lg btn-primary button-dark" type="submit" value="Add instructor"/>
                                        </form>
                                    </div>
                                    <!------------------------------------->
                                    <!--- FIN SUBPESTAÑA AÑADIR MONITOR --->
                                    <!------------------------------------->
                                </div>
                            </div>
                            <!----------------------------->
                            <!--- FIN PESTAÑA MONITORES --->
                            <!----------------------------->


                            <!---------------------------->
                            <!--- INICIO PESTAÑA SALAS --->
                            <!---------------------------->

                            <div class="tab-pane fade" id="salas" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#ver-salas" role="tab" aria-controls="home" aria-selected="true">Room list</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#anadir-sala" role="tab" aria-controls="profile" aria-selected="false">Add a room</a>
                                    </li>
                                </ul>

                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="ver-salas" role="tabpanel" aria-labelledby="profile-tab">
                                        <h2>Roomslist</h2>
                                        <p>In this list you can see all the rooms that our gym offers to our members, and also you can delete them if necessary.</p><br>
                                        <table class="table lista-socios">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Room rame</th>
                                                    <th scope="col">Extension</th>
                                                    <th scope="col"> </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    SalaDao saladao = new SalaDao(conexion);
                                                    ArrayList<Sala> salas = saladao.listarSala();
                                                %>
                                                <%  for (Sala sala : salas) {
                                                %>
                                                <tr>
                                                    <th scope="row"><%= sala.getIdSala()%></th>
                                                    <td><%= sala.getNombre()%></td>
                                                    <td><%= sala.getExtension()%></td>
                                                    <td><a href="borrar-sala?id=<%= sala.getIdSala()%>"> <button class="w-100 btn btn-lg btn-primary button-dark admin">Delete</button></a></td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="tab-pane fade" id="anadir-sala" role="tabpanel" aria-labelledby="profile-tab">
                                        <h2>Add a room</h2>
                                        <p>Add a new room in our gym to be able to teach different activities in it.</p><br>

                                        <form method="post" action="anadir-sala">
                                            <div class="form-field">
                                                <p>Room name:</p>
                                                <input type="text" name="nombre" placeholder="Write here the room name..."/>
                                            </div>
                                            <div class="form-field">
                                                <p>Room extension:</p>
                                                <input type="text" name="extension" placeholder="Write here the extension of the room in square meters..."/>
                                            </div>
                                            <input class="w-100 btn btn-lg btn-primary button-dark" type="submit" value="Add a room"/>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!------------------------->
                            <!--- FIN PESTAÑA SALAS --->
                            <!------------------------->
                        </div>
                    </div>
            </section>

            <%@ include file="includes/footer-en.jsp" %>
        </main>
    </body>
</html>