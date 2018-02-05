<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Web._default2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-rtl.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.bpopup.min.js"></script>
    <style>
        .ui-widget.ui-widget-content
        {
            z-index:999999999999 !important;
        }
        .button.b-close, .button.bClose {
    border-radius: 7px 7px 7px 7px;
    box-shadow: none;
    font: bold 131% sans-serif;
    padding: 0 6px 2px;
    position: absolute;
    right: -7px;
    top: -7px;
    z-index:99999;
}
.button {
    background-color: #2b91af;
    border-radius: 10px;
    box-shadow: 0 2px 3px rgba(0,0,0,0.3);
    color: #fff;
    cursor: pointer;
    display: inline-block;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
}
    </style>
</head>
<body onload="OnChange('#segel','segels');OnChange('#FirstName','firstnames');OnChange('#MiddleName','middlenames');OnChange('#LastName','lastnames');OnChange('#MotherName','mothernames')">
    <center><img src="css/logo.jpeg" style="height:150px"/></center>
    <section class="content">
                    <div class="row" >
                        <div class="col-xs-12">
                            <div class="box" style="width:95%;margin-left:auto;margin-right:auto;padding:10px">
                                <div class="box-header">
                                     <h3 class="box-title"><div style="width:100px;float:right;margin-bottom:-25px"><a class="btn btn-block btn-primary" data-toggle="modal" data-target="#compose-modal" style="color:white;"><i class="fa fa-plus" style="color:white;"></i> إضافة أسماء</a></div><div style="float:right;margin-right:10px"><a href="logout.aspx" class="btn btn-danger"><i class="fa fa-lock" style="color:white;"></i> الخروج </a></div><div style="float:right;margin-right:10px">عدد الأشخاص: <%=list.Count %></div><div style="clear:right"></div><br/></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <%for (int i=0;i<list.Count;i++)
                                        {
                                            var row = list[i];
                                            %>
                                <div class="col-lg-4 col-sm-4" style="background-color:<%=i%2==0?"gray":"#d4d4d4"%>;color:<%=i%2==0?"white":"black"%>">
                                    <table dir="rtl" style="padding:10px">
                                        <tr><td>الاسم:</td><td><%=row.SearchList.FirstName %></td></tr>
                                        <tr><td>اسم الاب:</td><td><%=row.SearchList.MiddleName %></td></tr>
                                        <tr><td>الشهرة:</td><td><%=row.SearchList.LastName %></td></tr>
                                        <tr><td>اسم الام:</td><td><%=row.SearchList.MotherName %></td></tr>
                                        <tr><td>هوية الناخب:</td><td><%=row.SearchList.VoterID %></td></tr>
                                        <tr><td>طائفة اللائحة:</td><td><%=row.SearchList.ta2ifa %></td></tr>
                                        <tr><td>البلدة او الحي:</td><td><%=row.SearchList.street %></td></tr>
                                        <tr><td>رقم السجل:</td><td><%=row.SearchList.segel %></td></tr>
                                        <tr><td>الجنس:</td><td><%=row.SearchList.Gender %></td></tr>
                                        <tr><td>تاريخ الولادة:</td><td><%=string.Format("{0:dd/MM/yyyy}",row.SearchList.DOB) %></td></tr>
                                        <tr><td>رقم الهاتف:</td><td><%=row.Phone %></td></tr>
                                        <tr><td>البريد الإلكتروني:</td><td><%=row.Email %></td></tr>
                                        <tr><td>عنوان السكن:</td><td><%=row.sakan %></td></tr>
                                        <tr><td>المرجع:</td><td><%=row.marga3 %></td></tr>
                                        <tr><td>الخصائص:</td><td><%=row.Khasa2iss %></td></tr>
                                        
                                    </table>
                                </div>
                                    <%} %>
                                    </div>
                                </div>
                            </div></div></section>
    <div class="modal fade" id="compose-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-envelope-o"></i> إضافة أسماء</h4>
                    </div>
                    <form action="#" method="post" >
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">رقم السجل:</span>
                                    <div class="ui-widget">
                                    <input name="segel" id="segel"  type="text" onkeyup="this.value = parseArabic(this.value)" class="form-control" onfocus="OnChange('#segel','segels');OnChange('#FirstName','firstnames');OnChange('#MiddleName','middlenames');OnChange('#LastName','lastnames');OnChange('#MotherName','mothernames')" onchange="CompleteFilling()">
                                        </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">الاسم:</span>
                                    <div class="ui-widget">
                                    <input name="FirstName" id="FirstName" type="text" class="form-control" onfocus="OnChange('#segel','segels');OnChange('#FirstName','firstnames');OnChange('#MiddleName','middlenames');OnChange('#LastName','lastnames');OnChange('#MotherName','mothernames')" onchange="CompleteFilling()">
                                        </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">اسم الاب:</span>
                                    <div class="ui-widget">
                                    <input name="MiddleName" id="MiddleName" type="text" class="form-control" onfocus="OnChange('#segel','segels');OnChange('#FirstName','firstnames');OnChange('#MiddleName','middlenames');OnChange('#LastName','lastnames');OnChange('#MotherName','mothernames')" onchange="CompleteFilling()">
                                        </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">الشهرة:</span>
                                    <div class="ui-widget">
                                    <input name="LastName" id="LastName" type="text" class="form-control" onfocus="OnChange('#segel','segels');OnChange('#FirstName','firstnames');OnChange('#MiddleName','middlenames');OnChange('#LastName','lastnames');OnChange('#MotherName','mothernames')" onchange="CompleteFilling()">
                                        </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">اسم الام:</span>
                                    <div class="ui-widget">
                                    <input name="MotherName" id="MotherName" type="text" class="form-control" onfocus="OnChange('#segel','segels');OnChange('#FirstName','firstnames');OnChange('#MiddleName','middlenames');OnChange('#LastName','lastnames');OnChange('#MotherName','mothernames')">
                                        </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">البلدة او الحي:</span>
                                    
                                        <select id="street" name="street" class="form-control">
                                            <%foreach (var street in streets)
                                                { %>
                                            <option><%=street %></option>
                                            <%} %>
                                        </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">الجنس:</span>
                                    <select name="Gender" id="Gender" class="form-control">
                                        <option>ذكر</option>
                                        <option>اناث</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">تاريخ الولادة:</span>
                                    <input name="DOB" id="DOB" type="text" placeholder="MM/dd/yyyy" onkeyup="this.value = parseArabic(this.value)" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">رقم الهاتف:</span>
                                    <input name="Phone" id="Phone" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">البريد الإلكتروني:</span>
                                    <input name="Email" id="Email" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">عنوان السكن:</span>
                                    <input name="sakan" id="sakan" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">المرجع:</span>
                                    <input name="marga3" id="marga3" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">الخصائص:</span>
                                    <textarea name="Khasa2iss" id="Khasa2iss" class="form-control" rows="5" cols="5"></textarea>
                                </div>
                            </div>
                            
                        </div>
                        <div class="modal-footer clearfix">

                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> إلغاء</button>

                            <button type="button" class="btn btn-primary pull-left" onclick="AddRow()"><i class="fa fa-plus"></i> حفظ</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
    <div id="morethanOne" style="display:none;width:80%">
        <span class="button b-close"><span>X</span></span>
        <div class="content" id="contentMoreThanOne" style="padding:10px;background-color:white;min-height:400px;position:relative"></div>
    </div>
    <%
        //string segelstring = "";
        //foreach (var row in segels)
        //{
        //    segelstring += ",\"" + row + "\"";
        //}
        //if (segelstring != "")
        //    segelstring = segelstring.Substring(1);

        //string firstnamestring = "";
        //foreach (var row in firstnames)
        //{
        //    firstnamestring += ",\"" + row + "\"";
        //}
        //if (firstnamestring != "")
        //    firstnamestring = firstnamestring.Substring(1);

        //string lastnamestring = "";
        //foreach (var row in lastnames)
        //{
        //    lastnamestring += ",\"" + row + "\"";
        //}
        //if (lastnamestring != "")
        //    lastnamestring = lastnamestring.Substring(1);

        //string middlenamestring = "";
        //foreach (var row in middlenames)
        //{
        //    middlenamestring += ",\"" + row + "\"";
        //}
        //if (middlenamestring != "")
        //    middlenamestring = middlenamestring.Substring(1);

        //string mothernamestring = "";
        //foreach (var row in mothernames)
        //{
        //    mothernamestring += ",\"" + row + "\"";
        //}
        //if (mothernamestring != "")
        //    mothernamestring = mothernamestring.Substring(1);
        %>
    <script>
        function OnChange(field, type)
        {
            var segel = $("#segel").val();
            var FirstName = $("#FirstName").val();
            var MiddleName = $("#MiddleName").val();
            var LastName = $("#LastName").val();
            var MotherName = $("#MotherName").val();
            $.post("ajax/AutoComplete.ashx", { type: type, query: $(field).val(), segel:segel, FirstName:FirstName, MiddleName: MiddleName, LastName: LastName, MotherName:MotherName }, function (data) {
                $(field).autocomplete({
                    source: data
                });
            });
        }
       <%-- $(function () {
            var availableSegels = [
              <%=segelstring%>
            ];
            
            $("#segel").autocomplete({
                source: availableSegels
            });
            var availableFirstNames = [<%=firstnamestring%>];
            $("#FirstName").autocomplete({
                source: availableFirstNames
            });

            var availableLastNames = [<%=lastnamestring%>];
            $("#LastName").autocomplete({
                source: availableLastNames
            });

            var availableMiddleNames = [<%=middlenamestring%>];
            $("#MiddleName").autocomplete({
                source: availableMiddleNames
            });

            var availableMotherNames = [<%=mothernamestring%>];
            $("#MotherName").autocomplete({
                source: availableMotherNames
            });
        });--%>
        function AddRow()
        {
            var street = $("#street").val();
            var segel = $("#segel").val();
            var Gender = $("#Gender").val();
            var FirstName = $("#FirstName").val();
            var MiddleName = $("#MiddleName").val();
            var LastName = $("#LastName").val();
            var MotherName = $("#MotherName").val();
            var DOB = $("#DOB").val();
            var Phone = $("#Phone").val();
            var Email = $("#Email").val();
            var sakan = $("#sakan").val();
            var marga3 = $("#marga3").val();
            var Khasa2iss = $("#Khasa2iss").val();
            
            $.post("ajax/AddRow.ashx", { street: street, segel: segel, Gender: Gender, FirstName: FirstName, MiddleName: MiddleName, LastName: LastName, MotherName: MotherName, DOB: DOB, Phone: Phone, Email: Email, Khasa2iss: Khasa2iss, sakan: sakan, marga3: marga3 }, function (data) {
                if(data =="failure")
                {
                    alert("المعلومات المضافة غير متوفرة.\r\n الرجاء تصحيح المعلومات");
                }
                else
                {
                    location.href = "/";
                }
            });
        }
       
        function parseArabic(str) {
            var arab = ['\u0660', '\u0661', '\u0662', '\u0663', '\u0664', '\u0665', '\u0666', '\u0667', '\u0668', '\u0669'];
            var eng = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
            for (var i = 0; i < arab.length; i++) {
                str = str.replace(arab[i],eng[i]);
            }
            return str;
        }
        var bPop;
        function CompleteFilling()
        {
            var segel = $("#segel").val();
            var FirstName = $("#FirstName").val();
            var MiddleName = $("#MiddleName").val();
            var LastName = $("#LastName").val();
            if (segel != "" && FirstName != "" && MiddleName != "" && LastName != "")
                $.post("ajax/CompleteFilling.ashx", { segel: segel, FirstName: FirstName, MiddleName: MiddleName, LastName: LastName }, function (data) {
                    if (data.length > 1) {
                        var innerString = '';
                        for (var i = 0; i < data.length; i++) {
                            innerString += '<div class="col-lg-4 col-sm-4" style="background-color:' + (i % 2 == 0 ? 'gray' : '#d4d4d4') + ';color:' + (i % 2 == 0 ? 'white' : 'black') + ';cursor:pointer" onclick="FillThis(\'' + data[i].MotherName + '\',\'' + data[i].street + '\',\'' + data[i].Gender + '\',\'' + data[i].DOB + '\')"><table dir="rtl" style="padding:10px"><tr><td>الاسم:</td><td>' + data[i].FirstName + '</td></tr><tr><td>اسم الاب:</td><td>' + data[i].MiddleName + '</td></tr><tr><td>الشهرة:</td><td>' + data[i].LastName + '</td></tr><tr><td>اسم الام:</td><td>' + data[i].MotherName + '</td></tr><tr><td>هوية الناخب:</td><td>' + data[i].VoterID + '</td></tr><tr><td>طائفة اللائحة:</td><td>' + data[i].ta2ifa + '</td></tr><tr><td>البلدة او الحي:</td><td>' + data[i].street + '</td></tr><tr><td>رقم السجل:</td><td>' + data[i].segel + '</td></tr><tr><td>الجنس:</td><td>' + data[i].Gender + '</td></tr><tr><td>تاريخ الولادة:</td><td>' + data[i].DOB + '</td></tr></table></div>';
                        }
                        $("#contentMoreThanOne").html(innerString);
                        bPop = $('#morethanOne').bPopup({
                            speed: 450,
                            transition: 'slideDown',

                        });
                    }
                    else
                    {
                        for (var i = 0; i < data.length; i++) {
                            $("#MotherName").val(data[i].MotherName);
                            $("#sakan").val(data[i].street);
                            $("#Gender").val(data[i].Gender);
                            $("#DOB").val(data[i].DOB);
                        }
                    }
                    
                });
        }
        function FillThis(MotherName, street, Gendder, DOB)
        {
            $("#MotherName").val(MotherName);
            $("#sakan").val(street);
            $("#Gender").val(Gender);
            $("#DOB").val(DOB);
            bPop.close();
        }
    </script>
</body>
</html>
