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
            </div>
        </div>

        <div class="col-6">
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripción</label>
                <asp:TextBox CssClass="form-control" TextMode="multiline" runat="server" Id="txtDescripocion"/>
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


</asp:Content>
