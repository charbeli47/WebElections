<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="analytics.aspx.cs" Inherits="Web.resources.analytics" %>
<!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Analytics
                    </h1>
                    <%--<ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Tables</a></li>
                        <li class="active">Data tables</li>
                    </ol>--%>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row" >
                        <div class="col-xs-12">
                            <div class="box" style="width:95%;margin-left:auto;margin-right:auto;padding:10px">
                                <div class="box-header">
                                      
                                     <h3 class="box-title">Analytics</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped" >
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Username</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>Address Line</th>
                                                <th>Status</th>
                                                <th>Zone</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for(int i=0;i<husers.Count;i++){ %>
                                            <tr id="row<%=husers[i].id %>" class="subrow">
                                                <td><%=husers[i].id %></td>
                                                <td><%=husers[i].username %></td>
                                                <td><%=husers[i].firstname %></td>
                                                <td><%=husers[i].lastname %></td>
                                                <td><%=husers[i].phone %></td>
                                                <td><%=husers[i].email %></td>
                                                <td><%=husers[i].address %></td>
                                                <td><%=husers[i].status==1?"active":"pending" %></td>
                                                <td><%=husers[i].Zone.ZoneName %></td>
                                                
                                                <td><a class="btn btn-primary" onclick="getSubTable('gs.aspx','<%=husers[i].id %>')">GS Users</a></td>
                                            </tr>
                                            <%} %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Username</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>Address Line</th>
                                                <th>Status</th>
                                                <th>Zone</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>

                </section><!-- /.content -->
<!-- DATA TABES SCRIPT -->
        <section class="content sub-table">
            </section>

        <script type="text/javascript">
            $(function () {
                $("#example1").dataTable();
            });
            </script>
<%--<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- x-editable (bootstrap version) -->
    <link href="css/bootstrap-editable/bootstrap-editable.css" rel="stylesheet"/>
    



        <script type="text/javascript">
            $(function () {

                "use strict";

                //iCheck for checkbox and radio inputs
                $('input[type="checkbox"]').iCheck({
                    checkboxClass: 'icheckbox_minimal-blue',
                    radioClass: 'iradio_minimal-blue'
                });

                //When unchecking the checkbox
                $("#check-all").on('ifUnchecked', function (event) {
                    //Uncheck all checkboxes
                    $("input[type='checkbox']", ".table-mailbox").iCheck("uncheck");
                });
                //When checking the checkbox
                $("#check-all").on('ifChecked', function (event) {
                    //Check all checkboxes
                    $("input[type='checkbox']", ".table-mailbox").iCheck("check");
                });
                //Handle starring for glyphicon and font awesome
                $(".fa-star, .fa-star-o, .glyphicon-star, .glyphicon-star-empty").click(function (e) {
                    e.preventDefault();
                    //detect type
                    var glyph = $(this).hasClass("glyphicon");
                    var fa = $(this).hasClass("fa");

                    //Switch states
                    if (glyph) {
                        $(this).toggleClass("glyphicon-star");
                        $(this).toggleClass("glyphicon-star-empty");
                    }

                    if (fa) {
                        $(this).toggleClass("fa-star");
                        $(this).toggleClass("fa-star-o");
                    }
                });

                //Initialize WYSIHTML5 - text editor
                //$("#email_message").wysihtml5();
            });
           
            
        </script>