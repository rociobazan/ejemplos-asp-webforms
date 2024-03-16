<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="pokedex_web.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-4">
               <h2>Crea tu perfil trainee</h2>
               <div class="mb-3">
                   <label class="form-label">Email</label>
                   <asp:TextBox Cssclass="form-control" Id="txtEmail" runat="server"  />
               </div>
               <div class="mb-3">
                   <label class="form-label">Password</label>
                   <asp:TextBox CssClass="form-control" ID="txtPassword" TextMode="Password" runat="server" />
               </div>
            <asp:Button Text="Registrarse" CssClass="btn btn-primary" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" runat="server" />
            <a href="/">Cancelar</a>
        </div>
    </div>

</asp:Content>
