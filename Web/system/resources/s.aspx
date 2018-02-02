<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="s.aspx.cs" Inherits="Web.resources.s" %>

                    <div class="row" >
                        <div class="col-xs-12">
                            <div class="box" style="width:95%;margin-left:auto;margin-right:auto;padding:10px">
                                <div class="box-header">
                                     
                                     <h3 class="box-title">S Users related to <%=user.firstname+" "+user.lastname %></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example3" class="table table-bordered table-striped" >
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
                                            <%for(int i=0;i<results.Count;i++){ %>
                                            <tr>
                                                <td><%=results[i].id %></td>
                                                <td><%=results[i].FirstName %></td>
                                                <td><%=results[i].LastName %></td>
                                                <td><%=results[i].Username %></td>
                                                <td><%=results[i].Password %></td>
                                                <td><%=results[i].PhoneNumber %></td>
                                                <td><%=results[i].Zone.ZoneName %></td>
                                                <td><%="S"+results[i].Zone.ZoneId+results[i].MemberId %></td>
                                                <td>
                                                    <a class="btn btn-primary" onclick="getSubPage('useractivity.aspx','<%=results[i].id %>')">User Activity</a></td>
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
<script type="text/javascript">
            $(function () {
                $("#example3").dataTable();
            });
            </script>
               

