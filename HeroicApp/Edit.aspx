<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="HeroicApp.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Edit</title>

    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="container mt-5">
            <div class="row">
                <div class="col">
                    <h4 class="mb-3">Heroic Data Access Edit
                        <a href="Add.aspx" class="btn btn-sm btn-primary float-right">Add</a>
                    </h4>
                    <asp:Label ID="lbl" Text="" Visible="false" CssClass="alert alert-light" runat="server" />
                    <div class="form-group">
                        <label for="txtUserName">User Name</label>
                        <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="txtMobile">Mobile</label>
                        <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" />
                    </div>
                    <asp:HiddenField ID="hidID" runat="server" Value="0" />
                    <div class="form-group">
                        <asp:Button ID="btnSubmit" Text="Submit" CssClass="btn btn-primary" runat="server" OnClick="btnSubmit_Click" OnClientClick="return confirm('Are your sure you want to save changes?');" />
                        <asp:Button ID="btnDelete" Text="Delete" CssClass="btn btn-danger" runat="server" OnClick="btnDelete_Click" OnClientClick="return confirm('Are your sure you want to delete?');" />
                        <a href="Default.aspx" class="btn btn-secondary">Back</a>
                    </div>
                </div>
            </div>
        </div>

    </form>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
