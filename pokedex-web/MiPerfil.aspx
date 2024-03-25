<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="pokedex_web.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Mi perfil</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox Id="txtEmail" CssClass="form-control" TextMode="Email" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox Id="txtNombre" CssClass="form-control"  runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox Id="txtApellido" CssClass="form-control" TextMode="Password" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtFechaNacimiento" class="form-label">Fecha de nacimiento</label>
                <asp:TextBox Id="txtFechaNacimiento" TextMode="Date" CssClass="form-control" runat="server" />
                
            </div>
        </div>
        <div class="col-md-4">
            <div class="mb-3">
                <label class="form-label">Imagen de Perfil</label>
                <input type="file" id="txtImagen" runat="server" class="form-control" />
            </div>
            <asp:Image Id="imgNuevoPerfil" CssClass="img-fluid mb-3"  ImageUrl="https://www.cronobierzo.es/wp-content/uploads/2020/01/no-image.jpg" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <asp:Button Text="Guardar" ID="btnGuardar" OnClick="btnGuardar_Click" CssClass="btn btn-primary"  runat="server" />
            <a href="Default.aspx">Cancelar</a>
        </div>
    </div>
</asp:Content>
