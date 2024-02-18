<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="pokedex_web.FormularioPokemon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager Id="ScriptManager" runat="server" />

    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox CssClass="form-control" runat="server" Id="txtId"/>
            </div>

            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox CssClass="form-control" runat="server" Id="txtNombre"/>
            </div>

            <div class="mb-3">
                <label for="txtNumero" class="form-label">Número</label>
                <asp:TextBox CssClass="form-control" runat="server" Id="txtNumero"/>
            </div>

            
           
            <div class="mb-3">
                <label for="ddlTipo" class="form-label">Tipo</label>
                <asp:DropDownList runat="server" CssClass="form-control" Id="ddlTipo"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <label for="ddlDebilidad" class="form-label">Debilidad</label>
                <asp:DropDownList runat="server" CssClass="form-control" Id="ddlDebilidad"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Button Text="Aceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" Id="btnAceptar"/>
                <a href="PokemonLista.aspx">Cancelar</a>
                <asp:Button Text="Inactivar" Id="btnInactivar" CssClass="btn btn-warning" OnClick="btnInactivar_Click" runat="server" />
            </div>
        </div>

        <div class="col-6">
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripción</label>
                <asp:TextBox CssClass="form-control" TextMode="multiline" runat="server" Id="txtDescripcion"/>
            </div>
        

            <asp:UpdatePanel Id="UpdatePanel1" runat="server">
                <ContentTemplate>
                   <div class="mb-3">
                       <label for="txtImageUrl1" class="form-label">Url Imagen</label>
                       <asp:TextBox Id="txtImageUrl1" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtImageUrl1_TextChanged"    />
                   </div>
                       <asp:Image ImageUrl="https://editorial.unc.edu.ar/wp-content/uploads/sites/33/2022/09/placeholder.png" 
                           ID="imgPokemon" width="60%" runat="server" />

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="mb-3"> 
                        <asp:Button Text="Eliminar" Id="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger" runat="server" />
                    </div>
           
                    <%if (confirmaEliminacion) { %>
                        <div class="mb-3">
                            <asp:CheckBox Text="Confirmar Eliminación" Id="chkConfirmaEliminar" runat="server" />
                            <asp:Button Text="Eliminar" Id="btnConfirmaEliminar" OnClick="btnConfirmaEliminar_Click" CssClass="btn btn-outline-danger" runat="server" />
                        </div>

                    <%} %>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>     
    </div>


</asp:Content>
