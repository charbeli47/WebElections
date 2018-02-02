<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gs.aspx.cs" Inherits="Web.resources.gs" %>
<!-- Content Header (Page header) -->
                

                <!-- Main content -->
                
                    <div class="row" >
                        <div class="col-xs-12">
                            <div class="box" style="width:95%;margin-left:auto;margin-right:auto;padding:10px">
                                <div class="box-header">
                                      
                                     <h3 class="box-title">GS Users related to <%=user.firstname+" "+user.lastname %></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example2" class="table table-bordered table-striped" >
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
                                            <tr>
                                                <td><%=husers[i].id %></td>
                                                <td><%=husers[i].username %></td>
                                                <td><%=husers[i].firstname %></td>
                                                <td><%=husers[i].lastname %></td>
                                                <td><%=husers[i].phone %></td>
                                                <td><%=husers[i].email %></td>
                                                <td><%=husers[i].address %></td>
                                                <td><%=husers[i].status==1?"active":"pending" %></td>
                                                <td><%=husers[i].Zone.ZoneName %></td>
                                                
                                                <td><a class="btn btn-primary" onclick="getSubSubTable('s.aspx','<%=husers[i].id %>')">S Users</a></td>
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

<!-- DATA TABES SCRIPT -->
        <section class="content sub-sub-table">
            </section>

        <script type="text/javascript">
            $(function () {
                $("#example2").dataTable();
            });
            </script>
