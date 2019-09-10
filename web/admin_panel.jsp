<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.sql.*" %>
<%@page import="Database.DatabaseConnection" %>

<!DOCTYPE html>
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="CSS/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="stylesheet.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Swift Airways</title>
    </head>
    <body>
        <script type="text/javascript" src="JS/jquery.min.js"></script>
        <script type="text/javascript" src="JS/popper.min.js"></script>
        <script type="text/javascript" src="JS/bootstrap.min.js"></script>
        <script type="text/javascript" src="local.js"></script>
        <script>
            function getID(id){
                var element_id = id;
                window.location.replace("?id=" + element_id);
            }
        </script>
            
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 pr-0 pl-0">
                    <nav class="navbar navbar-expand-md navbar-light bg-light">
                        <a class="navbar-brand mr-0" href="index.jsp">
                            <img src="static/images/Swift-Air-Logo.png" style="width: 35%; height: 50%;">
                        </a>
                        <div class="nav-btn">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2"   aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                        </div>
                        <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">
                                        Sign In
                                    </a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link logout-link" href="#">
                                        Sign Up
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <div><h1 class="text-center heading">Admin Panel</h1></div>
            <div class="row form-top-margin text-left">
                <div class="col-md-12">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                          <a class="nav-link active" href="#modifyFlightDetails" role="tab" data-toggle="tab" aria-selected="true">Modify flight details</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#addNewFlightDetails" role="tab" data-toggle="tab">New flight</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <!-- Modify flight details tab -->
                        <div role="tabpanel" class="row tab-pane active" id="modifyFlightDetails">
                            <div class="col-md-6 mb-3" style="margin-top: 1%; padding-left: 30px;">
                                <form action="admin" method="post">
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Enter Flight name</label>
                                            <select class="form-control">
                                                <%  // fetching flight details from 'index.jsp'
                                                    Connection con = new DatabaseConnection().getConnection();
                                                    PreparedStatement stmt = con.prepareStatement("SELECT flight_name FROM flight");
                                                    ResultSet rst = stmt.executeQuery();
                                                    while(rst.next()){
                                                %>
                                                <option value=<% out.print(rst.getString(1)); %> ><% out.print(rst.getString(1)); %></option>
                                                <% } %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Enter airport name</label>
                                            <input class="form-control" type="text" name="modify-airport-name" placeholder="Enter airport name from where flight will depart"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Enter destination</label>
                                            <input class="form-control" type="text" name="modify-dest-airport-name" placeholder="Enter destination airport"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Departure Date</label>
                                            <input class="form-control" type="date" name="modify-dept-date" placeholder="Enter departure date"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Departure time</label>
                                            <input class="form-control" type="text" name="modify-dept-time" placeholder="Enter departure time"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Journey hours</label>
                                            <input class="form-control" type="text" name="modify-journey-hours" placeholder="Enter journey hours"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Ticket price</label>
                                            <input class="form-control" type="text" name="modify-ticket-price" placeholder="Enter ticket price in $"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-4 mb-3 submit-pad">
                                            <button class="btn btn-primary btn-outline-primary" id="modifyflight" onclick="getID(this.id);" type="submit">Modify</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Add new flight details tab -->
                        <div role="tabpanel" class="tab-pane fade" id="addNewFlightDetails">
                            <div class="col-md-6 mb-3" style="margin-top: 1%;">
                                <form action="admin" method="post">
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Enter Flight name</label>
                                            <input class="form-control" type="text" name="new-flight-name" placeholder="Enter full flight name"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Enter airport name</label>
                                            <input class="form-control" type="text" name="new-airport-name" placeholder="Enter airport name from where flight will depart"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Enter destination</label>
                                            <input class="form-control" type="text" name="new-dept-airport-name" placeholder="Enter destination airport"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Departure Date</label>
                                            <input class="form-control" type="date" name="new-dept-date" placeholder="Enter departure date"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Departure time</label>
                                            <input class="form-control" type="text" name="new-dept-time" placeholder="Enter departure time"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Journey hours</label>
                                            <input class="form-control" type="text" name="new-journey-hours" placeholder="Enter journey hours"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-12 mb-3">
                                            <label class="label-input">Ticket price</label>
                                            <input class="form-control" type="text" name="new-ticket-price" placeholder="Enter ticket price in $"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-4 mb-3 submit-pad">
                                            <button class="btn btn-primary btn-outline-primary" id="addflight" onclick="getID(this.id);" type="submit">Add flight</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>