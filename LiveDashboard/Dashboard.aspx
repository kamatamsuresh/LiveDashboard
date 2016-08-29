<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LiveDashboard.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hackathon Admin Dashboard</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script src="Scripts/angular.min.js"></script>
</head>
<body data-ng-app="angularServiceDashboard">
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Dashboard {{ 1+1 }}</a>
            </div>
            <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
                Last access : 24 April 2015 &nbsp;<a href="#" class="btn btn-danger square-btn-adjust">Logout</a>
            </div>
        </nav>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center">
                        <img src="assets/img/find_user.png" class="user-image img-responsive" />
                    </li>
                    <li>
                        <a class="active-menu" href="index.html"><i class="fa fa-dashboard fa-3x"></i>Dashboard</a>
                    </li>
                    <li>
                        <a href="chart.html"><i class="fa fa-bar-chart-o fa-3x"></i>Reports</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h2>Admin Dashboard</h2>
                        <h5>- developed by Suresh Kamatam & Venugopal Appari</h5>
                    </div>
                </div>
                <!-- /. ROW  -->
                <hr />
                <!-- Category Count with images row - Start-->
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-red set-icon">
                                <i class="fa  fa-warning"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">20 New</p>
                                <p class="text-muted">Exceptions</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-brown set-icon">
                                <i class="fa fa-bell-o"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">13 New</p>
                                <p class="text-muted">Alerts</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-green set-icon">
                                <i class="fa fa-bars"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">30 Tickets</p>
                                <p class="text-muted">Remaining</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-blue set-icon">
                                <i class="fa fa-edit"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">240 New</p>
                                <p class="text-muted">Remainders</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Category Count with images row - ENd-->
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Filter Criteria
                            </div>
                            <div class="panel-body">
                                <form role="form">
                                    <div class="form-group">
                                        <b>Refresh Interval in milli seconds:</b>
                                        <input type="text" class="form-control" style="width: 80px;padding-left:0px;padding-right:0px;" id="txtRefreshInterval" />
                                        <button class="btn btn-primary" id="btnInterval"><i class=" fa fa-refresh "></i>Update</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Exceptions & Alerts row - Start-->
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #DB0630; color: #FFFFFF; font-size: 16px;">
                                <i class="fa  fa-warning"></i>&nbsp;
                                Exceptions List
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="exceptionsTable">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Application Name</th>
                                                <th>Backend</th>
                                                <th>Message</th>
                                                <th>Time.</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                                <td>100090</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                                <td>100090</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                                <td>100090</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #B94A00; color: #FFFFFF; font-size: 16px;">
                                <i class="fa fa-bell-o"></i>&nbsp;
                                Alerts List
                           
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="alertsTable">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                                <th>User No.</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                                <td>100090</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                                <td>100090</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                                <td>100090</td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                                <td>100090</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Exceptions & Alerts row - End-->

                <!-- Tickets & Remainders row - Start-->
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #00CE6F; color: #FFFFFF; font-size: 16px;">
                                <i class="fa fa-bars"></i>&nbsp;
                                Tickets List
                           
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="ticketsTable">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Application Name</th>
                                                <th>Backend</th>
                                                <th>Message</th>
                                                <th>Time</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                                <td>100090</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                                <td>100090</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                                <td>100090</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #A95DF0; color: #FFFFFF; font-size: 16px;">
                                <i class="fa fa-edit"></i>&nbsp;
                                Remainders List
                           
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="remaindersTable">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                                <th>User No.</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                                <td>100090</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                                <td>100090</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <ul id="discussion"></ul>
                    </div>
                </div>
                <!-- Tickets & Remainders row - End-->

                <!-- Enable it later
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">

                        <div class="chat-panel panel panel-default chat-boder chat-panel-head">
                            <div class="panel-heading">
                                <i class="fa fa-comments fa-fw"></i>
                                Chat Box
                               
                                <div class="btn-group pull-right">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-chevron-down"></i>
                                    </button>
                                    <ul class="dropdown-menu slidedown">
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-refresh fa-fw"></i>Refresh
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-check-circle fa-fw"></i>Available
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-times fa-fw"></i>Busy
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-clock-o fa-fw"></i>Away
                                            </a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-sign-out fa-fw"></i>Sign Out
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="panel-body">
                                <ul class="chat-box">
                                    <li class="left clearfix">
                                        <span class="chat-img pull-left">
                                            <img src="assets/img/1.png" alt="User" class="img-circle" />
                                        </span>
                                        <div class="chat-body">
                                            <strong>Jack Sparrow</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>12 mins ago
                                            </small>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                           
                                            </p>
                                        </div>
                                    </li>
                                    <li class="right clearfix">
                                        <span class="chat-img pull-right">

                                            <img src="assets/img/2.png" alt="User" class="img-circle" />
                                        </span>
                                        <div class="chat-body clearfix">

                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>13 mins ago
                                            </small>
                                            <strong class="pull-right">Jhonson Deed</strong>

                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                           
                                            </p>
                                        </div>
                                    </li>
                                    <li class="left clearfix">
                                        <span class="chat-img pull-left">
                                            <img src="assets/img/3.png" alt="User" class="img-circle" />
                                        </span>
                                        <div class="chat-body clearfix">

                                            <strong>Jack Sparrow</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>14 mins ago
                                            </small>

                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                           
                                            </p>
                                        </div>
                                    </li>
                                    <li class="right clearfix">
                                        <span class="chat-img pull-right">
                                            <img src="assets/img/4.png" alt="User" class="img-circle" />
                                        </span>
                                        <div class="chat-body clearfix">

                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>15 mins ago
                                            </small>
                                            <strong class="pull-right">Jhonson Deed</strong>

                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                           
                                            </p>
                                        </div>
                                    </li>
                                    <li class="left clearfix">
                                        <span class="chat-img pull-left">
                                            <img src="assets/img/1.png" alt="User" class="img-circle" />
                                        </span>
                                        <div class="chat-body">
                                            <strong>Jack Sparrow</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>12 mins ago
                                            </small>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                           
                                            </p>
                                        </div>
                                    </li>
                                    <li class="right clearfix">
                                        <span class="chat-img pull-right">
                                            <img src="assets/img/2.png" alt="User" class="img-circle" />
                                        </span>
                                        <div class="chat-body clearfix">

                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>13 mins ago
                                            </small>
                                            <strong class="pull-right">Jhonson Deed</strong>

                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                           
                                            </p>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <div class="panel-footer">
                                <div class="input-group">
                                    <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message to send..." />
                                    <span class="input-group-btn">
                                        <button class="btn btn-warning btn-sm" id="btn-chat">
                                            Send
                                       
                                        </button>
                                    </span>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <%--<div class="panel panel-default">
                            <div class="panel-heading">
                                Donut Chart Example
                           
                            </div>
                            <div class="panel-body">
                                <div id="morris-donut-chart"></div>
                            </div>
                        </div>--%>
                    </div>
                </div>
                -->
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- MORRIS CHART SCRIPTS -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
    <!-- DATA TABLE SCRIPTS -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
    <script src="Scripts/jquery.signalR-2.2.0.min.js"></script>
    <!--Reference the autogenerated SignalR hub script. -->
    <script src="signalr/hubs"></script>
    <!--Add script to update the page and send messages.-->
    <script type="text/javascript">
        $(function () {
            // Declare a proxy to reference the hub.
            var chat = $.connection.dashboardHub;
            // Create a function that the hub can call to broadcast messages.
            chat.client.broadcastMessage = function (alertMessage) {
                // Html encode display name and message.
                var encodedMsg = $('<div />').text(alertMessage).html();
                // Add the message to the page.
                $('#discussion').prepend('<li><strong>' + alertMessage
                    + '</strong>:&nbsp;&nbsp;</li>');
            };
            // Start the connection.
            //$.connection.hub.start().done();
            // Start the connection.
            $.connection.hub.start().done(function () {
                $('#btnInterval').click(function () {
                    // Call the Send method on the hub.
                    chat.server.send($('#txtRefreshInterval').val());
                    // Clear text box and reset focus for next comment.
                    $('#txtRefreshInterval').val('').focus();
                });
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#exceptionsTable').dataTable();
            $('#alertsTable').dataTable();
            $('#ticketsTable').dataTable();
            $('#remaindersTable').dataTable();
        });
    </script>
    <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
