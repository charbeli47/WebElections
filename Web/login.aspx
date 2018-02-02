<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Web.login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/styles.css" />
     <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="js/jquery-ui-1.10.3.min.js"></script>
    <script src="js/jquery-ui-1.10.3.min.js"></script>
    <script src="js/jquery.autocomplete.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
	<div class="login-container">
            <div id="output"></div>
            <div class="avatar"></div>
            <div class="form-box">
                <form action="" method="">
                    <input name="user" type="text" placeholder="إسم المستخدم">
                    <input name="pass" type="password" placeholder="كلمة السر">
                    <button class="btn btn-info btn-block login" type="submit">الدخول</button>
                </form>
            </div>
        </div>
        
</div>
    </form>
    <asp:Literal ID="respMsg" runat="server"></asp:Literal>
</body>
</html>
