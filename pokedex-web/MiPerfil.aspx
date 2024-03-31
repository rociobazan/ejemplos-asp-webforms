<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="pokedex_web.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validacion{
            color: red;
            font-size: 10px;
        }
    </style>
    <script>

        function validar() {

            const txtNombre = document.getElementById("txtNombre");

            if (txtNombre.value == "") {

                txtNombre.classList.add("is-invalid");
                ;
                return false;
            }
            txtNombre.classList.remove("is-invalid");
            

            return true;
        }
        
    </script>
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
                <asp:TextBox Id="txtNombre" ClientIDMode="Static" CssClass="form-control"  runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox ClientIDMode="Static" Id="txtApellido"  CssClass="form-control"  runat="server" />
                <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="El apellido es requerido" ControlToValidate="txtApellido" runat="server" />
               
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
            <asp:Button Text="Guardar" OnClientClick="return validar()" ID="btnGuardar" OnClick="btnGuardar_Click" CssClass="btn btn-primary"  runat="server" />
            <a href="Default.aspx">Cancelar</a>
        </div>
    </div>
</asp:Content>
