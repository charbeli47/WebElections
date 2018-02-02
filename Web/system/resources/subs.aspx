<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subs.aspx.cs" Inherits="Web.resources.subs" %>
<link href="css/iCheck/all.css" rel="stylesheet" type="text/css" />
<!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        S Users reporting to <%=user!=null?user.firstname+" "+user.lastname:"" %>
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
                                     <%if (Web.Permissions.Check(int.Parse(Request["opId"]), "Web Users", "add"))
                                       {%>
                                     <h3 class="box-title"><div style="width:100px;float:right;margin-bottom:-25px"><a class="btn btn-block btn-primary" data-toggle="modal" data-target="#compose-modal" style="color:white;"><i class="fa fa-plus" style="color:white;"></i> Add new</a></div><div style="clear:right"></div><br/></h3><%} %>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped" >
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                                <th>Password</th>
                                                <th>Phone Number</th>
                                                <th>Zone</th>
                                                <th>MEMBER ID</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for(int i=0;i<results.Count;i++){
                                                    %>
                                            <tr>
                                                <td><%=results[i].id %></td>
                                                <td><a href="#" id="FirstName<%=i %>" data-type="text" data-pk="<%=results[i].id %>" data-url="resources/editRow.ashx?table=WebUsers" data-title="FirstName"><%=results[i].FirstName %></a></td>
                                                <td><a href="#" id="LastName<%=i %>" data-type="text" data-pk="<%=results[i].id %>" data-url="resources/editRow.ashx?table=WebUsers" data-title="LastName"><%=results[i].LastName %></a></td>
                                                <td><a href="#" id="Username<%=i %>" data-type="text" data-pk="<%=results[i].id %>" data-url="resources/editRow.ashx?table=WebUsers" data-title="Username"><%=results[i].Username %></a></td>
                                                <td><a href="#" id="Password<%=i %>" data-type="text" data-pk="<%=results[i].id %>" data-url="resources/editRow.ashx?table=WebUsers" data-title="Password"><%=results[i].Password %></a></td>
                                                <td><a href="#" id="Phone<%=i %>" data-type="text" data-pk="<%=results[i].id %>" data-url="resources/editRow.ashx?table=WebUsers" data-title="PhoneNumber"><%=results[i].PhoneNumber %></a></td>
                                                <td><a href="#" id="Zone<%=i %>" data-type="select" data-pk="<%=results[i].id %>" data-url="resources/editRow.ashx?table=WebUsers" data-title="Zone"><%=results[i].Zone.ZoneName %></a></td>
                                                <td><%="S"+results[i].Zone.ZoneId+results[i].MemberId %></td>
                                                <td>
                                                    <a class="btn btn-primary" onclick="getSubPage('useractivity.aspx','<%=results[i].id %>')">User Activity</a><br />
                                                    <%if (Web.Permissions.Check(int.Parse(Request["opId"]), "Web Users", "delete"))
                                       {%><br /><a class="btn btn-danger" onclick="DeleteRow(<%=results[i].id %>)"><i class="fa fa-times"></i>Delete</a><%} %></td>
                                            </tr>
                                            <%} %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                                <th>Password</th>
                                                <th>Phone Number</th>
                                                <th>Zone</th>
                                                <th>MEMBER ID</th>
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
        

        <script type="text/javascript">
            $(function () {
                var table = $("#example1").dataTable({ bPaginate: false });
                table.fnSort([[0, 'desc']]);
            });
            </script>
<%--<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- x-editable (bootstrap version) -->
    <link href="css/bootstrap-editable/bootstrap-editable.css" rel="stylesheet"/>
    <script>
        $(document).ready(function () {
            //toggle `popup` / `inline` mode
            if ($.fn != null)
                $.fn.editable.defaults.mode = 'popup';
            <%if (Web.Permissions.Check(int.Parse(Request["opId"]), "Web Users", "edit"))
        {%>
            <%for (int i = 0; i < results.Count; i++)
        {%>
            $('#FirstName<%=i%>').editable();
            $('#LastName<%=i%>').editable();
            $('#Username<%=i%>').editable();
            $('#Password<%=i%>').editable();
            $('#Phone<%=i%>').editable();
            $('#Zone<%=i%>').editable({
                type: 'select',
                title: 'Select Group',
                placement: 'right',
                value: <%=results[i].ZoneId%>,
                source: [
                    <%=zonesList%>
                ]
                /*
                //uncomment these lines to send data on server
                ,pk: 1
                ,url: '/post'
                */
            });
           
            <%}
        }%>
            //make username editable
            
        });
    </script>
<div class="modal fade" id="compose-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-envelope-o"></i> Create New User</h4>
                    </div>
                    <form action="#" method="post">
                        <input type="hidden" id="userId" name="userId" />
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">First Name:</span>
                                    <input name="FirstName" id="FirstName" type="text" class="form-control" placeholder="First Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Last Name:</span>
                                    <input name="LastName" id="LastName" type="text" class="form-control" placeholder="Last Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Phone Number:</span>
                                    <input name="PhoneNumber" id="PhoneNumber" type="text" class="form-control" placeholder="Phone Number">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Zone:</span>
                                    <select name="selectzone" id="selectzone" class="form-control" runat="server"></select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer clearfix">

                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>

                            <button type="button" class="btn btn-primary pull-left" data-dismiss="modal" onclick="AddRow()"><i class="fa fa-plus"></i> Create</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

<script>
    function AddRow() {
        $.post("resources/AddRow.ashx", { table: "WebUser", Rows: $("input[name='FirstName']").val() + "|" + $("input[name='LastName']").val()+"|"+$("input[name='PhoneNumber']").val()+"|"+$("select[name='selectzone']").val()+"|S|"+$("select[name='selectparent']").val() },
            function (data) {
                $(".modal-backdrop").hide();
                getSubPage('subs.aspx', '<%=Request["pageId"] %>');
            });
    }
    function DeleteRow(id) {
        $.post("resources/DeleteRow.ashx", { table: "WebUser", tableId: id },
            function (data) {
                getSubPage('subs.aspx', '<%=Request["pageId"] %>');
            });
    }
</script>
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

