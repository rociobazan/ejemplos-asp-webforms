using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pokedex_web
{
    public partial class Pagina2LoginAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.ADMIN)) 
            {
                Session.Add("Error", "No tienes permiso para ingresar a esta pantalla, necesitas ser admin");
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}