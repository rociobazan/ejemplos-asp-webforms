<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PokemonLista.aspx.cs" Inherits="pokedex_web.PokemonLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista de pokemon</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label Text="Filtrar" runat="server" />
                <asp:TextBox Id="txtFiltro" runat="server" AutoPostBack="true" CssClass="form-control" OnTextChanged="txtFiltro_TextChanged" />
            </div>
        </div>
        <div class="col-3" style="display: flex; flex-direction:column; justify-content:flex-end;">
            <div class="mb-3">
                <asp:CheckBox Text="Filtro Avanzado" CssClass="" ID="chkAvanzado" AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged" runat="server"/>
            </div>
        </div>
        <div class="col-3" style="display: flex; flex-direction:column; justify-content:flex-end;">
            <div class="mb-3">
                <asp:Button Text="Limpiar" CssClass="btn btn-info" id="btnLimpiar" OnClick="btnLimpiar_Click"  runat="server" />
            </div>
        </div>
    </div>

    <%if (chkAvanzado.Checked)
      {%>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Campo" runat="server" />
                        <asp:DropDownList   ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" AutoPostBack="true"  CssClass="form-control" runat="server">
                            <asp:ListItem Text="Nombre" />
                            <asp:ListItem Text="Tipo" />
                            <asp:ListItem Text="Número" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Criterio" runat="server" />
                        <asp:DropDownList Id="ddlCriterio" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Filtro" runat="server" />
                        <asp:TextBox Id="txtFiltroAvanzado" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Estado" runat="server" />
                        <asp:DropDownList Id="ddlEstado" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Activo" />
                            <asp:ListItem Text="Inactivo" />
                            <asp:ListItem Text="Todos" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
       <div class="row">
           <div class="col-3">
               <div class="mb-3">
                   <asp:Button Text="Buscar" Id="btnBuscar" CssClass="btn btn-primary" runat="server" OnClick="btnBuscar_Click" />
               </div>
           </div>
       </div>
    <%}%>
    
    
    <asp:GridView ID="dgvPokemons" runat="server" CssClass="table" DataKeyNames="Id" 
        AutoGenerateColumns="false" OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged"
        OnPageIndexChanging="dgvPokemons_PageIndexChanging"  AllowPaging="true" PageSize="5">
        <Columns>
            <asp:BoundField headerText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Número" DataField="Numero" />
            <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
            <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
            <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍️" />
        </Columns>
    </asp:GridView>

    <asp:Button ID="btnAgregar" CssClass="btn btn-primary" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
    
    
</asp:Content>
