<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MenuLogin.aspx.cs" Inherits="pokedex_web.MenuLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <div class="col-12">
            <h3>Te Logueaste correctamente</h3>
            <hr />
        </div>

        <div class="col-4">
            <asp:Button Text="Pagina 1" Id="btnPagina1" OnClick="btnPagina1_Click" CssClass="btn btn-primary" runat="server" />
        </div>

        <div class="col-4">

            <%if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.ADMIN)
              {%>
                  <asp:Button Text="Pagina 2" Id="Button2" OnClick="Button2_Click" CssClass="btn btn-primary" runat="server" />
                  <p>Tenés que ser admin.</p>

            <%}%>
            
        </div>
    </div>
    
</asp:Content>
