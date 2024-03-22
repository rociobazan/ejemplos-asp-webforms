<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="pokedex_web.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-4">
               <h2>Login</h2>
               <div class="mb-3">
                   <label class="form-label">Email</label>
                   <asp:TextBox Cssclass="form-control" Id="txtEmail" runat="server"  />
               </div>
               <div class="mb-3">
                   <label class="form-label">Password</label>
                   <asp:TextBox CssClass="form-control" ID="txtPassword" TextMode="Password" runat="server" />
               </div>
            <asp:Button Text="Login" CssClass="btn btn-primary" ID="btnLogin" OnClick="btnLogin_Click" runat="server" />
            <a href="/">Cancelar</a>
        </div>
    </div>
</asp:Content>
