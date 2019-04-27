<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HeroicApp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User List</title>

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
                    <h4 class="mb-3">
                        Heroic Data Access
                        <a href="Add.aspx" class="btn btn-sm btn-primary float-right">Add</a>
                    </h4>     
                    
                    <div class="form-group">
                        <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server" placeholder="Search users" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged" autofocus="true" />                        
                    </div>

                    <small class="text-muted mb-2 d-block">
                        <asp:Literal ID="litCount" runat="server" />
                    </small>

                    <asp:ListView ID="lv" runat="server">
                        <LayoutTemplate>
                            <table class="table table-hover table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>User Name</th>
                                        <th>Password</th>
                                        <th>Mobile</th>
                                        <th>Email</th>                                        
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("UserName") %></td>                                
                                <td><%# Eval("Password") %></td>
                                <td><%# Eval("Mobile") %></td>
                                <td><%# Eval("Email") %></td>
                                <td class="text-center">
                                    <a href="Edit.aspx?id=<%# Eval("ID") %>" class="btn btn-sm btn-warning">Edit</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
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
