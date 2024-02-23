using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio; 

namespace pokedex_web
{
    public partial class PokemonLista : System.Web.UI.Page
    {
        public bool filtroAvanzado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            filtroAvanzado = true ;
            PokemonNegocio negocio = new PokemonNegocio();
            Session.Add("listaPokemons", negocio.listarConSp());
            dgvPokemons.DataSource = Session["listaPokemons"];
            dgvPokemons.DataBind();
        }

        protected void dgvPokemons_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvPokemons.PageIndex = e.NewPageIndex;
            dgvPokemons.DataBind();
        }


        protected void dgvPokemons_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvPokemons.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioPokemon.aspx?id=" + id);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioPokemon.aspx");
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Pokemon> list = (List<Pokemon>)Session["listaPokemons"];
            List<Pokemon> listaFiltrada = list.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvPokemons.DataSource= listaFiltrada;
            dgvPokemons.DataBind();

        }


        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if(ddlCampo.SelectedItem.ToString() == "Números")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");

            }


        }

        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            filtroAvanzado = chkAvanzado.Checked;
            txtFiltro.Enabled = !filtroAvanzado;
            
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                dgvPokemons.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(), ddlCriterio.SelectedItem.ToString(), txtFiltroAvanzado.Text, ddlEstado.SelectedItem.ToString());
                dgvPokemons.DataBind();
                

            }
            catch (Exception ex)
            {

                Session.Add("Error", ex);
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            filtroAvanzado = false;
            txtFiltroAvanzado.Text = string.Empty;
            txtFiltro.Text = string.Empty;
        }
    }
}