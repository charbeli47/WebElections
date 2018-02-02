<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vlist.aspx.cs" Inherits="Web.resources.vlist" %>
<link href="css/iCheck/all.css" rel="stylesheet" type="text/css" />
<!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        V List
                        
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
                                     <h3 class="box-title"><div style="width:100px;float:right;margin-bottom:-25px"><a href="resources/downloadExcel.ashx" target="_blank" class="btn btn-primary" style="color:white">Download Excel</a></div><div style="clear:right"></div><br/></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped" >
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th></th>
                                                <th>هوية الناخب</th>
                                                <th>الاسم</th>
                                                <th>اسم الاب</th>
                                                <th>الشهرة</th>
                                                <th>اسم الام</th>
                                                <th>طائفة اللائحة</th>
                                                <th>البلدة او الحي</th>
                                                <th>رقم السجل</th>
                                                <th>الجنس</th>                                                
                                                <th>تاريخ الولادة</th>
                                                <th>رقم الهاتف</th>
                                                <th>البريد الإلكتروني</th>
                                                <th>عنوان السكن</th>
                                                <th>المرجع</th>
                                                <th>الخصائص</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for(int i=0;i<results.Count;i++){ %>
                                            <tr>
                                                <td><%=results[i].SearchList.id %></td>
                                                <td><a class="btn btn-primary" class="btn btn-block btn-primary" data-toggle="modal" data-target="#details-modal<%=results[i].id %>" style="color:white;">Details</a></td>
                                                <td><%=results[i].SearchList.VoterID %></td>
                                                <td><%=results[i].SearchList.FirstName %></td>
                                                <td><%=results[i].SearchList.MiddleName %></td>
                                                <td><%=results[i].SearchList.LastName %></td>
                                                <td><%=results[i].SearchList.MotherName %></td>
                                                <td><%=results[i].SearchList.ta2ifa %></td>
                                                <td><%=results[i].SearchList.street %></td>
                                                <td><%=results[i].SearchList.segel %></td>
                                                <td><%=results[i].SearchList.Gender %></td>
                                                
                                                <td><%=results[i].SearchList.DOB %></td>
                                               <td><%=results[i].Phone %></td>
                                                <td><%=results[i].Email %></td>
                                                <td><%=results[i].sakan %></td>
                                                <td><%=results[i].marga3 %></td>
                                                <td><%=results[i].Khasa2iss %></td>
                                                
                                            </tr>
                                            <%} %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                 <th>ID</th>
                                                <th></th>
                                                <th>هوية الناخب</th>
                                                <th>الاسم</th>
                                                <th>اسم الاب</th>
                                                <th>الشهرة</th>
                                                <th>اسم الام</th>
                                                <th>طائفة اللائحة</th>
                                                <th>البلدة او الحي</th>
                                                <th>رقم السجل</th>
                                                <th>الجنس</th>                                                
                                                <th>تاريخ الولادة</th>
                                                <th>رقم الهاتف</th>
                                                <th>البريد الإلكتروني</th>
                                                <th>عنوان السكن</th>
                                                <th>المرجع</th>
                                                <th>الخصائص</th>
                                                
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
            
            //make username editable
            
        });
    </script>

<%foreach(var row in results) { %>
<div class="modal fade" id="details-modal<%=row.id %>" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-envelope-o"></i>  <%=row.SearchList.FirstName+" "+row.SearchList.LastName %></h4>
                    </div>
                    <form style="direction:rtl">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">هوية الناخب:</span>
                                    <label class="form-control"><%=row.SearchList.VoterID %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">الاسم:</span>
                                    <label class="form-control"><%=row.SearchList.FirstName %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">اسم الاب:</span>
                                    <label class="form-control"><%=row.SearchList.MiddleName %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">الشهرة:</span>
                                    <label class="form-control"><%=row.SearchList.LastName %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">اسم الام:</span>
                                    <label class="form-control"><%=row.SearchList.MotherName %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">طائفة اللائحة:</span>
                                    <label class="form-control"><%=row.SearchList.ta2ifa %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">البلدة او الحي:</span>
                                    <label class="form-control"><%=row.SearchList.street %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">رقم السجل:</span>
                                    <label class="form-control"><%=row.SearchList.segel %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">الجنس:</span>
                                    <label class="form-control"><%=row.SearchList.Gender %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">تاريخ الولادة:</span>
                                    <label class="form-control"><%=string.Format("{0:dd/MM/yyyy}",row.SearchList.DOB) %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">رقم الهاتف:</span>
                                    <label class="form-control"><%=row.Phone %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">البريد الإلكتروني:</span>
                                    <label class="form-control"><%=row.Email %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">عنوان السكن:</span>
                                    <label class="form-control"><%=row.sakan %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">المرجع:</span>
                                    <label class="form-control"><%=row.marga3 %></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">الخصائص:</span>
                                    <label class="form-control"><%=row.Khasa2iss %></label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer clearfix">

                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

<%} %>

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

